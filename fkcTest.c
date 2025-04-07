#include "types.h"
#include "stat.h"
#include "user.h"

int main(void){
  int count = fkc(1);
  printf(1, "number of forks when program starts: %d\n", count);

  //first two forks in the program
  if(fork() > 0){
  	if(fork() >0){
	
	//parent process
	count = fkc(1);
	printf(1, "number of forks after two more forks: %d\n", count);

	//resetting counter
	fkc(0);
	printf(1, "number of forks after count cleared: %d\n", fkc(1));

	//three more forks
	if(fork() >0){
	if(fork()>0){	
		if(fork()>0){
			//parent process
			count = fkc(1);
			printf(1, "number of forks after three more forks: %d\n", count);
			
			//wait for childrens
			wait();
			wait();
			wait();
			wait();
			wait();	
			wait();
			}
		      }
	            }
	        }
            }
	exit();
}

