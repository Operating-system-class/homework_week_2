#!/bin/bash
# Kiểm tra xem tham số có được cung cấp không
if [ -z "$1" ]; then
  echo "Vui lòng cung cấp đường dẫn đến thư mục."
  exit 1
fi

# Kiểm tra xem thư mục có tồn tại không
if [ ! -d "$1" ]; then
  echo "Thư mục $1 không tồn tại."
  exit 1
fi

# Tìm các file có kích thước 0
find "$1" -type f -size 0 -print | while read file; do
  # Hiển thị file tìm thấy
  echo "File: $file có kích thước 0 bytes."
  
  # Hiện menu cho người dùng lựa chọn
  PS3="Bạn có muốn xóa file này không? (1 = Có, 2 = Không): "
  select option in "Có" "Không"; do
    case $option in
      "Có")
        rm "$file"
        echo "Đã xoá file: $file"
        break
        ;;
      "Không")
        echo "Không xoá file: $file"
        break
        ;;
      *)
        echo "Lựa chọn không hợp lệ, vui lòng chọn lại."
        ;;
    esac
  done
done

echo "Hoàn tất."
