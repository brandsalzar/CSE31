	#include <stdio.h>

int main() {
	int i;
	int four_ints[4];
	char* four_c;

	for(i=0; i<4; i++)
        four_ints[i] = 2;

	printf("%x\n", four_ints[0]);//tps 1

    four_c = (char*)four_ints;

	for(i=0; i<4; i++)
        four_c[i] = 'A'; // ASCII value of 'A' is 65 or 0x41 in Hex.


    // Add your code for the exercises here:
		printf("%x\n", four_ints[0]);//tps 2-3    prints in int  : 2

		printf("%x\n", four_ints[1]);//tps 4			prints in char :41414141

		printf("%x\n", four_c[0]);   //tps 5a
		printf("%x\n", four_c[1]);
		printf("%p\n", four_c);      //tps 5b-c   prints addresses at index 1
		printf("%p\n", four_ints);   //tps 5b-c   prints addresses at index 1

printf("\nQuestion 7\n");
		for(int i = 0; i < 4; i++){//tps 6 prints all addresses for four_ints
				printf("Address: %p\n", &four_ints+i );
				printf("Hexadecimal: %x\n", four_ints[i]);
			}
printf("\nQuestion 8\n");
			for(int i = 0; i < 4; i++){//tps 6 prints all addresses for four_c
					printf("%p\n", &four_c[i] );
					printf("%c\n", four_c[i]);
				}

	return 0;

}
