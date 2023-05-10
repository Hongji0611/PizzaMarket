import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_market/router/locations.dart';
import 'package:pizza_market/screens/home_screen.dart';
import 'package:pizza_market/screens/splash_screen.dart';

import 'utils/logger.dart';

final _routerDelegate = BeamerDelegate(
    locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()])
);

void main() {
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
          return AnimatedSwitcher( //페이드인아웃
            duration: Duration(microseconds: 900),
            child: _splashLodingWidget(snapshot),
          );
        });
  }

  StatelessWidget _splashLodingWidget(AsyncSnapshot<Object> snapshot) {
    if (snapshot.hasError) {
      logger.d("error: splash-future");
      return Text('Error');
    }
    else if (snapshot.hasData) {
      return RadishApp();
    }
    else {
      return SplashScreen();
    }
  }
}

class RadishApp extends StatelessWidget {
  const RadishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( //Beamer에게 모든 페이지 이동권한 부여
      debugShowCheckedModeBanner: false,
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate, //Beamer 인스턴스 명
    );
  }
}


