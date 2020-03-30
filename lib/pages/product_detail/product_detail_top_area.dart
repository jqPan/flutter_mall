import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ProductDetailTopArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailTopAreaState();

}

class ProductDetailTopAreaState extends State<ProductDetailTopArea> {
  List<String> data;

  @override
  void initState() {
    super.initState();
    data = [
      'http://a.hiphotos.baidu.com/image/pic/item/b8389b504fc2d56285e6982dee1190ef77c66c07.jpg',
      'http://attach.bbs.miui.com/forum/201312/03/165620x7cknad7vruvec1z.jpg',
      'http://img.juimg.com/tuku/yulantu/110111/292-110111035J3100.jpg',
      'http://img.pconline.com.cn/images/upload/upc/tx/wallpaper/1307/10/c2/23151595_1373424485109.jpg'
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildSwipe(),
          _buildNameArea(),
          _buildSelectList()
        ],
      ),
    );
  }


  Widget _buildSwipe() {
    return Container(
      height: ScreenUtil.getInstance().screenWidth,
      child: Swiper(
        onTap: (index) {},
        itemCount: data.length,
        scrollDirection: Axis.horizontal,
        loop: true,
        duration: 3000,
        itemBuilder: (context, index) {
          return CacheImageView(
            data[index],
            padding: EdgeInsets.all(0),
            borderRadius: BorderRadius.all(Radius.zero),
          );
        },
        pagination: _swipePlugin(),
      ),
    );
  }

  SwiperPlugin _swipePlugin() {
    return SwiperCustomPagination(
        builder: (context, config) {
          return Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: ScreenUtil.getInstance().getWidth(30),
              height: ScreenUtil.getInstance().getHeight(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil.getInstance().getHeight(16))
                  ),
                  color: Color(0x7e000000)
              ),
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().getWidth(10),
                  horizontal: ScreenUtil.getInstance().getWidth(10)
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: '${config.activeIndex + 1}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil.getInstance().getSp(14)
                    ),
                    children: [
                      TextSpan(
                          text: '/${config.itemCount}',
                          style: TextStyle(
                              fontSize: ScreenUtil.getInstance().getSp(10)
                          )
                      )
                    ]
                ),
              ),
            ),
          );
        }
    );
  }

  Widget _buildNameArea() {
    var children = <Widget>[];
    children.add(Container(
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil.getInstance().getWidth(10),
        horizontal: ScreenUtil.getInstance().getWidth(6)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RichText(
            text: TextSpan(
              text: '￥',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getSp(12),
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '100.00',
                  style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(20),
                  ),
                )
              ]
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: ScreenUtil.getInstance().getWidth(40),
              height: ScreenUtil.getInstance().getWidth(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(ScreenUtil.getInstance().getWidth(40))
                  ),
                  color: Color.fromARGB(10, 0, 0, 0)
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.favorite_border,
                    color: Color(0xff666666),
                    size: ScreenUtil.getInstance().getWidth(18),
                  ),
                  Text(
                    '收藏',
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: ScreenUtil.getInstance().getSp(10)
                    ),
                  )
                ],
              ),
            )
          ),
        ],
      ),
    ));

    children.add(
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getWidth(6)
        ),
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '德尔玛毛球修剪器DEM-MQ811白色',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getWidth(16),
                color: Color(0xff333333),
                fontWeight: FontWeight.bold
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().getWidth(4),
                bottom: ScreenUtil.getInstance().getWidth(10)
              ),
              child: Text(
                '瞬去毛球，不伤衣服，一粘即净，充电插电两用',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getWidth(14),
                    color: Color(0xff666666)
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      )
    );
    return Container(
      color: Colors.white,
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildSelectList() {
    return Container(
      margin: EdgeInsets.only(
        top: ScreenUtil.getInstance().getHeight(10),
        bottom: ScreenUtil.getInstance().getHeight(10)
      ),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _listTitle(
            leading: '已选',
            title: Text(
              '修剪器 x1',
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getSp(14),
                color: Color(0xff333333),
                fontWeight: FontWeight.bold
              ),
            )
          ),
          Divider(
            height: ScreenUtil.getInstance().getWidth(0.5),
            color: Color(0xffededed),
          ),
          _listTitle(
            leading: '送至',
            title: RichText(
              text: TextSpan(
                text: '深圳市',
                style: TextStyle(
                  fontSize: ScreenUtil.getInstance().getSp(14),
                  color: Color(0xff333333),
                ),
                children: [
                  TextSpan(
                    text: ' 宝安区'
                  ),
                  TextSpan(
                    text: ' 有货',
                      style: TextStyle(
                        color: Colors.redAccent,
                      ),
                  )
                ]
              ),
            )
          ),
          Divider(
            height: ScreenUtil.getInstance().getWidth(0.5),
            color: Color(0xffededed),
          ),
          _listTitle(
              leading: '服务',
              title: Text(
                '包邮、7天无理由',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(14),
                    color: Color(0xff333333),
                ),
              )
          ),
        ],
      ),
    );
  }

  Widget _listTitle({ String leading, @required Widget title, GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: ScreenUtil.getInstance().getHeight(40),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().getWidth(10)
        ),
        child: Row(
          children: <Widget>[
            Text(
              leading,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getSp(14),
                color: Colors.grey
              ),
            ),
            SizedBox(
              width: ScreenUtil.getInstance().getWidth(16),
            ),
            Expanded(
              child: title,
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey
            )
          ],
        ),
      ),
    );
  }
}