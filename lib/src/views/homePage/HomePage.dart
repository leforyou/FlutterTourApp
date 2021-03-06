import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/utils/DevicesUtils.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final _HomePageState instance = _HomePageState(); //初始化实例
  @override
  State<StatefulWidget> createState() => instance;

  //可从另一个外部类调用有状态Widgets状态类中的函数
  _HomePageState getInstance() => instance;
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  ScrollController _scrollController = new ScrollController();
  //初始化执行
  @override
  void initState() {
    //DevicesUtils a = DevicesUtils();
    print("@@@@@@@@@@@@@@@@@@@ 首页initState函数被调用了");
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('@@@@@@@@@@@@@@@@@@@@@  上拉加载数据');
      }
    });
  }

//部件销毁执行
  @override
  void dispose() {
    print("@@@@@@@@@@@@@@@@@@@ 首页dispose函数被调用了");
    _scrollController.dispose(); //释放控制器
    super.dispose();
  }

  //切换刷新---底部导航切换时调用
  void SwitchRefresh() {
    setState(() {
      count++;
    });
    print("@@@@@@@@@@@@@@@@@@@ 首页切换刷新函数被调用了");
  }

  @override
  Widget build(BuildContext context) {
    Object arguments = ModalRoute.of(context)?.settings.arguments ?? {};
    print("@@@@@@@@@@@@@@@@@@@  首页 arguments  $arguments ");
    return Scaffold(
      //appBar: AppBar(title: const Text('首页')),
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        reverse: false,
        //1.ClampingScrollPhysics：Android下微光效果，2.BouncingScrollPhysics：iOS下弹性效果
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(0),
        //SafeArea安全区域：适配现在一些刘海屏之类的非常规显示屏
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //SizedBox(height: 100),
              Text('主题，获取定位，状态管理，音乐，视频'),
              Container(
                height: 500,
                child: Text(
                    '我是首页${count} ${DevicesUtils.isPlatform('android')}== ${DevicesUtils.viewHeight(null, false)} == ${DevicesUtils.screenHeight()}=== ${DevicesUtils.screenWidth(context)}'),
              ),
              SizedBox(
                height: 309,
                child: Text('我是首页${count + 1}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
