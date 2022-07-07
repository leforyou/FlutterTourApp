import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/views/TestWeb/TestWeb.dart';

class Test1Page extends StatefulWidget {
  Test1Page({Key? key}) : super(key: key);

  final _Test1PageState instance = _Test1PageState(); //初始化实例

  @override
  State<StatefulWidget> createState() => instance;

  //可从另一个外部类调用有状态Widgets状态类中的函数
  _Test1PageState getInstance() => instance;
}

class _Test1PageState extends State<Test1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test1')),
      body: GestureDetector(
        child: SizedBox(
          height: 200,
          child: Center(
            child: Text('跳转WEB'),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => TestWebPage()));
        },
      ),
    );
  }
}
