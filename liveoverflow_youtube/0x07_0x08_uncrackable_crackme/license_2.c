#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  if(argc==2) {
    int sum = 0;
    printf("Checking Lisence: %s\n", argv[1]);
    for(int i=0; i<strlen(argv[1]); i++) {
      sum += (int)argv[1][i];
    }
    
    if(sum == 916)
      printf("Access Granted!\n");
    else 
      printf("Access Denied!\n");
  }
  else {
    printf("Usage: %s <key>\n", argv[0]);
  }
  return 0;
}
