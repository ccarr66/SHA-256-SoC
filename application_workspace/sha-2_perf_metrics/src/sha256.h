#include <algorithm>
#include <cstdint>
#include <climits>

class SHA256
{
public:
    using word_ty = uint32_t;
    using bitLen_ty = size_t;

    static constexpr bitLen_ty byteLen = CHAR_BIT;
    static constexpr bitLen_ty blockLen = 512;
    static constexpr size_t wordLenInByte = sizeof(word_ty);
    static constexpr bitLen_ty wordLen = byteLen * wordLenInByte;
    static constexpr size_t blockLenInWord = blockLen / wordLen;

    static constexpr bitLen_ty endMarkerLen = 64;
    static constexpr size_t endMarkerLenInWord = endMarkerLen / wordLen;

    using block_ty = word_ty[blockLenInWord];

    word_ty resultHashValues[8] = {
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

    struct workingVariables { 
        word_ty a,b,c,d,e,f,g,h;
        workingVariables(const word_ty initVal[8]) : 
            a(initVal[0]),b(initVal[1]),c(initVal[2]),d(initVal[3]),
            e(initVal[4]),f(initVal[5]),g(initVal[6]),h(initVal[7])
        {}
    };

    void prepareMessageSchedule(const block_ty& block, word_ty* messageSchedule) 
    {
        for(size_t i = 0; i < 64; i++)
        {
            auto newWord = word_ty{0};
            if(i < 16)
                newWord = block[i];
            else
                newWord = SSIG1(messageSchedule[i - 2]) + messageSchedule[i - 7] + SSIG0(messageSchedule[i - 15]) + messageSchedule[i - 16];
                
            messageSchedule[i] = newWord;
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
        constexpr word_ty K[64] = {
            0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5,
            0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174,
            0xe49b69c1, 0xefbe4786, 0x0fc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da,
            0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x06ca6351, 0x14292967,
            0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85,
            0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070,
            0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3,
            0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2
        };

        word_ty messageSchedule[64];
        prepareMessageSchedule(block, messageSchedule);

        workingVariables currVar(resultHashValues);
        auto i = size_t{0};
        for(const auto& w : messageSchedule)
            processWorkingVars(currVar, w, K[i++]);

        resultHashValues[0] += currVar.a;
        resultHashValues[1] += currVar.b;
        resultHashValues[2] += currVar.c;
        resultHashValues[3] += currVar.d;
        resultHashValues[4] += currVar.e;
        resultHashValues[5] += currVar.f;
        resultHashValues[6] += currVar.g;
        resultHashValues[7] += currVar.h;
    }

public:
    //requires strData to point to an char array with len elements
    SHA256(const char* data, size_t dataLen)
    {
        constexpr auto maxLastBlockLen = bitLen_ty {blockLen - endMarkerLen};
        static_assert(maxLastBlockLen < blockLen);
        
        const auto dataBitLen = bitLen_ty{dataLen * CHAR_BIT};
        const auto lastBlockLen = (dataBitLen + 1) % blockLen;

        constexpr auto endMarkerLen   = bitLen_ty {64};
        auto numZeros = bitLen_ty {0};
        if(lastBlockLen > maxLastBlockLen)
            numZeros = blockLen - (lastBlockLen - maxLastBlockLen);
        else 
            numZeros = maxLastBlockLen - lastBlockLen;

        const auto totalLen = bitLen_ty {dataBitLen + 1 + numZeros + endMarkerLen};
        const auto numBlocks = size_t {totalLen / blockLen};
        
        block_ty currentblock = {0};
        for(auto b = 0u; b < numBlocks; b++)
        {
            copyDataToBlock(data, dataLen, currentblock, b);
            if(b == numBlocks - 1)
            {
                setEndMarker(currentblock, dataBitLen);
                setMessageEndBit(currentblock, dataBitLen);
            }
            performHash(currentblock);
        }
    }
};
