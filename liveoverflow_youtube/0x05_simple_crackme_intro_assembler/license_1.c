#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if(argc==2) {
    printf("Checking Lisence: %s\n", argv[1]);
    if(strcmp(argv[1], "AAAA-Z10N-42-OK") == 0)
      printf("Access Granted!\n");
    else 
      printf("Access Denied!\n");
  }
  else {
    printf("Usage: %s <key>\n", argv[0]);
  }
  return 0;
}
