import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_mall/entity/cart_entiries.dart';
import 'package:flutter_mall/utils/ThemeUtils.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class CartListView extends StatefulWidget {
  final List<CartInfo> data;
  final CarListViewController controller;

  CartListView(this.data, {this.controller});

  @override
  State<StatefulWidget> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (widget.controller != null) {
      widget.controller._bindState(this);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(ScreenUtil.getInstance().getWidth(10)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().getWidth(6))),
          color: Colors.white
        ),
        child: ListView.separated(
          padding: EdgeInsets.only(
            top: ScreenUtil.getInstance().getHeight(6),
            bottom: ScreenUtil.getInstance().getHeight(6)
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.data.length,
          itemBuilder: (context, index) => buildItem(widget.data[index], index),
          separatorBuilder: ((context, index) => Divider(
            height: ScreenUtil.getInstance().getHeight(8),
            color: Colors.white,
          )),
        ),
    );
  }

  Widget buildItem(CartInfo info, int index) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        height: ScreenUtil.getInstance().getWidth(70),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().getWidth(70),
              alignment: Alignment.center,
              child: Checkbox(
                value: info.selected,
                activeColor: ThemeUtils.defaultColor,
                onChanged: (bool) {},
              )
            ),
//            SizedBox(width: ScreenUtil.getInstance().getWidth(1)),
            CacheImageView(
              info.imageUrl,
              padding: EdgeInsets.all(0),
              width: ScreenUtil.getInstance().getWidth(70),
              height: ScreenUtil.getInstance().getWidth(70),
            ),
            SizedBox(width: ScreenUtil.getInstance().getWidth(6)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Text(
                      info.name,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: ScreenUtil.getInstance().getSp(12),
                          color: Color(0xff333333)
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        '￥${info.salePrice.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().getSp(12),
                            color: Colors.redAccent
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}


class CarListViewController {
  _CartListViewState _cartListViewState;

  void _bindState(_CartListViewState state) {
    this._cartListViewState = state;
  }

  void dispose() {
    this._cartListViewState = null;
  }
}