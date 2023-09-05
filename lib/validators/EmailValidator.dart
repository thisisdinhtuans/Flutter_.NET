//validate email

class EmailValidator {
  static String? validate(String? value) {
    // Kiểm tra xem giá trị có rỗng hay không
    if (value==null||value.isEmpty) {
      return 'Please enter your email';
    }

    // Sử dụng một biểu thức chính quy để kiểm tra định dạng email
    // Đây là một biểu thức chính quy đơn giản, bạn có thể cải tiến nó nếu cần

    // final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp=RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      return 'Email Error';
    }

    return null; // Không có lỗi, email hợp lệ
  }
}
