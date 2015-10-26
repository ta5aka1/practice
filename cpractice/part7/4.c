#include <stdio.h>

void main()
{
    char sbinary[17];
    int value;
    int i;
    
    printf("input number:"); scanf("%d", &value);
    
    for(i = 15; i>= 0; i--) {
        sbinary[i] = '0' + ( value % 2);
        value /= 2;
    }
    
    sbinary[16] = 0;
    printf("%s\n", sbinary);
}