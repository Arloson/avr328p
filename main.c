#include <avr/io.h>



int main(void)
{
	DDRD = 0xFF;
	PORTD = 0xFF;


	while(1);

	return 0;
}
