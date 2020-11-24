#include <algorithm>
#include <cstdint>
#include <climits>

class SHA256
{
public:
    using word_ty   = uint32_t;
    using bitLen_ty = size_t;

    static constexpr bitLen_ty  byteLen = CHAR_BIT;
    static constexpr bitLen_ty  blockLen = 512;
    static constexpr size_t     wordLenInByte = sizeof(word_ty);
    static constexpr bitLen_ty  wordLen = byteLen * wordLenInByte;
    static constexpr size_t     blockLenInWord = blockLen / wordLen;

    static constexpr bitLen_ty  endMarkerLen = 64;
    static constexpr size_t     endMarkerLenInWord = endMarkerLen / wordLen;

    static constexpr size_t     hashLenInWord = 8;
    static constexpr size_t     messageSchedLenInWord = 64;

    using block_ty  = word_ty[blockLenInWord];

    word_ty resultHashValues[hashLenInWord] = {
        0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19
    };

    static_assert(blockLen % wordLen == 0); 
    static_assert(endMarkerLen % wordLen == 0); 

private:

    constexpr word_ty rotL(word_ty x, bitLen_ty n) 
    {
        return (x << n) | (x >> (wordLen - n));
    }

    constexpr word_ty rotR(word_ty x, bitLen_ty n) 
    {
        return (x >> n) | (x << (wordLen - n));
    }

    constexpr word_ty shR(word_ty x, bitLen_ty n) 
    {
        return (x >> n);
    }

    constexpr word_ty CH(word_ty x, word_ty y, word_ty z)
    {
        return (x & y) ^ (~x & z);
    }

    constexpr word_ty MAJ(word_ty x, word_ty y, word_ty z)
    {
        return (x & y) ^ (x & z) ^ (y & z);
    }

    constexpr word_ty BSIG0(word_ty x)
    {
        return rotR(x, 2) ^ rotR(x, 13) ^ rotR(x, 22);
    }

    constexpr word_ty BSIG1(word_ty x)
    {
        return rotR(x, 6) ^ rotR(x, 11) ^ rotR(x, 25);
    }

    constexpr word_ty SSIG0(word_ty x)
    {
        return rotR(x, 7) ^ rotR(x, 18) ^ shR(x, 3);
    }

    constexpr word_ty SSIG1(word_ty x)
    {
        return rotR(x, 17) ^ rotR(x, 19) ^ shR(x, 10);
    }

    void copyDataToBlock(const char* data, size_t dataLen, block_ty& block, size_t blockIdx)
    {
        auto wordIdx = size_t{0};
        auto byteInWordIdx = size_t{0};
        
        constexpr auto blockLenInByte = blockLenInWord * wordLenInByte;

        const auto beginPtr = data + blockLenInByte * blockIdx;
        const auto endPtr = data + std::min(blockLenInByte * (blockIdx + 1), dataLen);
        
        for(auto c = beginPtr; c < endPtr; c++)
        {
            const auto shiftAmt = CHAR_BIT * (wordLenInByte - 1 - byteInWordIdx);
            block[wordIdx] |= static_cast<word_ty>(*c) << shiftAmt;

            byteInWordIdx = (byteInWordIdx + 1) % wordLenInByte;
            if(byteInWordIdx == 0) 
                wordIdx++;
        }
        
    }

    void setEndMarker(block_ty& block, bitLen_ty dataBitLen)
    {
        constexpr auto maskWord = (static_cast<uint64_t>(1ul) << wordLen) - 1; //results in 64'h0000000100000000 => 64'h00000000ffffffff

        auto& endMarkerHighWord = block[blockLenInWord - endMarkerLenInWord + 0];
        auto& endMarkerLowWord = block[blockLenInWord - endMarkerLenInWord + 1];

        const auto endMarkerRaw = uint64_t{ dataBitLen };
        
        endMarkerLowWord = endMarkerRaw & maskWord;
        endMarkerHighWord = (endMarkerRaw >> wordLen) & maskWord;
        return;
    }

