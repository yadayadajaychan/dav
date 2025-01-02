#include <stdint.h>
#include <stdio.h>
unsigned lfsr_fib(void)
{
    uint16_t start_state = 0;
    uint16_t lfsr = start_state;
    uint16_t bit;                    /* Must be 16-bit to allow bit<<15 later in the code */
    unsigned period = 0;

    do
    {
        printf("%u\n", lfsr);
        /* taps: 16 14 13 11; feedback polynomial: x^16 + x^14 + x^13 + x^11 + 1 */
        bit = ((lfsr >> 15) ^ (lfsr >> 13) ^ (lfsr >> 12) ^ (lfsr >> 10)) & 1u;
	// XNOR
	bit = !bit;
        lfsr = (lfsr << 1) | bit;
        ++period;
    }
    while (lfsr != start_state);

    return period;
}

int main()
{
	printf("Period: %u\n", lfsr_fib());
}
