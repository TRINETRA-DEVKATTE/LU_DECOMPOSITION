#!/bin/bash

echo "Enter Your choice \n1.Serial LU decomposition \n2.LU Decomposition using open MP \n3.LU Decomposition using Pthread  " 
read -p "=>" input


if [ $input -eq 1 ]
then
     > data_serial.txt
     for n in 1000 2000 3000 4000 5000
          do
          ./serial_output $n >> data_serial.txt
          echo "serial code with n = $n done!"
     done
fi

if [ $input -eq 2 ]
then
     > data_OMP.txt
     for threads in 2 4 6 8
     do
          for n in 1000 2000 3000 4000 5000
          do
          cs=$(($n/$threads))
          ./OMP_output $n $cs $threads 121 >> data_OMP.txt
          echo "OMP code with $threads threads, N = $n done!"
     done
     done
fi

#data_OMP.txt contains rows in form <no of Threads> <dimension of matrix> <time taken>

if [ $input -eq 3 ]
then
     > data_pthread.txt
     for threads in 2 4 6 8
     do
          for n in 1000 2000 3000 4000 5000
          do
          ./Pthread_output $n $threads >> data_pthread.txt
          echo "Pthread code with $threads threads , N = $n done!"
     done
     done
fi
