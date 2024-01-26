import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/screens/commons/utilities.dart';
import 'package:stock_app/screens/home/home.dart';
import 'package:stock_app/screens/splash/splash.dart';
import 'package:stock_app/validators/EmailValidator.dart';
import 'package:stock_app/validators/PasswordValidator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

Future<bool> login(String email, password) async {
  var client = http.Client();
  try {
    var url = Uri.http('10.0.2.2:5280', '/api/User/login');
    var headers = {'Content-Type': 'application/json'};
    var body = convert.jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await client.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Success');
      return true;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return false;
    }
  } catch (error) {
    print('Error: $error');
    return false;
  } finally {
    client.close();
  }
  // try {
  //   final Map<String, dynamic> data = {
  //     'email': email,
  //     'password': password,
  //   };

  //   final response = await http.post(
  //     Uri.parse('https://localhost:7070/api/user/login'),
  //     headers: {
  //       "Access-Control-Allow-Origin": "*",
  //       'Content-Type': 'application/json',
  //       'Accept': '*/*'
  //     },
  //     body: jsonEncode(data), // Chuyển đổi dữ liệu thành JSON
  //   );

  //   if (response.statusCode == 200) {
  //     print('account created');
  //   } else {
  //     print('failed');
  //   }
  // } catch (e) {
  //   print(e.toString());
  // }
}

//cái _LoginScreenState nó được mở rộng từ cái LoginScreen ở trên<State>
class _LoginScreenState extends State<LoginScreen> {
  //tại sao phải khai báo trước như thế kia, vì mỗi khi giao diện thay đổi thì hàm build sẽ được load lại
  bool _showPassword = false; //This is state

  final _formKey = GlobalKey<FormState>();
  //tại sao chỗ này lại gọi async thì khi mình gọi api sẽ có những hàm bất đồng bộ thì khi lúc gọi hàm đấy thì không thực hiện các việc khác
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // để cho nền background vào thì chúng ta sử dụng Stack <để xếp chồng>
      // nằm dưới cùng là một ảnh nền
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
            //chỗ nào cần validate dữ liệu thì có Form vào
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 150,
                    height: 150,
                  ),
                  SizedBox(
                    height: 20,
                  ), //vì giá trị không thay đổi
                  _buildTextField(
                    hintText: 'Enter your email',
                    iconData: Icons.person,
                    controller: _emailController,
                    validator: EmailValidator.validate,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _buildTextField(
                      hintText: 'Enter your password',
                      iconData: Icons.key,
                      obscureText: !_showPassword,
                      controller: _passwordController,
                      validator: PasswordValidator.validate,
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                          icon: _showPassword
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off))),
                  const SizedBox(
                    height: 10,
                  ),
                  //tại sao lại nhét vào row, bởi vì là như thế thì Login và finger sẽ cùng một hàng
                  // nếu mà không cho vào Row thì mỗi cái sẽ cùng 1 hàng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nút Login
                      GestureDetector(
                        onTap: () async {
                          // Đặt hàm xử lý login vào đây
                          bool loginSuccess = await login(
                              _emailController.text.toString(),
                              _passwordController.text.toString());
                          if (loginSuccess) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()),
                            );
                          } else {
                            const snackBar = SnackBar(
                              content: Text('Error Account or Password'),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        child: Text('Login'),
                      ),

                      // IconButton với sử dụng vân tay
                      IconButton(
                        onPressed: () {
                          // Đặt hàm xử lý khi nhấn vào IconButton vào đây
                        },
                        icon: Icon(Icons.fingerprint),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //chỗ text này là ký tự đặc biệt nên nó có dấu gạch \'
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        //onPressed này thì khi bấm vào Register thì nó sẽ xuất hiện cái gì
                        onPressed: () {},
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      child: const Text('Get smart OTP'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 1),
                              borderRadius: BorderRadius.circular(10))))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData iconData,
      Function(String)? onChanged,
      Widget? suffixIcon,
      bool obscureText = false,
      required TextEditingController controller,
      //trả về string, đầu vào string, giá trị trả về có thể null
      String? Function(String?)? validator}) {
    return Container(
      //cái này được hiểu là độ rộng của màn hình trừ đi 50
      width: MediaQuery.of(context).size.width - 50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          //khoảng cách giữa thằng icon và cái ô vuông
          const SizedBox(
            width: 10,
          ),
          Icon(iconData),
          //khoảng trống giữa Icon và Hint text
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: TextFormField(
            decoration: InputDecoration(
                //hintext là gợi ý
                hintText: hintText),
            //onChanged để đoạn text có thể thay đổi.
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
          )),
          //cái này show password ý
          if (suffixIcon != null) suffixIcon
        ],
      ),
    );
  }
}
