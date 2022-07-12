import 'package:flutter/material.dart';
import 'package:flutter_app_study/src/views/homePage/HomePage.dart';
import 'package:flutter_app_study/src/views/minePage/MinePage.dart';

//用法：TabNavigationBar(currentIndex: 0);//可选currentIndex: 0首页,1我的
class TabNavigationBar extends StatefulWidget {
  final int currentIndex;

  const TabNavigationBar({
    Key? key,
    this.currentIndex = 0,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() => _TabNavigationBarState();
}

class _TabNavigationBarState extends State<TabNavigationBar> {
  /*
  注意
    fixedColor 和 selectedItemColor 不能同时指定
    如果指定了selectedIconTheme 和 unselectedIconTheme，iconSize、selectedItemColor、unselectedItemColor 可能会失效
    如果指定了selectedLabelStyle、unselectedLabelStyle，selectedFontSize、unselectedFontSize 失效

    作者：maskerII
    链接：https://www.jianshu.com/p/f8f6f1314b08
    来源：简书
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
  */

  List<Widget> allPages = [HomePage(), MinePage()]; //方法一
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //方法一（销毁页面）
      //body: allPages[_currentIndex],
      //方法二（保持页面状态）
      body: IndexedStack(
        index: _currentIndex,
        children: allPages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, //背景色
        // fixedColor: Colors.cyan[200], // 选中 item 填充色。注：fixedColor 和 selectedItemColor 不能同时指定
        selectedItemColor: Colors.blue, //选中字体的颜色
        unselectedItemColor: Colors.grey, //不选中字体的颜色
        //iconSize: 24, //图标的大小
        // 选中时，Icon主题
        // selectedIconTheme: IconThemeData(
        //   color: Colors.red,
        //   opacity: 1.0,
        //   size: 24,
        // ),
        // 未选中时，Icon主题
        // unselectedIconTheme: IconThemeData(
        //   color: Colors.red,
        //   opacity: 0.5,
        //   size: 20,
        // ),
        // 选中时 文本样式
        // selectedLabelStyle: TextStyle(
        //   fontWeight: FontWeight.w700,
        //   fontSize: 18.0,
        // ),
        // 未选中时 文本样式
        // unselectedLabelStyle: TextStyle(
        //   fontWeight: FontWeight.w300,
        //   fontSize: 12.0,
        // ),
        selectedFontSize: 14.0, //选中字体大小
        unselectedFontSize: 12.0, //未选中字体大小
        showSelectedLabels: true, //显示文字
        showUnselectedLabels: true, //不显示文字
        elevation: 1.0, // 阴影高度
        enableFeedback: true, // 是否启动点击反馈 例如 安卓上的长按震动
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //activeIcon: Icon(Icons.abc_outlined),
            label: "首页",
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "我的",
            //backgroundColor:Colors.blue,
          ),
        ],
        onTap: (index) {
          setState(() {
            print("the index is :$index");
            _currentIndex = index;
            if (_currentIndex == 0) {
              dynamic _page = allPages[_currentIndex];
              // print(
              //     "-------------------------_page.runtimeType ${_page.runtimeType}   ${_page.getInstance.SwitchRefresh}");
              _page?.getInstance()?.SwitchRefresh();
            }
          });
        },
      ),
    );
  }
}
