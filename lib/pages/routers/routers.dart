
import 'package:fluro/fluro.dart';
import 'router_handlers.dart';

class Routers {
  static final String home = '/home';
  static final String productDetail = '/product_detail';

  static void configureRoutes(Router router) {
    router.define(home, handler: homeHandler);
    router.define(productDetail, handler: productDetailHandler);
  }
}