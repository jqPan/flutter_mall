import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

class FunItem {
  Icon icon;
  String label;

  FunItem({this.icon, this.label});

}

class FunCard extends StatelessWidget {

  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final String title;
  final String actionText;
  final bool showAction;
  final GestureTapCallback onAction;
  final ValueChanged<int> onItemClick;
  final List<FunItem> data;


  FunCard({
    @required this.data,
    this.margin,
    this.padding,
    this.title = '更多',
    this.actionText = '更多',
    this.showAction = false,
    this.onAction,
    this.onItemClick
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: this.margin,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(ScreenUtil.getInstance().getWidth(8))
        )
      ),
      elevation: 0,
      child: Column(
        children: <Widget>[
          _buildTitle(),
          Divider(
            height: ScreenUtil.getInstance().getWidth(0.5),
            color: Color(0xffeeeeee),
          ),
          Container(
            child: GridView.builder(
                padding: EdgeInsets.all(0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: ScreenUtil.getInstance().getWidth(5),
                  crossAxisSpacing: ScreenUtil.getInstance().getWidth(5),
                ),
                itemBuilder: (context, index) {
                  return _buildItem(this.data[index], index);
                },
                itemCount: this.data.length,
              )
          )
        ],
      ),
    );
  }


  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil.getInstance().getWidth(6),
          horizontal: ScreenUtil.getInstance().getWidth(8)
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: ScreenUtil.getInstance().getSp(16)
              ),
            ),
          ),
          this.showAction ? GestureDetector(
            onTap: () {
              if (this.onAction != null) {
                this.onAction();
              }
            },
            child: Text(
              actionText,
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: ScreenUtil.getInstance().getSp(12)
              ),
            ),
          ) : Container(),
          this.showAction ? Icon(
              Icons.keyboard_arrow_right
          ): Container()
        ],
      ),
    );
  }

  Widget _buildItem(FunItem item, int index) {
    return GestureDetector(
      onTap: () {
        if (this.onItemClick != null) {
          this.onItemClick(index);
        }
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            item.icon,
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil.getInstance().getHeight(8)
              ),
            ),
            Text(
                item.label
            )
          ],
        ),
      ),
    );
  }
}