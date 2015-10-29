#include <stdio.h>

void printRow(int rowNum){
    int colCount;
    for(colCount = 1; colCount<=9; colCount++){
        printf(" %2d", colCount * rowNum);
    }
    printf("\n");
}

void main(){
    int i;
    for(i = 1; i <= 9; i++){
        printRow(i);
    }
}