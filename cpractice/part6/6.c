#include <stdio.h>

void main(){
    int kuku[9][9];
    int i,j;
    
    for(i = 0; i < 9; i++) {
        for(j = 0; j < 9; j++) {
            kuku[i][j] = (i+1)*(j+1);
        }
    }
    
    for(i =0; i<9; i++){
        for(j=0; j<9; j++){
            printf(" %2d", kuku[i][j]);
        }
        printf("\n");
    }
}