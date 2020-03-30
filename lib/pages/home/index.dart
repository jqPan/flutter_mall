import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/bezier_bounce_footer.dart';
import 'package:flutter_easyrefresh/bezier_circle_header.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall/entity/home_entiries.dart';
import 'package:flutter_mall/pages/home/banner_view.dart';
import 'package:flutter_mall/pages/home/category_menu.dart';
import 'package:flutter_mall/pages/home/product_list.dart';
import 'package:flutter_mall/pages/home/recommend.dart';
import 'package:flutter_mall/pages/routers/application.dart';
import 'package:flutter_mall/pages/routers/routers.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<MallBanner> data = new List<MallBanner>();
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    data.add(MallBanner(0, 'text1', 'http://a.hiphotos.baidu.com/image/pic/item/b8389b504fc2d56285e6982dee1190ef77c66c07.jpg'));
    data.add(MallBanner(1, 'text2', 'http://attach.bbs.miui.com/forum/201312/03/165620x7cknad7vruvec1z.jpg'));
    data.add(MallBanner(1, 'text2', 'http://img.juimg.com/tuku/yulantu/110111/292-110111035J3100.jpg'));
    data.add(MallBanner(1, 'text2', 'http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/10/c2/23151595_1373424485109.jpg'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: renderTitle(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {},
          )
        ],
      ),
      body: renderContent()
    );
  }

  Widget renderTitle() {
    return Container(
      child: Row(
        children: <Widget>[
          Icon(Icons.ac_unit),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.getInstance().getWidth(10)),
          ),
          renderSearch()
        ],
      ),
    );
  }

  Widget renderSearch() {
    return Expanded(
      child: Container(
        height: ScreenUtil.getInstance().getHeight(26),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().getWidth(6),
          right: ScreenUtil.getInstance().getWidth(6)
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().getWidth(20))),
            color: Colors.white70
        ),
        child: Row(
          children: <Widget>[
            Icon(Icons.search),
            Expanded(
              child: InkWell(
                child: Text(
                  '祈福元宵',
                  style: TextStyle(
                      color: Color(0xffeeeeee)
                  ),
                ),
                onTap: () {
                  // 搜索页面
                  Application.router.navigateTo(context, Routers.productDetail);
                },
              )
            ),
            InkWell(
              child: Icon(Icons.crop_free),
              onTap: () {
                // 扫二维码
              },
            )
          ],
        ),
      ),
    );
  }

  Widget renderContent() {
    return EasyRefresh.custom(
//      header: BezierCircleHeader(backgroundColor: Colors.deepOrange),
//      footer: BezierBounceFooter(backgroundColor: Colors.deepOrange),
//      controller: _controller,
      enableControlFinishRefresh: true,
      enableControlFinishLoad: false,
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: BannerView(data),
        ),
        SliverToBoxAdapter(
          child: CategoryMenu(),
        ),
        SliverToBoxAdapter(
          child: Recommend(),
        ),
        SliverToBoxAdapter(
          child: ProductList([
            Product( name: 'iphone 10', desc: '好用的手机', price: 5000, faceImageUrl: 'http://ksv-video-picture.cdn.bcebos.com/8382443522fc07e01955c887f168fcb8bf70cbd3.jpg'),
            Product( name: 'iphone 10', desc: '好用的手机', price: 5000, faceImageUrl: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'),
            Product( name: 'iphone 10', desc: '好用的手机', price: 5000, faceImageUrl: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'),
            Product( name: 'iphone 10', desc: '好用的手机', price: 5000, faceImageUrl: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'),
            Product( name: 'iphone 10', desc: '好用的手机', price: 5000, faceImageUrl: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'),
            Product( name: 'iphone 10', desc: '好用的手机好用的手机好用的手机好用的手机好用的手机好用的手机', price: 5000, faceImageUrl: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg')
          ]),
        )
      ],
      onRefresh: () async {
//        _controller.finishRefresh(
//          success: true
//        );
      },
      onLoad: () async {
//        _controller.finishLoad(
//          success: true
//        );
      },
    );
  }
}