#include <stdio.h>

// Hàm hiển thị menu và trả về lựa chọn của người dùng
int printMenu(const char* options[], int numOptions) {
    int optionChoosed;

    printf("Do you want to delete this file\n");
    fflush(stdout);
    for (int i = 0; i < numOptions; i++) {
        printf("%d. %s\n", i + 1, options[i]);
        fflush(stdout);
    }

    // Nhập lựa chọn của người dùng
    printf("Please, select your choice: ", numOptions);
    fflush(stdout);
    scanf("%d", &optionChoosed);

    // Kiểm tra xem lựa chọn có hợp lệ không
    while (optionChoosed != 0 && optionChoosed != 1) {
        printf("Please enter 0 or 1 to handle this file");
        fflush(stdout);
        scanf("%d", &optionChoosed);
    }

    return optionChoosed; // Trả về lựa chọn của người dùng
}

int main() {
    // Tạo mảng chứa các lựa chọn của menu
    const char* menuOptions[] = {
        "1: Yes",
        "0: No"
    };

    return printMenu(menuOptions, 2);
}
