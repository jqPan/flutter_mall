import 'dart:math';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/product_detail/product_detail_bottom_bar.dart';
import 'package:flutter_mall/pages/product_detail/product_detail_comment.dart';
import 'package:flutter_mall/pages/product_detail/product_detail_top_area.dart';
import 'package:flutter_mall/pages/product_detail/switch_appbar_view.dart';
import 'package:flutter_mall/widgets/stack_scroll_view.dart';


class ProductDetailScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductDetailScreenState();
}

class ProductDetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin {
  final GlobalKey _topArea = GlobalKey();
  final GlobalKey _userComment = GlobalKey();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return StackScrollView(
      body: _buildContent(context),
      scrollOffsetHeight: ScreenUtil.getInstance().screenWidth,
      alphaTitleBuilder: (context, alpha) {
        return SwitchAppbarView(alpha);
//        return Container();
      },
    );
  }

  Widget _buildContent(BuildContext context) {

    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                    key: _topArea,
                    child: ProductDetailTopArea(),
                  ),
                  SliverToBoxAdapter(
                    key: _userComment,
                    child: ProductDetailComment(),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    floating: true,
                    delegate: StackTabBarHeaderDelegate(TabBar(
                      controller: _tabController,
                      tabs: ['详情', '评论'].map((text) => Tab(text: text)).toList(),
                      labelColor: Colors.pinkAccent,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: false,
                      indicatorColor: Colors.pinkAccent
                    )),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: 1000.0,
                    ),
                  ),
                ],
              )
            ),
          ),
          ProductDetailBottomBar()
        ],
      ),
    );
  }
}

class StackTabBarHeaderDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  double paddingTop = ScreenUtil.getInstance().appBarHeight + ScreenUtil.getInstance().statusBarHeight;

  StackTabBarHeaderDelegate(this.child): assert(child != null);

  @override
  double get maxExtent => this.child.preferredSize.height + paddingTop;
  @override
  double get minExtent => this.child.preferredSize.height + paddingTop;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    print('preferredSize.height >> ${this.child.preferredSize.height}, $shrinkOffset, $paddingTop');
//    return Container(
//      margin: EdgeInsets.only(
//        top: min(shrinkOffset, paddingTop)
//      ),
//      child: this.child,
//    );
    return this.child;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    print('shouldRebuild >> ${oldDelegate.maxExtent}');
    return true;
  }
}

class TransparentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  TransparentHeaderDelegate({this.maxHeight});

  @override
  double get maxExtent => maxHeight;
  @override
  double get minExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: maxHeight,
      color: Colors.transparent,
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    print('shouldRebuild >> ${oldDelegate.maxExtent}');
    return true;
  }
}