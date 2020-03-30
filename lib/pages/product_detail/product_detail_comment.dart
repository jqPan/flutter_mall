import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ProductDetailComment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil.getInstance().getHeight(150),
      alignment: Alignment.center,
      child: Text('用户评论'),
    );
  }
}
