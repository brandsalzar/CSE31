#include <stdio.h>
#include <malloc.h>

void printArray(int**, int);

int main() {
	int i = 0, j = 0, n = 5;
	int **arr = (int**)malloc(n * sizeof(int*));

	// (3) Add your code to complete allocating and initializing the 2-D array here. The content should be all 0.
for(int i = 0; i < n; i++){
	*(arr+i) = (int*)malloc(n*sizeof(int*));//allocate memory
	for(int j = 0; j < n; j++){
		*(*(arr + i) + j) = 0;//column
	}//end for loop 2
}//end for loop 1

    // This will print our your array
	printArray(arr, n);

    // (6) Add your code to make arr a diagonal matrix
		for( int i = 0; i < n; i++){
					for( int j = 0; j < n; j++){
				if(j == i)
					*(*(arr + i) + j) = i +1 ;
			}//end for loop 2
			//printf("\n");// breaks
		}//end for loop 1


	// (7) All printArray to print array
    printArray(arr, n);

	return 0;
}

void printArray(int ** array, int size){
    // (5) Implement your printArr here
		int j, i;
		for( int i = 0; i < size; i++){
					for( int j = 0; j < size; j++){
				printf("%d", *(*(array + i) + j));//print
			}//end for loop 2
			printf("\n");
		}//end for loop 1

		printf("\n");
}
