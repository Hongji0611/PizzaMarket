//Splash
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Center(
        child:Column( //컬럼 위젯 추가
          mainAxisAlignment: MainAxisAlignment.center, //세로축 가운데 정렬
          children: <Widget> [
            Image.asset("assets/images/logo.png"), //캐시 ExtendedImage 다시 해보기
            CircularProgressIndicator(color: Colors.white,) //로딩바
          ],)
      ),
    );
  }
}
