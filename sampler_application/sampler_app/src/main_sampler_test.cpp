#include "chu_init.h"
#include "timer_core.h"
#include "sha256.h"

TimerCore timer(get_slot_addr(BRIDGE_BASE, S0_SYS_TIMER));

int main()
{
    const volatile char* str1 = "abc";
    const volatile char* str2 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZzyxwvutsrqponmlkjihgfedcba9876543210";
   /*  
    while(1)
    {
        timer.pause();
        timer.clear();
        timer.go();
        auto hash = SHA256(str1, 3);
        timer.pause();

        const auto tickCount = timer.read_tick();
        uart.disp("\nClock Cycles: ");
        uart.disp((int)(tickCount));
        uart.disp("\tHash val: ");
        uart.disp((int)(hash.resultHashValues[0]));
        timer.go();
        sleep_ms(500);
    } */

   /*  while(1)
    {

        const auto t0 = now_us();
        auto hash = SHA256(str1, 3);
        const auto tDelta = now_us() - t0;
     
        uart.disp("\nAverage exec time (us)2: ");
        uart.disp((int)(tDelta));
        uart.disp("\tHash val: ");
        uart.disp((int)(hash.resultHashValues[0]));
        sleep_ms(500);
    } */
    return 0;
}

     