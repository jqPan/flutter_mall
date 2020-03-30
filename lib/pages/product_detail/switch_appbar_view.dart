import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SwitchAppbarView extends StatefulWidget {
  final double alpha;


  SwitchAppbarView(this.alpha);

  @override
  State<StatefulWidget> createState() => _SwitchAppbarViewState();
}

class _SwitchAppbarViewState extends State<SwitchAppbarView> with SingleTickerProviderStateMixin  {
  /// 透明度
//  double alpha = 0;
  double height = ScreenUtil.getInstance().statusBarHeight + ScreenUtil.getInstance().appBarHeight;
  double btnSize = ScreenUtil.getInstance().statusBarHeight * 0.8;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  void _goBack() => Navigator.of(context).pop();

  @override
  Widget build(BuildContext context) {
    return Theme(
//      value: SystemUiOverlayStyle.dark,
      data: ThemeData(
        brightness: Brightness.dark,
        tabBarTheme: TabBarTheme(
          labelColor: Color(0xff333333),
          labelPadding: EdgeInsets.all(0),
          labelStyle: TextStyle(
            color: Color(0xff333333)
          )
        ),
        highlightColor: Color.fromRGBO(0, 0, 0, 0),
        splashColor: Color.fromRGBO(0, 0, 0, 0),
      ),
      child: Stack(
        children: <Widget>[
          _buildAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildActionButton(icon: Icons.arrow_back_ios, onTap: _goBack),
                _buildActions()
              ],
            )
          ),
          _buildAppBar(
            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildActionButton(icon: Icons.arrow_back_ios, isDefault: false, onTap: _goBack),
                Expanded(
                  child: _buildTab(),
                ),
                _buildActions(isDefault: false)
              ],
            ),
            isDefault: false
          )
        ],
      ),
    );
  }

  Widget _buildAppBar({Widget child, bool isDefault = true}) {
    var alpha = widget.alpha;
    return Opacity(
      opacity: isDefault ? 1 - alpha : alpha,
//      opacity: 1,
      child: Container(
        height: height,
        padding: EdgeInsets.only(
          top: ScreenUtil.getInstance().statusBarHeight,
          left: ScreenUtil.getInstance().getWidth(10),
          right: ScreenUtil.getInstance().getWidth(10),
        ),
        decoration: BoxDecoration(
          color: isDefault ? Colors.transparent : Colors.white,
          border: Border(
            bottom: BorderSide(
              color: isDefault ?  Colors.transparent : Color(0xffeeeeee),
              width: isDefault ? 0 : ScreenUtil.getInstance().getWidth(0.5)
            )
          )
        ),
        child: child,
      ),
    );
  }

  Widget _buildActions({bool isDefault = true}) {
    return Container(
      child: Row(
        children: <Widget>[
          _buildActionButton(icon: Icons.share, isDefault: isDefault),
          Padding(
            padding: EdgeInsets.only(left: ScreenUtil.getInstance().getWidth(10)),
          ),
          _buildActionButton(icon: Icons.more_horiz, isDefault: isDefault)
        ],
      ),
    );
  }

  Widget _buildActionButton({IconData icon, bool isDefault = true, GestureTapCallback onTap}) {
    int _alpha = (1 * 255 * 0.6).toInt();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnSize,
        height: btnSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(isDefault ? btnSize : 0)),
          color: isDefault ? Color.fromARGB(_alpha, 0, 0, 0) : Colors.transparent
        ),
        alignment: Alignment.center,
        child: Icon(
          icon,
          color: isDefault ? Colors.white : Colors.black,
          size: ScreenUtil.getInstance().getWidth(20)
        ),
      )
    );
  }

  Widget _buildTab() {
    return Container(
      height: ScreenUtil.getInstance().getHeight(30),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil.getInstance().getWidth(10)),
      child: TabBar(
        controller: _tabController,
        indicatorColor: Colors.red,
        indicatorSize: TabBarIndicatorSize.label,
        tabs: ['商品', '评价', '详情', '推荐'].map((text) {
          return Tab(
            text: text
          );
        }).toList(),
      ),
    );
  }
}