//路由配置
import 'package:flutter/cupertino.dart';

import '../views/tabNavigationBar/TabNavigationBar.dart';
import '/src/views/startPage/StartPage.dart';
import '/src/views/homePage/HomePage.dart';
import '/src/views/minePage/MinePage.dart';

import 'package:flutter_app_study/src/views/Test1/Test1.dart';
import 'package:flutter_app_study/src/views/TestWeb/TestWeb.dart';

/**
 * 注意：未在main.dart/MaterialApp的routes配置使用，原因页面跳转动画不能自定义
 */
class RouterConfig {
  //路由配置
  // static Map<String, Widget Function(BuildContext)> routes =
  //     <String, WidgetBuilder>{
  //   '/views/homePage/HomePage': (context) => HomePage(),
  //   '/views/minePage/MinePage': (context) => MinePage(),
  // };

  static final String initialRoute = '/StartPage'; //StartPage

  /**
   * 注意：如果main.dart/MaterialApp部件配置routes:RouterConfig.routes(),则onGenerateRoute是不会执行的（坑）。
   * 匹配不到链接，可利用onGenerateRoute函数，修改页面跳转的动画。而routes对象配置的页面跳转动画是不能修改的（坑）。
  */
  static Map<String, WidgetBuilder> routes() {
    return {
      '/': (context) => TabNavigationBar(currentIndex: 0),
      '/StartPage': (context) => StartPage(),
      '/HomePage': (context) => HomePage(),
      '/MinePage': (context) => MinePage(),
      '/Test1': (context) => Test1Page(),
      '/TestWeb': (context) => TestWebPage(),
    };
  }

  //main.dart/MaterialApp部件的拦截器onGenerateRoute，匹配不到链接调用
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    //print('====onGenerateRoute ================ 888888888888888 $settings');
    final String name = settings.name ?? '';
    //final arguments = settings.arguments ?? '';
    //print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@：name $name ${settings.arguments}');
    Map<String, WidgetBuilder> routeMap = routes();
    final builder = routeMap[name];
    //print('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@：builder $builder');

    if (builder != null) {
      return CupertinoPageRoute(
        builder: builder,
        settings: settings,
      ); //此处将参数传递给 ModalRoute.of(context)?.settings.arguments; 【Map arguments = ModalRoute.of(context)?.settings.arguments as Map;】【final String message = ModalRoute.of(context)?.settings.arguments as String;】
    }
    throw new Exception("onGenerateRoute异常:路径匹配不到,builder变量为空,导致返回为null!");
  }

  //404页面处理---可在main.dart/MaterialApp的部件未知路由配置
  static RouteFactory onUnknownRoute = (RouteSettings settings) {
    return null;
    //return MaterialPageRoute(builder: (BuildContext context) => UnknownPage());
  };
}
