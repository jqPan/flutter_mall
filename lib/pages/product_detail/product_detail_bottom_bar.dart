import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class ProductDetailBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductDetailBottomBarState();
}

class _ProductDetailBottomBarState extends State<ProductDetailBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: ScreenUtil.getInstance().getWidth(6),
              horizontal: ScreenUtil.getInstance().getWidth(6)
          ),
          child: Row(
            children: <Widget>[
              _buildIconTextButton(
                  iconData: Icons.phone_in_talk,
                  text: '客服'
              ),
              _buildIconTextButton(
                  iconData: Icons.store,
                  text: '店铺'
              ),
              _buildIconTextButton(
                iconData: Icons.shopping_cart,
                text: '购物车',
                showBadge: true,
                badgeCount: 5
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil.getInstance().getWidth(10)
                ),
              ),
              Expanded(
                child: _buildButtonBar(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonBar() {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: _buildButton(
              '加入购物车',
              color: Colors.orangeAccent,
              onTap: () {
                showBottomSheet(context);
              }
            ),
          ),
          Expanded(
            child: _buildButton(
              '立即购买',
              color: Colors.redAccent,
              leftBtn: false,
              onTap: () {
                showBottomSheet(context);
              }
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButton(String text, {Color color, bool leftBtn = true, GestureTapCallback onTap}) {
    var height = ScreenUtil.getInstance().getHeight(28);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            left: leftBtn ? Radius.circular(height) : Radius.zero,
            right: leftBtn ? Radius.zero : Radius.circular(height)
          ),
          color: color
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
    );
  }

  Widget _buildIconTextButton({
    @required IconData iconData,
    @required String text,
    bool showBadge = false,
    int badgeCount = 0,
    GestureTapCallback onTap
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ScreenUtil.getInstance().getWidth(44),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: Column(
                children: <Widget>[
                  Icon(iconData, color: Color(0xff666666)),
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil.getInstance().getHeight(2)
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(8),
                        color: Color(0xff666666)
                    ),
                  )
                ],
              ),
            ),
            showBadge ? _buildBadge(badgeCount: badgeCount) : Container()
          ],
        ),
      ),
    );
  }

  Widget _buildBadge({int badgeCount = 0}) {
    return Positioned(
      left: ScreenUtil.getInstance().getWidth(24),
      child: Container(
        height: ScreenUtil.getInstance().getHeight(10),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().getWidth(4)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(ScreenUtil.getInstance().getHeight(10))
            ),
            color: Colors.redAccent
        ),
        alignment: Alignment.center,
        child: Text(
          '$badgeCount',
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil.getInstance().getSp(8)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container();
        }
    );
  }
}