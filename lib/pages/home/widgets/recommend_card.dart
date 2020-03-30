import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class RecommendCard extends StatelessWidget {
  final String title;
  final List<String> urlList;
  final GestureTapCallback onTag;
  RecommendCard({
    this.title,
    @required this.urlList,
    this.onTag
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      highlightColor: Colors.transparent,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            buildTitle(),
            buildContent(context)
          ],
        ),
      ),
    );
  }

  Widget buildTitle() {
    return Container(
        child: Text(
          this.title,
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().getSp(14),
              color: Color(0xFF333333),
              fontWeight: FontWeight.bold
          ),
        )
    );
  }

  Widget buildContent(BuildContext context) {
    List<Widget> childrenWidget = new List();
    final size =MediaQuery.of(context).size;
    final len = urlList.length;
//    final itemWidth = size.width / len;
    for (int i = 0; i < len; i++) {
      childrenWidget.add(Expanded(
        child: contentItem(urlList[i], 0),
      ));
    }
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil.getInstance().getHeight(6)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: childrenWidget,
      ),
    );
  }

  Widget contentItem(String url, double width) {
    return CacheImageView(
      url,
      height: ScreenUtil.getInstance().getWidth(80),
    );
  }

}