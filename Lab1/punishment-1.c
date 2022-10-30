#include <stdio.h>
int main()
{
printf("Enter the number of lines for the punishment:");
int lines = 0;
int typlin = 0;
scanf("%d", &lines);

if (lines <= 0) {
  printf("You entered an incorrect value for the number of lines!\n"); //no negatives
} else {
  printf("Enter the line for which we want to make a typo:");
  scanf("%d", &typlin);
  if (typlin < 0 || typlin > lines) {
    printf("You entered an incorrect value for the line typo!\n"); //no negatives
  }else{
    for (int i = 1; i < (lines + 1); i++) {
      if (i == typlin) {
        printf("C programming is the bet!\n"); //typo
      }else {
        printf("C programming is the best!\n");
      }//end 3rd if-else
    }//end for-loop
  }//2nd if
}//1st if-else
return 0;
}
