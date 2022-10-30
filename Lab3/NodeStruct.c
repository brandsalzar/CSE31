
#include <stdio.h>
#include <stdlib.h>
#include <malloc.h>

struct Node {
    int iValue;
    float fValue ;
    struct Node *next;
};

int main() {

    struct Node *head = (struct Node*) malloc(sizeof(struct Node));
    head->iValue = 5;
    head->fValue = 3.14;

	// Insert extra code here
	printf("Address of head: %p\n", &head);//address of head
  printf("Value of head: %d\n", head);//value of head
  printf("Address of iValue: %p\n", &head->iValue);//address of iValue
  printf("Value of iValue: %d\n", head->iValue); //value of ivalue
  printf("Address of fValue: %p\n", &head->fValue);//address of fValue
  printf("Address of fValue: %f\n", head->fValue);//Value fValue
  printf("where head points next: %p\n", &head->next);//next pointed by head

	return 0;
}
