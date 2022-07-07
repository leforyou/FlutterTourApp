//设备信息

import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';

/*
注意：
1.Platform.isAndroid需要导入【import 'dart:io';】
2.MediaQueryData.fromWindow(window)需要导入【import 'dart:ui';】
3.MediaQuery.of(context)需要导入【import 'package:flutter/material.dart';】

MediaQuery.of(context) 的值输出来了，不同的机型有些值是不同的，
MediaQuery.of(context) 输出的内容和 MediaQueryData.fromWindow(window) 输出的内容是一样的
MediaQueryData(
  size: Size(360.0, 592.0),
  devicePixelRatio: 2.0,
  textScaleFactor: 1.0,
  platformBrightness: Brightness.light,
  padding: EdgeInsets(0.0, 24.0, 0.0, 0.0),
  viewPadding: EdgeInsets(0.0, 24.0, 0.0, 0.0),
  viewInsets: EdgeInsets.zero,
  physicalDepth: 1.7976931348623157e+308,
  alwaysUse24HourFormat: true,
  accessibleNavigation: false,
  disableAnimations: false,
  invertColors: false,
  boldText: false,
);


导入【import 'package:flutter/material.dart';】便可获取到，
Flutter相关的变量【kBottomNavigationBarHeight，kToolbarHeight，等等】
【位于 Dart Packages/flutter/src/material/constans.dart】
【个人电脑 C:\src\flutter\packages\flutter\lib\src\material】
*/

class DevicesUtils {
  //dart构造函数和JAVA一样，中可以使用和class名称相同的函数作为其构造函数
  DevicesUtils() {
    //new DevicesUtils(); 或 DevicesUtils();时会执行构造函数
    print('@@@@@@@@@@@@@  DevicesUtils 构造函数执行了。');
  }

  //整个屏幕的宽度
  static double screenWidth([BuildContext? context]) {
    //【[]或{}】：可选参数。【?】告诉编译器，我处理了后面为空的情况
    //【[]】使用方式：DevicesUtils.screenHeight(context);
    //【{}】使用方式：DevicesUtils.screenHeight(context:context);
    if (context == null) {
      return MediaQueryData.fromWindow(window).size.width;
    } else {
      return MediaQuery.of(context).size.width;
    }
  }

  //整个屏幕的高度
  static double screenHeight([BuildContext? context]) {
    if (context == null) {
      return MediaQueryData.fromWindow(window).size.height;
    } else {
      return MediaQuery.of(context).size.height;
    }
  }

  //屏幕信息
  static screenSize([BuildContext? context]) {
    if (context == null) {
      return MediaQueryData.fromWindow(window).size;
    } else {
      return MediaQuery.of(context).size;
    }
  }

  //状态栏高度（SafeArea部件会给页面加对应的状态栏高度padding）
  static double statusBarHeight([BuildContext? context]) {
    if (context == null) {
      return MediaQueryData.fromWindow(window).padding.top;
    } else {
      return MediaQuery.of(context).padding.top;
    }
  }

  //内容高度（除状态栏，头部导航，底部导航）使用方式：DevicesUtils.viewHeight(null, false);
  static double viewHeight([
    BuildContext? context,
    bool? isBottomNavigation = false,
  ]) {
    //flutter全局变量
    //kToolbarHeight（56.0）： The height of the toolbar component of the [AppBar].
    //kBottomNavigationBarHeight（56.0）：  The height of the bottom navigation bar.
    //kTextTabBarHeight（48.0）： The height of a tab bar containing text.
    double screenHeight = DevicesUtils.screenHeight(context);
    double statusBarHeight = DevicesUtils.statusBarHeight(context);
    double bottomNavBarHeight =
        isBottomNavigation ?? false ? kBottomNavigationBarHeight : 0;
    return screenHeight - statusBarHeight - kToolbarHeight - bottomNavBarHeight;
  }

  //判断设备平台【安卓】【IOS苹果】
  static isPlatform(String platformType) {
    //断言只在检查模式下运行有效，如果在生产模式运行，则断言不会执行
    assert(platformType != '', "参数不能为空字符串");
    if (['android', 'isAndroid'].indexOf(platformType) > -1) {
      return Platform.isAndroid;
    }

    if (['ios', 'isIOS'].indexOf(platformType) > -1) {
      return Platform.isIOS;
    }
  }

  //获取APP环境【开发环境】【生产环境】
  static String environment() {
    //方法一（常量kReleaseMode：false开发，true生产）需要引入【import 'package:flutter/foundation.dart';】
    //final bool isProduct = kReleaseMode;

    //方法二
    final bool isProduct = const bool.fromEnvironment('dart.vm.product');
    return isProduct ? 'production' : 'development';
  }
}
