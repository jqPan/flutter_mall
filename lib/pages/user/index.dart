import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/user/fun_card.dart';
import 'package:flutter_mall/utils/ThemeUtils.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class User extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserState();
  }
}

class UserState extends State<User> {
  ScrollController scrollController = ScrollController();
  Color barIconColor;
  Color barBackgroundColor;
  double headerHeight = 200;
  /// 透明度 取值范围[0,1]
  double navAlpha = 0;
  double navBGAlpha = 0;

  double appbarHeight = ScreenUtil.getInstance().appBarHeight + ScreenUtil.getInstance().statusBarHeight;

  @override
  void initState() {
    super.initState();
    barIconColor = Color.fromARGB((1 * 255).toInt(), 0, 0, 0);
    barBackgroundColor = Colors.transparent;
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset <= headerHeight && offset >= 0) {
        var tempAlpha = 0.0;
        if (offset > headerHeight * 0.9) {
          tempAlpha = 1 - (headerHeight - offset) / (headerHeight * 0.1);
        }
        setState(() {
          navAlpha = (headerHeight - offset) / headerHeight;
          navBGAlpha = tempAlpha;
          barIconColor = Color.fromARGB(255, (255 - 255 * navAlpha).toInt(),
              (255 - 255 * navAlpha).toInt(), (255 - 255 * navAlpha).toInt());

        });
      } else {
        if (navBGAlpha < 1) {
          setState(() {
            navBGAlpha = 1;
          });
        }
      }
    });
  }

  double appBarAlpha = 0;
  _onScroll(offset) {
    double alpha = offset / (ScreenUtil.getInstance().appBarHeight / 2);
    if(alpha < 0) {
      alpha = 0;
    } else if(alpha > 1) {
      alpha = 1;
    }
    setState(() {
      appBarAlpha = alpha;
    });
//    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollNotification) {
                    if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {//1、只监测ListView的滚动（深度设为0），2、监测滚动的时候（ScrollUpdateNotification）
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    return true;
                  },
                  child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: BottomClipper(),
                            child: _buildHeader(),
                          ),
                          Container(
                            child: FunCard(
                              title: '我的订单',
                              actionText: '全部订单',
                              showAction: true,
                              data: [
                                FunItem(
                                    icon: Icon(Icons.payment, color: Colors.redAccent),
                                    label: '待付款'
                                ),
                                FunItem(
                                    icon: Icon(Icons.train, color: Colors.redAccent),
                                    label: '待收货'
                                ),
                                FunItem(
                                    icon: Icon(Icons.message, color: Colors.redAccent),
                                    label: '评价'
                                ),
                                FunItem(
                                    icon: Icon(Icons.monetization_on, color: Colors.redAccent),
                                    label: '退款/售后'
                                )
                              ],
                              margin: EdgeInsets.only(
                                  top: ScreenUtil.getInstance().getHeight(160),
                                  left: ScreenUtil.getInstance().getWidth(10),
                                  right: ScreenUtil.getInstance().getWidth(10)
                              )
                            ),
                          ),
                        ],
                      ),
                      _buildMineFun(),
                    ],
                  )
              )
          ),
          Opacity(//改变透明度都可以使用 Opacity 将其包裹
            opacity: appBarAlpha,
            child: Container(
              height: appbarHeight,
              child: AppBar(
                title: Text(
                  '我的',
                  style: TextStyle(
                      color: Color(0xff333333)
                  ),
                ),
                elevation: 0.5,
                brightness: Brightness.light,
                backgroundColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader() {
    var headerSize = ScreenUtil.getInstance().getWidth(80);
    return Container(
      height: ScreenUtil.getInstance().getHeight(230),
      padding: EdgeInsets.only(
        top: appbarHeight,
        left: ScreenUtil.getInstance().getWidth(10),
        right: ScreenUtil.getInstance().getWidth(10)
      ),
      alignment: Alignment.topCenter,
      color: Colors.orange[300],
      child: Row(
        children: <Widget>[
          CacheImageView(
            'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581618954494&di=c455ab5451b157540f3f94372a84e712&imgtype=0&src=http%3A%2F%2Fpic4.zhimg.com%2Fv2-4f888e475aa9b5420fc8eca46fae014b_fhd.jpg',
            width: headerSize,
            height: headerSize,
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.all(Radius.circular(headerSize)),
          ),
          SizedBox(width: ScreenUtil.getInstance().getWidth(10)),
          Expanded(
            child: Text(
              '老潘',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getSp(18),
                color: Colors.white
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white)
        ],
      ),
    );
  }

  Widget _buildMineFun() {
    return FunCard(
      title: '我的功能',
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().getHeight(12),
        left: ScreenUtil.getInstance().getWidth(10),
        right: ScreenUtil.getInstance().getWidth(10)
      ),
      data: [
        FunItem(
          icon: Icon(Icons.book, color: Colors.orange),
          label: '0张优惠券'
        ),
        FunItem(
            icon: Icon(Icons.favorite, color: Colors.orange),
            label: '我的收藏'
        ),
        FunItem(
            icon: Icon(Icons.looks, color: Colors.orange),
            label: '浏览记录'
        ),
        FunItem(
            icon: Icon(Icons.location_on, color: Colors.orange),
            label: '地址管理'
        )
      ],
    );
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var p1 = Offset(size.width / 2, size.height);
    var p2 = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}