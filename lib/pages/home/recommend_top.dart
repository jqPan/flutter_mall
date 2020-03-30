import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/home/widgets/time_out_view.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class RecommendTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil.getInstance().getHeight(100),
      child: Row(
        children: <Widget>[
          Expanded(
            child: SecKill(),
          ),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.getInstance().getWidth(10)),
          ),
          Expanded(
            child: NiceGoods(),
          )
        ],
      ),
    );
  }
}

/// 秒杀
class SecKill extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      highlightColor: Colors.transparent,
      child: Container(
        width: ScreenUtil.getInstance().getWidth(150),
        child: Column(
          children: <Widget>[
            buildTitle(),
            buildContent()
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: ScreenUtil.getInstance().getWidth(6)),
              child: Text(
                '秒杀',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(14),
                    color: Color(0xFF333333),
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: TimeOutView(60 * 60 * 2),
            )
          ],
        )
    );
  }

  Widget buildContent() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: contentItem(
              url: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
              price: 5000.00,
              salePrice: 4000.00
            ),
          ),
          Expanded(
            child: contentItem(
                url: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
                price: 5000.00,
                salePrice: 4000.00
            ),
          ),
          Expanded(
            child: contentItem(
                url: 'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
                price: 5000.00,
                salePrice: 4000.00
            ),
          )
        ],
      ),
    );
  }

  Widget contentItem({String url, double price, double salePrice}) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          CacheImageView(url, width: 50, height: 60,),
          Text(
            '￥${salePrice.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().getSp(8),
              color: Color(0xff333333)
            ),
          ),
          Text(
            '￥${price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: ScreenUtil.getInstance().getSp(6),
              color: Color(0xff999999),
              decoration: TextDecoration.lineThrough
            ),
          )
        ],
      ),
    );
  }
}


class NiceGoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      highlightColor: Colors.transparent,
      child: Container(
        width: ScreenUtil.getInstance().getWidth(150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTitle(),
            buildContent()
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
      child: Text(
        '发现好货',
        style: TextStyle(
            fontSize: ScreenUtil.getInstance().getSp(14),
            color: Color(0xFF333333),
            fontWeight: FontWeight.bold
        ),
      )
    );
  }

  Widget buildContent() {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: contentItem(
               'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
            ),
          ),
          Expanded(
            child: contentItem(
              'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
            ),
          )
        ],
      ),
    );
  }

  Widget contentItem(String url) {
    return CacheImageView(
      url,
      width: ScreenUtil.getInstance().getWidth(100),
      height: ScreenUtil.getInstance().getWidth(80),
    );
  }

}