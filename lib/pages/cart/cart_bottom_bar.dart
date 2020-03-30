import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class CartBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CartBottomBarState();
}

class _CartBottomBarState extends State<CartBottomBar> {
  bool _isSelectedAll = false;
  @override
  Widget build(BuildContext context) {
    var height = ScreenUtil.getInstance().getHeight(45);
    return Container(
      height: height,
      padding: EdgeInsets.only(
        right: ScreenUtil.getInstance().getWidth(10)
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xffeeeeee),
            width: ScreenUtil.getInstance().getWidth(0.5)
          )
        ),
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: _isSelectedAll,
                onChanged: this.onChanged,
              ),
              Text(
                '全选',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(12),
                    color: Color(0xff333333)
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                '合计:',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(12),
                    color: Color(0xff333333)
                ),
              ),
              SizedBox(width: ScreenUtil.getInstance().getWidth(2)),
              Text(
                '￥100.00元',
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(14),
                    color: Colors.redAccent
                ),
              ),
              SizedBox(width: ScreenUtil.getInstance().getWidth(8)),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().getHeight(16),
                    right: ScreenUtil.getInstance().getHeight(16)
                  ),
                  height: ScreenUtil.getInstance().getHeight(24),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.all(
                        Radius.circular(ScreenUtil.getInstance().getHeight(24))
                    )
                  ),
                  child: Text(
                    '结算',
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().getSp(14),
                        color: Colors.white
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void onChanged(bool isSelected) {
    setState(() {
      _isSelectedAll = isSelected;
    });
  }
}
