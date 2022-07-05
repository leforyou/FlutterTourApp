// ignore_for_file: slash_for_doc_comments
/**
MaterialApp：一般作为顶层 widget 使用，里面可以定义title（标题）、home(主页)、theme（主题）、routes（路由）等等... 

Scaffold：主要可以设置：
    appBar - 显示在界面顶部的一个 Appbar是头部导航（title是标题）
    body - 当前界面所显示的主要内容 Widget，body是中间内容（除去头、底部导航栏）。
    drawer - 抽屉菜单控件。
    bottomNavigationBar - 是底部导航（ TextButton.icon是带有小图标的文字按钮）



 */

import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/views/startPage/StartPage.dart'; //启动页面

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //根部件 This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      //地点
      locale: Locale('zh', 'CH'),
      //支持区域
      supportedLocales: [
        const Locale('zh', 'CH'),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //启动APP后，进入启动页面，3秒后进入首页
      home: StartPage(),
      //初始路由，当用户进入程序时，自动打开对应的路由
      initialRoute: '',
      //路由集合
      //routes: {},
      //生成路由：路由回调函数，当通过Nacigator.of(context).pushNamed跳转路由时，在routes查找不到时，会调用该方法
      onGenerateRoute: (context) {
        return null;
      },
      //未知路由：路由回调函数，当通过Nacigator.of(context).pushNamed跳转路由时，在routes查找不到时，会调用该方法
      onUnknownRoute: (context) {
        return null;
      },
      //debug模式下是否显示材质风格。默认值：
      debugShowMaterialGrid: false,
      //当为true时，页面顶部覆盖一层GPU各UI曲线图，可查看当前的流畅度
      showPerformanceOverlay: false,
      //当为true时，打开光栅缓存图像的棋盘格
      checkerboardRasterCacheImages: false,
      //当为true时，打开呈现到屏幕位图的层的棋盘格
      checkerboardOffscreenLayers: false,
      //当为true时，打开widget边框，类似Android开发者模式中显示布局边界
      showSemanticsDebugger: false,
      //当为true时，在debug模式下显示右上角的debug字样斜横幅，false为不显示
      debugShowCheckedModeBanner: true,
    );
  }
}
