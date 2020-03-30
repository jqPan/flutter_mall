import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

/// 首页分类入口
class CategoryMenu extends StatelessWidget {
  var data = [
    {'text': '每日上新', 'icon': Icons.account_balance},
    {'text': '限时抢购', 'icon': Icons.timer},
    {'text': '热销排行', 'icon': Icons.assessment},
    {'text': '优惠中心', 'icon': Icons.book},
    {'text': '免费水果', 'icon': Icons.free_breakfast},
    {'text': '生活服务', 'icon': Icons.home},
    {'text': '数码电器', 'icon': Icons.camera_alt},
    {'text': '免费水果', 'icon': Icons.free_breakfast},
    {'text': '生活服务', 'icon': Icons.home},
    {'text': '数码电器', 'icon': Icons.camera_alt},
  ];
  double iconSize = ScreenUtil.getInstance().getWidth(40);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(5)),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: ScreenUtil.getInstance().getWidth(5),
          crossAxisSpacing: ScreenUtil.getInstance().getWidth(5),
        ),
        itemBuilder: _buildItem,
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    var item = data[index];
    return Center(
      child: InkWell(
        onTap: (){},
        child: Column(
          children: <Widget>[
            Container(
              width: iconSize,
              height: iconSize,
              alignment: Alignment.center,
              padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(2)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(iconSize)),
                color: Colors.deepOrange[100]
              ),
              child: Icon(item['icon'], color: Colors.white)
            ),
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil.getInstance().getWidth(4)),
            ),
            Text(
              item['text'],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: ScreenUtil.getInstance().getSp(10),
                color: Color(0xff333333)
              ),
            )
          ],
        ),
      ),
    );
  }
}