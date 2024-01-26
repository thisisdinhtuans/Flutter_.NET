import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stock_app/screens/home/home.dart';
import 'package:stock_app/screens/login/login.dart';

// import 'package:flutter/material.dart.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () async {
      checkLoginStatus(context);
    });
  }

  Future<void> checkLoginStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Lấy trạng thái đăng nhập
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    await Future.delayed(const Duration(seconds: 1));
    if (isLoggedIn) {
      //Đã đăng nhập, chuyển sang màn hình HomeScreen
      //pushReplacement tức là màn hình đó thay thế luôn chứ khoong đẩy màn Home vào trong Stack, kiểu thay thế xếp chống lên nhau nhưng đây pushReplacement tức là thay thế luôn
      if (context.mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } else {
      if (context.mounted) {
        //Chưa đăng nhập thì chuyển sang màn hình LoginScreen

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.blue,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'))),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                //"This is splash, x = ${this.x}",
                'This is splash 11',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
