import 'package:flutter/material.dart';

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
      body: Column(
        children: [
          Text('我是 个人中心'),
        ],
      ),
    );
  }
}
