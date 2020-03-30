import 'dart:math';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall/entity/cart_entiries.dart';
import 'package:flutter_mall/pages/cart/cart_bottom_bar.dart';
import 'package:flutter_mall/pages/cart/cart_list_view.dart';

class Cart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CartState();
  }
}

class CartState extends State<Cart> {
  List<CartInfo> data;
  @override
  void initState() {
    data = [];
    for (int i = 0; i < 5; i++)
    data.add(CartInfo(
      name: 'product-$i',
      salePrice: 100.0,
      imageUrl: 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1581507448661&di=a61dad9d1fd9e7e81f62fe1bd8c838b3&imgtype=0&src=http%3A%2F%2Fam.zdmimg.com%2F201605%2F03%2F572883abeaad5.png_a200.jpg'
    ));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('购物车'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: EasyRefresh(
              child: Column(
                children: <Widget>[
                  CartListView(data), // 购物车列表
                  // 推荐列表
                ]
              ),
              onRefresh: () async {}
            ),
          ),
          CartBottomBar()
        ],
      ),
    );
  }

  Widget buildCartList() {
    return EasyRefresh(
      enableControlFinishRefresh: true,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
      onRefresh: () async {

      },
    );
  }
}