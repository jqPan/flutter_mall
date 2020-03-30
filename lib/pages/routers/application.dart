import 'package:fluro/fluro.dart';

enum ENV{
  DEV,
  PROD
}

class Application {
  static Router router;
  static ENV env = ENV.DEV;
}