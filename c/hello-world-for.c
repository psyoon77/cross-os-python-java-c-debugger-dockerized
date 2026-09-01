#include <stdio.h>

int main(void) {
    printf("\n-------------\n");
    printf("Hello world!\n");
    printf("-------------\n\n");

    int nums[] = {1, 2, 3, 4, 5};
    int n = (int)(sizeof(nums) / sizeof(nums[0]));

    for (int i = 0; i < n; i++) {
        int v = nums[i];
        printf("i=%d, n=%d, n^2=%d\n", i, v, v * v);
    }

    printf("\n-------------\n\n");

    return 0;
}

// create a folder where executables of .c files will be saved
// cd c
// mkdir c-executables
//
// compile .c and run the executable
// cc -O0 -g hello-world-for.c -o c-executables/hello-world-for
// ./c-executables/hello-world-for