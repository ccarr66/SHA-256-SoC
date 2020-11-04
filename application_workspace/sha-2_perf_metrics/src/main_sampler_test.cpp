/*****************************************************************//**
 * @file main_sampler_test.cpp
 *
 * @brief Basic test of nexys4 ddr mmio cores
 *
 * @author p chu
 * @version v1.0: initial release
 *********************************************************************/

// #define _DEBUG
#include "chu_init.h"
#include "sseg_core.h"
#include "sha256.h"

SsegCore sseg(get_slot_addr(BRIDGE_BASE, S8_SSEG));


int main() {
   sseg.set_dp(0);
   const auto hash = SHA256("abc", 3);
   constexpr auto ssegPerByte = 2;
   auto wordIdx = 0;
   while (1) {
      for(auto byteIdx = 0u; byteIdx < SHA256::wordLenInByte; byteIdx++)
      {
         const auto byte = (hash.resultHashValues[wordIdx] >> (byteIdx * SHA256::byteLen));
         const auto upperNibble = static_cast<int>((byte & 0xF0) >> (SHA256::byteLen / ssegPerByte));
         const auto lowerNibble = static_cast<int>(byte & 0x0F);

         sseg.write_1ptn(sseg.h2s(upperNibble), ssegPerByte * byteIdx + 1);
         sseg.write_1ptn(sseg.h2s(lowerNibble), ssegPerByte * byteIdx + 0);
      }
      sleep_ms(3000);
      wordIdx = (wordIdx + 1) % 8;
   } //while
} //main

