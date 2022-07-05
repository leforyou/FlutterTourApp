import 'dart:async'; //定时器需要引用该依懒

import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  /*
  Flutter Dart late
    1）显式声明一个非空的变量，但不初始化。
      如果不加late关键字，类实例化时此值是不确定的，无法通过静态检查，加上late关键字可以通过静态检查，但由此会带来运行时风险。
    2）延迟初始化变量。
      如果这个变量没有被使用的话就不会被初始化，初始化语句不会执行。
  */
  late Timer _timer; //定时器变量
  //生命周期函数
  @override
  void initState() {
    super.initState();
    _jumpToHomePage();
  }

  //生命周期函数
  @override
  void dispose() {
    _timer.cancel(); //清除定时器
    super.dispose();
  }

  //3秒后，跳转到首页
  void _jumpToHomePage() {
    _timer = Timer(Duration(seconds: 1), () {
      //到时回调
      print('@@@@@@@@@@@@@@@@@  afterTimer=' + DateTime.now().toString());
    });
  }

  //页面部件
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        //LinearGradient：线性渐变 ; RadialGradient：放射状渐变 ; SweepGradient：扇形渐变
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.mirror,
          //transform:,
          colors: [
            Color.fromARGB(255, 102, 210, 204),
            Color.fromARGB(255, 48, 98, 243),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, //设置透明背景色
        appBar: null,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //图片
            Icon(
              Icons.adb, //Material icons 谷歌字体图标库
              size: 90,
              color: Colors.white,
            ),
            Text(
              'LOGO',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            //字体渐变色
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: <Color>[
                    Color.fromARGB(255, 0, 255, 106),
                    Color.fromARGB(255, 255, 217, 0),
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Center(
                child: Text(
                  '一场说走就走的旅行\n一份随遇而安的心境',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
