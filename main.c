#include <stdio.h>

// function printMenu and return the choice of user
int printMenu( char* options[], int numOptions) {
    int optionChoosed;

    printf("Do you want to delete this file\n");
    fflush(stdout);
    for (int i = 1; i < numOptions; i++) {
        printf("%s\n", options[i]);
        fflush(stdout);
    }

    // enter the choice
    printf("Please, select your choice: ", numOptions);
    fflush(stdout);
    scanf("%d", &optionChoosed);

    // check if the choice is valid
    while (optionChoosed < 0 || optionChoosed >= numOptions) {
        printf("Please enter valid choice: ");
        fflush(stdout);
        scanf("%d", &optionChoosed);
    }

    return optionChoosed; // return the choice
}

int main(int argc, char* argv[]) {
    if(argc < 2) {
        printf("Please enter provide your menu\n");
        return -1;
    }

    return printMenu(argv, argc);
}