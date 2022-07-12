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
import 'src/router/AppRouter.dart';
import 'src/views/startPage/StartPage.dart'; //启动页面
import 'src/router/RouterConfig.dart';
import 'src/views/tabNavigationBar/TabNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  //初始化执行
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this); //添加观察者
  }

//部件销毁执行
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); //添加观察者
    super.dispose();
  }

  //WidgetsBindingObserver:应用前后台切换监听
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print('@@@@@@@@@@@@@ ${state} @@@@@@@@@@@@@');
    switch (state) {
      case AppLifecycleState.inactive:
        //应用程序处于闲置状态并且没有收到用户的输入事件。
        //注意这个状态，在切换到后台时候会触发，所以流程应该是先冻结窗口，然后停止UI
        break;
      case AppLifecycleState.paused:
        //应用程序处于不可见状态
        break;
      case AppLifecycleState.resumed:
        //进入应用时候不会触发该状态
        //应用程序处于可见状态，并且可以响应用户的输入事件。它相当于 Android 中Activity的onResume。
        break;
      case AppLifecycleState.detached:
        //当前页面即将退出
        break;
    }
  }

  //根部件 This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study',
      //地点
      locale: const Locale('zh', 'CN'),
      //国际化,多语言配置
      // supportedLocales: [
      //   const Locale('en', 'US'), // 美国英语
      //   const Locale('zh', 'CH'), // 中文简体
      // ],
      //全局主题风格
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //启动APP后，进入启动页面，3秒后进入首页
      //home: TabNavigationBar(),
      //home: StartPage(),
      //全局存储导航的状态,(AppRouter可实现无Context跳转，navigatorObservers与能实现同样的效果)
      navigatorKey: AppRouter.navigatorKey,
      //初始路由，当用户进入程序时，自动打开对应的路由
      initialRoute: RouterConfig.initialRoute,
      //路由集合。注意：配置了routes，onGenerateRoute不会执行。
      //routes: RouterConfig.routes(),
      //当初home或者 initialRoute路由的名字写错、为空时，或者下面的路由找不到页面了， onGenerateRoute强制创建一个路由页面，默认连接到新的路由页面上
      onGenerateRoute: RouterConfig.onGenerateRoute,
      //未知路由 当onGenerateRoute无法生成路由时调用，当通过Nacigator.of(context).pushNamed();跳转路由时，在routes查找不到时，会调用该方法
      //onUnknownRoute: RouterConfig.onUnknownRoute,//它与routes结合使用
      onUnknownRoute: (RouteSettings settings) {
        print("@@@@@@@@@@@@@@@@@@页面404-----onUnknownRoute $settings");
        return null;
        //return MaterialPageRoute(builder: (context) => page());
      },
      //debug模式下是否显示材质风格。默认值：false
      debugShowMaterialGrid: false,
      //当为true时，页面顶部覆盖一层GPU各UI曲线图，可查看当前的流畅度。默认值：false
      showPerformanceOverlay: false,
      //当为true时，打开光栅缓存图像的棋盘格。默认值：false
      checkerboardRasterCacheImages: false,
      //当为true时，打开呈现到屏幕位图的层的棋盘格。默认值：false
      checkerboardOffscreenLayers: false,
      //当为true时，打开widget边框，类似Android开发者模式中显示布局边界。默认值：false
      showSemanticsDebugger: false,
      //当为true时，在debug模式下显示右上角的debug字样斜横幅，false为不显示。默认值：true
      debugShowCheckedModeBanner: true,
    );
  }
}
