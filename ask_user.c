#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void ask_user(char *filename) {
    char choice[10];

    printf("Do you want to delete the file '%s'? (y/n): ", filename);
    // fgets(choice, sizeof(choice), stdin);
    scanf("%s", choice);

    // Xóa dấu xuống dòng nếu có
    choice[strcspn(choice, "\n")] = 0;

    if (strcmp(choice, "y") == 0 || strcmp(choice, "Y") == 0) {
        if (remove(filename) == 0) {
            printf("=> File '%s' deleted successfully.\n", filename);
        } else {
            printf("=> Unable to delete the file '%s'.\n", filename);
        }
    } else {
        printf("=> File '%s' was not deleted.\n", filename);
    }

    // add endline
    printf("\n");
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    ask_user(argv[1]);

    return 0;
}
