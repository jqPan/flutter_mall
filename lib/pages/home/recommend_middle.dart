import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/home/widgets/recommend_card.dart';

class RecommendMiddle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      height: ScreenUtil.getInstance().getHeight(100),
      padding: EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(4)),
      decoration: BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: RecommendCard(
              title: '今日上新',
              urlList: <String>[
                'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg',
                'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'
              ],
            ),
          ),
          Expanded(
            child: RecommendCard(
              title: '新品首发',
              urlList: <String>[
                'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'
              ],
            ),
          ),
          Expanded(
            child: RecommendCard(
              title: '排行榜',
              urlList: <String>[
                'http://img4.gomein.net.cn/image/bbcimg/production_image/nimg/20140728/10/8004071531/109096451_800.jpg'
              ],
            ),
          ),
        ],
      ),
    );
  }
}