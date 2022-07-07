import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TestWebPage extends StatefulWidget {
  TestWebPage({Key? key}) : super(key: key);

  final _TestWebPageState instance = _TestWebPageState(); //初始化实例

  @override
  State<StatefulWidget> createState() => instance;

  //可从另一个外部类调用有状态Widgets状态类中的函数
  _TestWebPageState getInstance() => instance;
}

class _TestWebPageState extends State<TestWebPage> {
  // void _launchUrl() async {
  //   final Uri _url = Uri.parse('https://flutter.cn'); //https://cn.bing.com/
  //   if (!await launchUrl(_url)) throw 'Could not launch $_url';
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的TestWebPage')),
      body: GestureDetector(
        child: SizedBox(
          child: Center(
            child: Text('跳转WEB'),
          ),
        ),
        onTap: () async {
          final Uri _url =
              Uri.parse('https://flutter.cn'); //https://cn.bing.com/
          if (!await launchUrl(_url)) throw 'Could not launch $_url';
        },
      ),
    );
  }
}