    void setMessageEndBit(block_ty& block, bitLen_ty dataBitLen)
    {
        const auto lastWordIdx = size_t{(dataBitLen % blockLen) / wordLen};
        const auto lastBitIdx = size_t{dataBitLen % wordLen};
        
        block[lastWordIdx] |= static_cast<word_ty>(0x80000000 >> lastBitIdx); 
    }

    struct workingVariables 
    { 
        word_ty vars[8];
        word_ty& a = vars[0];
        word_ty& b = vars[1];
        word_ty& c = vars[2];
        word_ty& d = vars[3];
        word_ty& e = vars[4];
        word_ty& f = vars[5];
        word_ty& g = vars[6];
        word_ty& h = vars[7];

        workingVariables(const word_ty initVal[8])
        {
            std::copy(initVal, initVal + hashLenInWord, vars);
        }
    };

    void prepareMessageSched(const block_ty& block, word_ty* messageSched) 
    {
        for(size_t w = 0; w < messageSchedLenInWord; w++)
        {
            auto newWord = word_ty{0};
            if(w < blockLenInWord)
                newWord = block[w];
            else
                newWord = SSIG1(messageSched[w - 2]) + messageSched[w - 7] + SSIG0(messageSched[w - 15]) + messageSched[w - 16];
                
            messageSched[w] = newWord;
        }
    }

    void processWorkingVars(workingVariables& wv, word_ty wt, word_ty K)
    {
            auto T1 = wv.h + BSIG1(wv.e) + CH(wv.e, wv.f, wv.g) + K + wt;
            auto T2 = BSIG0(wv.a) + MAJ(wv.a,wv.b,wv.c);
            wv.h = wv.g;
            wv.g = wv.f;
            wv.f = wv.e;
            wv.e = wv.d + T1;
            wv.d = wv.c;
            wv.c = wv.b;
            wv.b = wv.a;
            wv.a = T1 + T2;
    }

    void performHash(const block_ty& block)
    {
        constexpr word_ty K[messageSchedLenInWord] = {
            0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
            0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
            0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
            0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
            0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
            0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
            0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
            0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
        };

        word_ty messageSched[messageSchedLenInWord];
        prepareMessageSched(block, messageSched);

        workingVariables currVar(resultHashValues);
        auto kIdx = size_t{0};
        for(const auto& w : messageSched)
        {
            processWorkingVars(currVar, w, K[kIdx++]);
        }
        auto resultIdx = size_t{0};
        for(const auto& wv: currVar.vars)
        {
            resultHashValues[resultIdx++] += wv;
        }
    }

public:
    //requires strData to point to an char array with len elements
    SHA256(const char* data, size_t dataLen)
    {
        constexpr auto maxLastBlockLen = bitLen_ty {blockLen - endMarkerLen};
        static_assert(maxLastBlockLen < blockLen);
        
        const auto dataBitLen = bitLen_ty{dataLen * CHAR_BIT};
        const auto lastBlockLen = bitLen_ty{(dataBitLen + 1) % blockLen};

        const auto numZeros = 
            (lastBlockLen > maxLastBlockLen) ? 
            blockLen - (lastBlockLen - maxLastBlockLen) : maxLastBlockLen - lastBlockLen;

        const auto totalLen = bitLen_ty {dataBitLen + 1 + numZeros + endMarkerLen};
        const auto numBlocks = size_t {totalLen / blockLen};

        const auto messageEndBitBlockIdx = dataBitLen / blockLen;
        
        for(auto b = 0u; b < numBlocks; b++)
        {
            block_ty currentblock = {0};
            copyDataToBlock(data, dataLen, currentblock, b);
            
            if(b == messageEndBitBlockIdx)
                setMessageEndBit(currentblock, dataBitLen);
            if(b == numBlocks - 1)
                setEndMarker(currentblock, dataBitLen);
            
            performHash(currentblock);
        }
    }
};
