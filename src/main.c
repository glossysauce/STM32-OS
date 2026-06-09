#include <stdint.h>

#define RCC_BASE 0x40021000
#define RCC_AHB2ENR_OFFSET 0x4C
#define RCC_AHB2ENR ( * (volatile uint32_t *)(RCC_BASE + RCC_AHB2ENR_OFFSET))

#define GPIOA_BASE 0x48000000
#define GPIO_MODER_OFFSET 0x00
#define GPIO_ODR_OFFSET 0x14

#define GPIOA_MODER ( * (volatile uint32_t *)(GPIOA_BASE + GPIO_MODER_OFFSET))
#define GPIOA_ODR ( * (volatile uint32_t *)(GPIOA_BASE + GPIO_ODR_OFFSET))


int main(void){
    RCC_AHB2ENR |= 1;
    GPIOA_MODER &= ~(0b11 << 10);
    GPIOA_MODER |= (0b01 << 10);

    while (1){
        GPIOA_ODR |= (0b01 << 5);
        for(int i = 0; i < 1000000; i++){}
        GPIOA_ODR &= ~(0b01 << 5);
        for(int i = 0; i < 1000000; i++){}
    }
}