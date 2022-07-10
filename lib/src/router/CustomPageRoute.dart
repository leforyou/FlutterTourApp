import 'package:flutter/material.dart';

//路由跳转，自定义动画函数
class CustomPageRoute extends PageRouteBuilder {
  final Widget widget;
  //构造函数
  CustomPageRoute(this.widget, [int type = 0])
      : super(
          //设置路由名称
          settings: RouteSettings(name: widget.toString()),
          // 设置过度时间
          transitionDuration: Duration(milliseconds: 300),
          // 构造器
          pageBuilder: (
            // 上下文和动画
            BuildContext context,
            Animation<double> animaton1,
            Animation<double> animaton2,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animaton1,
            Animation<double> animaton2,
            Widget child,
          ) {
            if (type == 0) {
              //左右滑动动画效果
              return SlideTransition(
                position: Tween<Offset>(
                  // 设置滑动的 X , Y 轴
                  begin: Offset(1.0, 0.0),
                  end: Offset(0.0, 0.0),
                ).animate(
                  CurvedAnimation(
                    parent: animaton1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            } else if (type == 1) {
              // 渐变效果
              return FadeTransition(
                // 从0开始到1
                opacity: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    // 传入设置的动画
                    parent: animaton1,
                    // 设置效果，快进漫出   这里有很多内置的效果
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            } else if (type == 2) {
              //缩放动画效果
              return ScaleTransition(
                scale: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animaton1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: child,
              );
            } else if (type == 3) {
              //旋转加缩放动画效果
              return RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(
                  CurvedAnimation(
                    parent: animaton1,
                    curve: Curves.fastOutSlowIn,
                  ),
                ),
                child: ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                        parent: animaton1, curve: Curves.fastOutSlowIn),
                  ),
                  child: child,
                ),
              );
            }
            throw new Exception(
                "CustomPageRoute部件异常:type=$type类型匹配不到,导致返回为null!");
          },
        );
}
