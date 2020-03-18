AVR=avr-gcc
MMCU=atmega328p 
OBJCOPY=avr-objcopy
TARG=test
CFLAGS= -mmcu=$(MMCU) -Wall -g -Os -Werror -lm
LFLAGS= -mmcu=$(MMCU) -Wall -g -Os -Werror

SRCS=main.c
OBJS=$(SRCS:.c=.o)


all: $(TARG)

$(TARG):$(OBJS)
	$(AVR) $(LFLAGS) -o $@.elf $(OBJS) -lm
	$(OBJCOPY) -O binary -R .eeprom -R .nwram $@.elf $@.bin
	$(OBJCOPY) -O ihex -R .eeprom -R .nwram $@.elf $@.hex
	
%.o: %.c
	$(AVR) $(CFLAGS) -c -o $@ $(SRCS)

clean:
	rm -f *.elf *.bin *.hex  $(OBJS) *.map

