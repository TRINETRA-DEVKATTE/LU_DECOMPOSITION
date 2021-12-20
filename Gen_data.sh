#!/bin/bash

g++ -fopenmp LU_OMP1.cpp -o output
> data.txt

for threads in 2 4 6 8
do
     for n in 1000 2000 3000 4000 5000 6000
     do
        ./output $n 50 $threads 121 >> data.txt
         echo "$threads $n done!"
    done
done

#data.txt contains rows in form <no of Threads> <dimension of matrix> <time taken>