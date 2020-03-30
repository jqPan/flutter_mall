import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef AlphaWidget = Widget Function(BuildContext context, double alpha);

/// 一个可以监听滚动的来处理title透明度的一个框架
class StackScrollView extends StatefulWidget {
  /// 提供滚动的body
  final Widget body;
  /// 可以动态从透明到显示的title, 可以使用Opacity来处理，这里不强制使用Opacity来处理，
  /// 便于拓展
  /// 建议不要返回包含AppBar的Widget, 谁用谁知道
  final AlphaWidget alphaTitleBuilder;
  final double scrollOffsetHeight;
  final bool removeTop;
  final Brightness brightness;
  final ValueChanged<double> onOffsetChange;

  StackScrollView({
    @required this.body,
    @required this.alphaTitleBuilder,
    this.scrollOffsetHeight = kToolbarHeight, /// 使用一个默认的高度
    this.removeTop = true,
    this.brightness = Brightness.light,
    this.onOffsetChange
  }): assert(body != null),
      assert(alphaTitleBuilder != null);

  @override
  State<StatefulWidget> createState() => _StackScrollViewState();
}

class _StackScrollViewState extends State<StackScrollView> {
  double _alpha = 0;

  _onScroll(offset) {
    if (widget.onOffsetChange != null) {
      widget.onOffsetChange(offset);
    }

    double alpha = offset / widget.scrollOffsetHeight;
//    if (alpha < 0) {
//      alpha = 0;
//    } else if (alpha > 1) {
//      alpha = 1;
//    }

    alpha = alpha < 0 ? 0 : alpha > 1 ? 1 : alpha;
    /// 减少刷新次数
    if (_alpha != alpha) {
      setState(() {
        _alpha = alpha;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final SystemUiOverlayStyle overlayStyle = widget.brightness == Brightness.dark
        ? SystemUiOverlayStyle.light
        : SystemUiOverlayStyle.dark;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            removeTop: widget.removeTop,
            context: context,
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification
                  && scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
                return true;
              },
              child: widget.body,
            )
          ),
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: overlayStyle,
            child: Container(),
          ),
          widget.alphaTitleBuilder(context, _alpha)
        ],
      ),
    );
  }
}