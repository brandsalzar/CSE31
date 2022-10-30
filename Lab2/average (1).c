#include <stdio.h>

/*
    Read a set of values from the user.
    Store the sum in the sum variable and return the number of values read.
*/
int read_values(double* sum) { //(double* sum) used the pointer here
  int input=0, values=0;
  *sum = 0;       // set the value of sum to 0 here
  printf("Enter input values (enter 0 to finish):\n");
  scanf("%d",&input);// this is dereferenced : changed scanf("%d",&input);
  while(input != 0) {
    values++;
    *sum += input; //added sum to the value of pointer
    scanf("%d",&input);// and this is not scanf("%d",input); <-- this took 'int' not 'int*'
  }
  return values;
}

int main() {
  double sum=0;
  int values;
  values = read_values(&sum); //use the dereference as an argumetn
  printf("Average: %g\n",sum/values);
  //printf("Final sum: %f\n", sum);
  //printf("Final values: %d\n", values);
  return 0;
}
