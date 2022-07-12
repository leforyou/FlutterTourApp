//路由集合
import 'dart:io';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CustomPageRoute.dart';

//初始化
_AppRouter AppRouter = new _AppRouter(); //..可级联操作

class _AppRouter {
  //需要被main.dart/MaterialApp的navigatorKey引用
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  BuildContext get currentContext {
    return navigatorKey.currentContext as BuildContext;
  }

  //构造函数
  _AppRouter() {
    print("_AppRouter构造函数 执行了了");
  }

  //在页面中，获取路由参数。用法：Object arguments = AppRouter.getArguments();
  Object? getArguments() {
    return ModalRoute.of(currentContext)?.settings.arguments;
  }

  //获取路由
  Route getRoute(BuildContext context, Widget page) {
    // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@ $page");
    // print("@@@@@@@@@@@@@@@@@@@@@@@@@@@ ${page.toString() == 'HomePagePage'}");
    /**
     * Flutter 提供了两个转场动画，分别为 MaterialPageRoute 和 CupertinoPageRoute，
     * MaterialPageRoute根据不同的平台显示不同的效果，Android效果为从下到上，iOS效果为从左到右。
     * CupertinoPageRoute不分平台，都是从左到右。需要引入【import 'package:flutter/cupertino.dart';】
     * 
     * RouteSettings(name: page.toString())配置路由名称，结合下面返回使用，
     * Navigator.popUntil(context, ModalRoute.withName("HomePage"));//返回指定的页面（多级返回）
     */
    return CupertinoPageRoute(
      builder: (context) => page,
      settings: RouteSettings(name: page.toString()),
    );
    // return Platform.isIOS
    //     ? MaterialPageRoute(
    //         builder: (context) => page,
    //         settings: RouteSettings(name: page.toString()),
    //       )
    //     : CustomPageRoute(page, 0);
  }

  //需要在main.dart/MaterialApp的routes配置链接路径。页面参数的接收：ModalRoute.of(context).settings.arguments;
  //用法：AppRouter.pathPush(context, '/HomePage', {});
  Future pathPush(
    //BuildContext context,
    String routeName, [
    Object? arguments,
  ]) {
    return Navigator.pushNamed(
      //context,
      currentContext,
      routeName,
      arguments: arguments,
    );
  }

  //替换当前页面
  //AppRouter.pathReplace(context, '/HomePage', {});
  Future pathReplace(
    //BuildContext context,
    String routeName, [
    Object? arguments,
  ]) {
    return Navigator.pushReplacementNamed(
      //context,
      currentContext,
      routeName,
      arguments: arguments,
    );
  }

  //关闭所有页面，并跳转到指定的页面，用法：AppRouter.pathCloseAllPage(context, '/');//返回首页
  pathCloseAllPage(
    //BuildContext context,
    String routeName, [
    Object? arguments,
  ]) {
    return Navigator.pushNamedAndRemoveUntil(
      //context,
      currentContext,
      routeName,
      (Route) => false,
      arguments: arguments,
    );
  }

  //======================================================================

  //跳转页面，用法：AppRouter.push(context,Page(arguments)).then((value) => null);
  Future push(
    //BuildContext context,
    Widget page,
  ) {
    return Navigator.push(
      //context,
      currentContext,
      getRoute(currentContext, page),
    );
  }

  //替换当前页面并跳转，用法：AppRouter.replace(Page(arguments)).then((value) => null);
  Future replace(
    //BuildContext context,
    Widget page,
  ) {
    return Navigator.pushReplacement(
      //context,
      currentContext,
      getRoute(currentContext, page),
    );
  }

  /**
   * 返回上一个页面(销毁当前页面)或返回多个页面
   * 用法：AppRouter.pop();AppRouter.pop(1,arguments);//返回上一个页面
   * 级联用法：AppRouter..pop()..pop(null,{});//返回上上级页面
   * 多次返回 AppRouter.pop(3);
  */
  pop(
      //BuildContext context,
      [
    int? count, //返回的次数
    Object? arguments,
  ]) {
    //return Navigator.of(context).pop(arguments);// or
    for (var i = 0; i < (count ?? 1); i++) {
      if (Navigator.canPop(currentContext)) {
        //防黑屏：Navigator.canPop(context)判断当前页面能否被弹出栈，栈内只有一个页面时为false,别的时候为true。
        Navigator.pop(currentContext, arguments);
      }
    }
    /**
     * Navigator.maybePop(context, arguments);//注意：级联使用不能连续返回。
     * 当前页面能在栈内能被弹出时就弹出栈，如果不能弹出则什么都不做。
    */
  }

  //返回多个页面，用法AppRouter.back('TabNavigationBar');//导航激活的页面。如果类名称不正确，返回黑屏。
  back(
    //BuildContext context,
    String PageClassName,
  ) {
    //PageClassName：如：HomePage/MinePage。类名称由上面【page.toString()】生成。
    return Navigator.popUntil(
        currentContext, ModalRoute.withName(PageClassName));
    //方法二：级联运算符(..),返回上上级页面
    // Navigator.of(context)
    //   ..pop()
    //   ..pop(arguments);
  }

//关闭所有页面，并跳转到指定的页面，用法：AppRouter.closeAllPage(Page(arguments));
  closeAllPage(
    //BuildContext context,
    Widget page,
  ) {
    return Navigator.pushAndRemoveUntil(
      //context,
      currentContext,
      getRoute(currentContext, page),
      (route) => false,
    );
  }
}
