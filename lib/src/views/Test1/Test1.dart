import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/router/AppRouter.dart';
import 'package:flutter_app_study/src/views/TestWeb/TestWeb.dart';

import '../tabNavigationBar/TabNavigationBar.dart';

class Test1Page extends StatefulWidget {
  Test1Page({Key? key}) : super(key: key);

  final _Test1PageState instance = _Test1PageState(); //初始化实例

  @override
  State<StatefulWidget> createState() => instance;

  //可从另一个外部类调用有状态Widgets状态类中的函数
  _Test1PageState getInstance() => instance;
}

class _Test1PageState extends State<Test1Page> {
  //初始化执行
  @override
  void initState() {
    //DevicesUtils a = DevicesUtils();
    var aaaa = AppRouter.getArguments();
    print("@@@@@@@@@@@@@@@@@@@ Test1Page   initState函数被调用了   ===== $aaaa");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments;
    print("@@@@@@@@@@@@@@@@@@@ arguments  $arguments");
    return Scaffold(
      appBar: AppBar(title: Text('Test1')),
      backgroundColor: Colors.amberAccent,
      body: GestureDetector(
        child: SizedBox(
          height: 200,
          child: Center(
            child: Text('跳转WEB'),
          ),
        ),
        onTap: () {
          //AppRouter.push(context, TabNavigationBar(currentIndex: 0));
          AppRouter.push(TestWebPage());
          //return;
          // Navigator.push(context,
          //     new MaterialPageRoute(builder: (context) => TestWebPage()));
        },
      ),
    );
  }
}
