#include <CUnit/CUnit.h>
#include <CUnit/Console.h>

void sort(int array[], int num);
void test_sort_001(void);

int main() {
    CU_pSuite sort_suite;
    
    CU_initialize_registry();
    sort_suite = CU_add_suite("Sort", NULL, NULL);
    CU_add_test(sort_suite, "test_001", test_sort_001);
    CU_console_run_tests();
    CU_cleanup_registry();
    
    return 0;
}

void sort(int array[], int num){
    int i;
    int j;
    int val;
    
    for(i=0; i<(num-1); i++){
        for(j=(num-1); j>i; j--){
            if(array[j-1] > array[j]) {
                val=array[j];
                array[j] = array[j-1];
                array[j-1] = val;
            }
        }
    }
}

void test_sort_001 (void) {
    int array[] = {3};
    
    sort(array, 1);
    CU_ASSERT(array[0] == 3);
}