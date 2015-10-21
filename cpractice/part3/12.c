#include <stdio.h>

void main()
{
    int age;
    printf("How old are you? :");
    scanf("%d", &age);
    printf("%d days ago, you was born.", age * 365);
}