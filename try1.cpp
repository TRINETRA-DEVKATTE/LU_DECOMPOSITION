#include <iostream>
#include <omp.h>
#include <sys/time.h>
using namespace std;

int main()
{
    int sum=0;
int A[5] = {1,2,3,4,5};
#pragma omp parallel for collapse(2) schedule(static, 1)
    for (int i = 1; i < 6; i++)
    {
        sum = sum*A[i];
    }
    return 0;
}

// A[1][1] = 1
//k=0  A[1][1] = 10

//k=1   Read 10
//  (8,9) (10,11)

//th_1(k=0)
//th_2 (k=1)