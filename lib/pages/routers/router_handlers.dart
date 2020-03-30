
import 'package:fluro/fluro.dart';
import 'package:flutter_mall/pages/home/index.dart';
import 'package:flutter_mall/pages/product_detail/product_detail_screen.dart';

var homeHandler = Handler(
  handlerFunc: (context, params) => Home()
);

var productDetailHandler = Handler(
  handlerFunc: (context, params) => ProductDetailScreen()
);