import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/views/Test1/Test1.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  final _MinePageState instance = _MinePageState(); //初始化实例

  @override
  State<StatefulWidget> createState() => instance;

  //可从另一个外部类调用有状态Widgets状态类中的函数
  _MinePageState getInstance() => instance;
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Container(
        child: GestureDetector(
          child: SizedBox(
            height: 200,
            child: Center(
              child: Text('Test1Page'),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => Test1Page()));
          },
        ),
      ),
    );
  }
}
