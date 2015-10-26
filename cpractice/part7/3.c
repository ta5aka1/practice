#include <stdio.h>
void main()
{
    char s = 'a';
    int rownum = 0;
    int i,counter;
    
    printf("input row number:");
    scanf("%d", &rownum);
    
    counter = 0;
    for(i = 0; i < 26; i++, counter++ ){
        if(counter >= rownum){
            printf("\n");
            counter = 0;
        }
        printf("%c", s + i);
    }
    printf("\n");
}