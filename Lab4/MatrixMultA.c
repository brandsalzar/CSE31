
#include <stdio.h>
#include <stdlib.h>

int** matMult(int **a, int **b, int size){
	// (4) Implement your matrix multiplication here. You will need to create a new matrix to store the product.
		int **matC = (int**)malloc(size * sizeof(int*));

	for(int i=0; i < size; i++){
		*(matC+i) = (int*)malloc(size * sizeof(int));

		for(int j=0; j<size; j++){
			*(*(matC + i)+ j) = 0;

			for(int k =0; k < size; k++){
				*(*(matC + i)+ j) += *(*(a + i) + k) * (*(*(b + k) + j));
			}
		}
	}

return matC;
}

void printArray(int **arr, int n){
	// (2) Implement your printArray function here
	for(int i=0; i<n; i++){
		for(int j=0; j<n;j++){
			printf("%d", *(*(arr + i)+j));
		}
		printf("\n");
	}

	printf("\n");

}

int main() {
	int n = 5;
	int **matA, **matB, **matC;
	// (1) Define 2 n x n arrays (matrices).
	matA = (int**)malloc(n * sizeof(int*));
	matB = (int**)malloc(n * sizeof(int*));
	matC = (int**)malloc(n * sizeof(int*));


	for(int i =0; i < n; i++){
		*(matA+i) = (int*)malloc(n * sizeof(int*));
		*(matB+i) = (int*)malloc(n * sizeof(int*));
		*(matC+i) = (int*)malloc(n * sizeof(int*));
		for(int j =0; j < n; j++){
			*(*(matA + i) + j) = i + 1;
			*(*(matB + i) + j) = i;
			*(*(matC + i) + j) = 0;
		}
	}


	// (3) Call printArray to print out the 2 arrays here.
	printf("Array 1: \n");
	printArray(matA, n);
	printf("Array 2: \n");
	printArray(matB, n);


	//(5) Call matMult to multiply the 2 arrays here.
	matC = matMult(matA, matB, n);

	//(6) Call printArray to print out resulting array here.
	printf("Array 3: \n");
	printArray(matC, n);


	return 0;
}
