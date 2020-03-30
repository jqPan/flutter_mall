import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/cart/index.dart';
import 'package:flutter_mall/pages/category/index.dart';
import 'package:flutter_mall/pages/home/index.dart';
import 'package:flutter_mall/pages/user/index.dart';
import 'package:flutter_mall/utils/ThemeUtils.dart';

class MallClient extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new MallClientState();
}

class MallClientState extends State<MallClient> {
  int _tabIndex = 0;
  var _body;
  var _pages;
  List<BottomNavigationBarItem> _myTabs = List<BottomNavigationBarItem>();

  Color themeColor = ThemeUtils.defaultColor;
  List tabData;

  final tabTextStyleSelected = TextStyle(color: ThemeUtils.defaultColor);
  final tabTextStyleNormal = TextStyle(color: const Color(0xff969696));


  Image getTabImage(name) {
    return Image.asset('assets/images/main_tabs/$name', width: 24.0, height: 24.0);
  }

  @override
  void initState() {
    super.initState();
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    _pages = <Widget>[Home(), CategoryPage(), Cart(), User()];
    tabData = [
      {
        'text': '首页',
        'icon': getTabImage('ic_home.png'),
        'activeIcon': getTabImage('ic_home_active.png')
      },
      {
        'text': '分类',
        'icon': getTabImage('ic_category.png'),
        'activeIcon': getTabImage('ic_category_active.png')
      },
      {
        'text': '购物车',
        'icon': getTabImage('ic_cart.png'),
        'activeIcon': getTabImage('ic_cart_active.png')
      },
      {
        'text': '我的',
        'icon': getTabImage('ic_user.png'),
        'activeIcon': getTabImage('ic_user_active.png')
      },
    ];

//    for (int i = 0; i < tabData.length; i++) {
//      _myTabs.add(BottomNavigationBarItem(
//        icon: getTabIcon(i),
//        title: getTabTitle(i)
//      ));
//    }
  }

  Image getTabIcon(int index) {
    var data = tabData[index];
    return index == _tabIndex ? data['activeIcon'] : data['icon'];
  }

  Text getTabTitle(int index) {
    return Text(tabData[index]['text'], style: getTabTextStyle(index));
  }

  TextStyle getTabTextStyle(int index) {
    return index == _tabIndex ? tabTextStyleSelected : tabTextStyleNormal;
  }

  Widget renderAppbar(BuildContext context, Widget widget, int index) {
    return AppBar();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

    _body = IndexedStack(
      children: _pages,
      index: _tabIndex,
    );
    return MaterialApp(
      theme: ThemeData(
        primaryColor: themeColor
      ),
      home: Scaffold(
        body: _body,
        bottomNavigationBar: CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)
            ),
            BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)
            ),
            BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)
            ),
            BottomNavigationBarItem(
                icon: getTabIcon(3),
                title: getTabTitle(3)
            )
          ],
          // 默认显示
          currentIndex: _tabIndex,
          // 用户点击item
          onTap: itemTap,
          border: Border(
            top: BorderSide(
              width: ScreenUtil.getInstance().getWidth(0.5),
              color: Color(0xffeeeeee)
            )
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  void itemTap(int index) {
    setState(() {
      _tabIndex = index;
    });
  }
}