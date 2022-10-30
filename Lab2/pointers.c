#include<stdio.h> //included this for the 2nd activity
//added int main
int main(){
  int x, y, *px, *py;
  int arr[10];

printf("TPS question 2\n");
printf("%d\n", x); //empty garbage value
printf("%d\n", y); //empty garbage value
printf("%d\n\n", arr[0]); //more empty garbage value

printf("TPS question 4\n");
printf("%p\n", &x); //address
printf("%p\n\n", &y);//address

printf("TPS question 5\n");
x = 10;
y = 10;
px = &x;
py = &y;
printf("%p\n", px); //address
printf("%u\n", *px); //value
printf("%p\n", py); //address
printf("%u\n\n", *py); //value

printf("TPS question 6\n");
for(int i = 0 ; i <= 9 ; i++){
  printf("%d\n", *arr);//prints out the value of arr
  &arr += 4;//adds four bytes for integers
}

printf("\nTPS question 7\n");
  printf("%p\n", &arr );    //address
  printf("%p\n", &arr[0]);  //address

printf("\nTPS question 8\n");
  printf("%p\n", &arr); //address
  return 0;
}
