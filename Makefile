all: serial_output OMP_output Pthread_output

serial_output: LU_serial.cpp
	g++ -fopenmp LU_serial.cpp -o serial_output

OMP_output: LU_OMP.cpp
	g++ -fopenmp LU_OMP.cpp -o OMP_output

Pthread_output: LU_Pthread.cpp
	g++ -lpthread LU_Pthread.cpp -o Pthread_output

plot:
	clear
	sh plot_script.sh
	
