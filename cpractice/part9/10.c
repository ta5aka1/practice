#include <stdio.h>

void swap(int *x, int *y){
    int tmp;
    tmp = *y;
    *y = *x;  
    *x = tmp;
}

void simpleSort(int *sortArray, int length){
    int i, j;
    for(i = 0; i < length; i++){
        for(j = length-1; j > i; j--){
            if(*(sortArray+i) > *(sortArray+j)) {
                swap( sortArray+i, sortArray+j);
            }
        }
    }
}

void main(){
    int array[10] = { 9, 8, 7, 4, 5, 6, 3, 2, 1, 0};
    
    simpleSort(array, 10);
    int i;
    for(i = 0; i < 10; i++){
        printf("%2d", array[i]);
    }
    printf("\n");
    
    int array2[8] = { 7, 5, 6, 0, 3, 3, 1, 2};
    simpleSort(array2, 8);
    for(i = 0; i < 8; i++){
        printf("%2d", array2[i]);
    }
    printf("\n");
}