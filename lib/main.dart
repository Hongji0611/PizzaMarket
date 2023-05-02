import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_market/splash_screen.dart';

void main(){
  runApp(MyApp());
}

//stl = 상태변화가 없는 위젯
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen();
  }
}

