import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/router/AppRouter.dart';
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
          // Navigator.of(context)
          //   ..pop()
          //   ..pop('66666666666666666');
          AppRouter.pop(2, {"fdfefer": 9934});
          // AppRouter
          //   ..pop()
          //   ..pop()
          //   ..pop(null, {"aaaaaa": 9999999});
          // Navigator.of(context).maybePop(88888888888888);
          // Navigator.of(context).pop(5555555555);
          // Navigator.of(context).maybePop();
          // Navigator.of(context).maybePop();
          //AppRouter.pathCloseAllPage('/', {"444444444": 4444444444444});
          //AppRouter.back(context, 'TabNavigationBar');
          // final Uri _url =
          //     Uri.parse('https://flutter.cn'); //https://cn.bing.com/
          // if (!await launchUrl(_url)) throw 'Could not launch $_url';
        },
      ),
    );
  }
}
