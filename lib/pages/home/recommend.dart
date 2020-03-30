import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/home/recommend_middle.dart';
import 'package:flutter_mall/pages/home/recommend_top.dart';

/// 推荐的热门功能 秒杀等
class Recommend extends StatelessWidget {
  final Radius radius = Radius.circular(ScreenUtil.getInstance().getWidth(4));
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil.getInstance().getWidth(10)),
      padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(8)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(radius),
        color: Colors.white70
      ),
      child: Column(
        children: <Widget>[
          RecommendTop(),
          RecommendMiddle()
        ],
      ),
    );
  }
}
