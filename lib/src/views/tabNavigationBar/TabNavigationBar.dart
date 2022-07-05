import 'package:flutter/material.dart';

class TabNavigationBar extends StatefulWidget {
  const TabNavigationBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabNavigationBarState();
}

class _TabNavigationBarState extends State<TabNavigationBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _aaa();
  }

  void _aaa() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      body: null,
    );
  }
}
