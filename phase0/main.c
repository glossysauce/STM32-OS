#include <stdint.h>

#define RCC_BASE 0x40021000
#define RCC_AHB2ENR_OFFSET 0x4C
#define RCC_AHB2ENR ( * (volatile uint32_t *)(RCC_BASE + RCC_AHB2ENR_OFFSET))

int main(void){
    RCC_AHB2ENR |= 1;
}