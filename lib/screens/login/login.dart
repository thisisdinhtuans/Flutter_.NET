import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stock_app/screens/commons/utilities.dart';
import 'package:stock_app/validators/EmailValidator.dart';
import 'package:stock_app/validators/PasswordValidator.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}
//cái _LoginScreenState nó được mở rộng từ cái LoginScreen ở trên<State>
class _LoginScreenState extends State<LoginScreen> {
  //tại sao phải khai báo trước như thế kia, vì mỗi khi giao diện thay đổi thì hàm build sẽ được load lại
  bool _showPassword=false; //This is state
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  //tại sao chỗ này lại gọi async thì khi mình gọi api sẽ có những hàm bất đồng bộ thì khi lúc gọi hàm đấy thì không thực hiện các việc khác
  void _login() async {
    //alert(context, 'You pressed Login ', AlertType.info);
    //_formKey kiểm tra, gọi current state
    //! là chắc chắn khác null, còn thay ! bằng ? thì giá trị đó có thể là null
    //hoặc viết theo cách sau
    //if(_formKey.currentState?.validate() ?? false) {} //tức hiểu là nếu null thì false
    //cách dưới là biết currentState khác null rồi thì chúng ta ! tức là khác null
    if(_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      alert(context, 'Login successfully', AlertType.info);
    }
    else {
      alert(context, 'Login failed', AlertType.error);
    }
  }
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
                    width:150,
                    height: 150,
                  ),
                  const SizedBox(height: 20,), //vì giá trị không thay đổi
                  _buildTextField(
                    hintText: 'Enter your email',
                    iconData: Icons.person,
                    controller: _emailController,
                    validator: EmailValidator.validate,
                  ),
                  SizedBox(height:20,),
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
                          icon: _showPassword ?
                          const Icon(Icons.visibility) :
                          const Icon(Icons.visibility_off))
                  ),
                  const SizedBox(height: 10,),
                  //tại sao lại nhét vào row, bởi vì là như thế thì Login và finger sẽ cùng một hàng
                  // nếu mà không cho vào Row thì mỗi cái sẽ cùng 1 hàng
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //nút Login
                      ElevatedButton(onPressed: _login,
                          child: Text('Login')),
                      IconButton(onPressed: null, icon: Icon(Icons.fingerprint)),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //chỗ text này là ký tự đặc biệt nên nó có dấu gạch \'
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(color:Colors.black, fontSize: 16),
                      ),
                      TextButton(
                        child: const Text(
                          'Register',
                          style: TextStyle(color: Colors.blue, fontSize: 16),
                        ),
                        //onPressed này thì khi bấm vào Register thì nó sẽ xuất hiện cái gì
                        onPressed: () {

                        },
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: const Text('Get smart OTP'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              side:const BorderSide(
                                  color: Colors.white,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(10)
                          )
                      )
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  Widget _buildTextField({
    required String hintText,
    required IconData iconData,
    Function(String)? onChanged,
    Widget? suffixIcon,
    bool obscureText = false,
    required TextEditingController controller,
    //trả về string, đầu vào string, giá trị trả về có thể null
    String? Function(String?)? validator
  }) {
    return  Container(
      //cái này được hiểu là độ rộng của màn hình trừ đi 50
      width: MediaQuery.of(context).size.width-50,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        children: [
          //khoảng cách giữa thằng icon và cái ô vuông
          const SizedBox(width: 10,),
          Icon(iconData),
          //khoảng trống giữa Icon và Hint text
          const SizedBox(width: 10,),
          Expanded(child: TextFormField (
            decoration: InputDecoration(
              //hintext là gợi ý
                hintText: hintText
            ),
            //onChanged để đoạn text có thể thay đổi.
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            validator: validator,
          )),
          //cái này show password ý
          if(suffixIcon!=null) suffixIcon
        ],
      ),
    );
  }
}