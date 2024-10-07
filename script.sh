#!/bin/bash

# Compile chương trình ask_user.c
gcc -o ask_user ask_user.c

# Kiểm tra tham số đầu vào có phải là thư mục không
if [ $# -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi

# Kiểm tra thư mục có tồn tại không
DIR=$1

if [ ! -d "$DIR" ]; then
    echo "Error: $DIR is not a directory."
    exit 1
fi

# Hàm đệ quy để duyệt thư mục và in các tệp có kích thước bằng 0
function check_zero_files {
    for file in "$1"/*; do
        if [ -d "$file" ]; then
            # Nếu là thư mục, gọi đệ quy
            check_zero_files "$file"
        elif [ -f "$file" ]; then
            # Nếu là file và có kích thước 0, in ra và hỏi người dùng có muốn xoá không
            if [ ! -s "$file" ]; then
                echo "[+] File $file has size 0"
                ./ask_user "$file"
            fi
        fi
    done
}

# Gọi hàm kiểm tra thư mục
check_zero_files "$DIR"
