import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart.dart';

class SplashScreen extends StatelessWidget {
  // final int x;
  // Splash({required this.x});
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
                      image:DecorationImage(
                          image: AssetImage('assets/images/logo.png')
                      )
                  ),
                ),
              ),
              SizedBox(height: 30,),
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