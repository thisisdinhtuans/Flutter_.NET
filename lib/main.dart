import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_package/splash_screen_package.dart';
import 'package:stock_app/screens/home/home.dart';
import 'package:stock_app/screens/login/login.dart';
import 'package:stock_app/screens/splash/splash.dart';
// import 'package: splash_screen_package/splash_screen_package.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //khởi tạo sharedPrreferences để dùng cho cả app, khi nào cần dùng thì gọi SharedPreferences.getInstance() mang đi.
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
Future<void> checkLoginStatus(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Lấy trạng thái đăng nhập
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  await Future.delayed(const Duration(seconds: 1));
  if(isLoggedIn) {
    //Đã đăng nhập, chuyển sang màn hình HomeScreen
    //pushReplacement tức là màn hình đó thay thế luôn chứ khoong đẩy màn Home vào trong Stack, kiểu thay thế xếp chống lên nhau nhưng đây pushReplacement tức là thay thế luôn
    if(context.mounted) {
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
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(
          title: 'Splasssss',
          checkLoginStatus: checkLoginStatus),
      // home: LoginScreen(),
      // home: HomeScreen(),
    );
  }
}

