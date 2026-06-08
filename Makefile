CC = arm-none-eabi-gcc
OBJCOPY = arm-none-eabi-objcopy 
CFLAGS = -mcpu=cortex-m4 -mthumb -mfloat-abi=soft -O0 -g
LDFLAGS = -T linker.ld -nostdlib -Wl,--gc-sections
TARGET = blink

SRCS = src/main.c startup.s

.PHONY: all clean flash
all: 
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCS) -o $(TARGET).elf
	$(OBJCOPY) -O binary $(TARGET).elf $(TARGET).bin


clean:
	rm -f $(TARGET).elf $(TARGET).bin

flash:
	openocd -f interface/stlink.cfg -f target/stm32l4x.cfg -c "program $(TARGET).elf verify reset exit"


