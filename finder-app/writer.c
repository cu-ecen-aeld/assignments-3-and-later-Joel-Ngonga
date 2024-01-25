#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>
#include <fcntl.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[]){
  if (argc != 3) {// you have entered more or less than 2 arguments
  	printf("error follow usage below");
 	fprintf(stderr, "Usage: %s <filename> <filecontent>\n", argv[0]);
        exit(EXIT_FAILURE);
     }
  const char *filename = argv[1];
  const char *filecontent = argv[2];
  
  // setup system log
  
  openlog("writer",LOG_PID | LOG_CONS, LOG_USER);
  
  // LOG MESSAGE WITH LOG_DEBUG LEVEL 
  syslog(LOG_DEBUG, "writing '%s' to '%s'",filecontent, filename);
  
  //open file for writing
  int file = open (filename, O_WRONLY | O_CREAT | O_TRUNC, S_IRUSR | S_IWUSR | S_IRGRP |S_IROTH);
  
  if (file == -1) {
     // LOG unexpected error with LOG_ERR level
     printf("error file not opened");
     syslog(LOG_ERR, " COULD NOT OPEN FILE");
     closelog();
     exit(EXIT_FAILURE);
     }
  // write content to file
  //fprintf(file, "%s", filecontent);
  ssize_t byteWritten = write(file,filecontent,strlen(filecontent));
  if (byteWritten == -1){
     printf("error file not written");
     exit(EXIT_FAILURE);
    }
    close(file);

    // Close syslog
    closelog();
    //printf("all good");
   syslog(LOG_ERR, "all good");
    return EXIT_SUCCESS;
   }
