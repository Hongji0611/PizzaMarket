import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_market/home_screen.dart';
import 'package:pizza_market/splash_screen.dart';

import 'utils/logger.dart';

void main(){
  runApp(MyApp());
}

//stl = 상태변화가 없는 위젯
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder( //비동기
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(//페이드인아웃
            duration: Duration(microseconds: 900),
            child: _splashLodingWidget(snapshot),
          );
        });
  }

  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if(snapshot.hasError) {logger.d("error: splash-future"); return Text('Error');}
    else if(snapshot.hasData) {return HomeScreen();}
    else { return SplashScreen();}
  }
}

