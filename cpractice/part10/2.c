#include <stdio.h>

struct WHETHER {
    int month;
    int precipitation;
};

void main(){
    struct WHETHER data[4] = { {1,49}, {2,60}, {3,115}, {4,130}};
    int i,j;
    
    for(i = 0; i < 4; i++){
        printf("%d月%5dmm\n", data[i].month, data[i].precipitation);
    }
}