import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/pages/category/parent_category_view.dart';
import 'package:flutter_mall/pages/category/sub_category_view.dart';

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildSearch(),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ParentCategoryView(),
            ),
            Expanded(
              flex: 5,
              child: SubCategoryView(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Container(
      height: ScreenUtil.getInstance().getHeight(26),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: ScreenUtil.getInstance().getWidth(6),
          right: ScreenUtil.getInstance().getWidth(6)
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(ScreenUtil.getInstance().getWidth(20))),
          color: Colors.white70
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search),
          Expanded(
            child: InkWell(
              child: Text(
                '祈福元宵',
                style: TextStyle(
                  color: Color(0xffeeeeee),
                  fontSize: ScreenUtil.getInstance().getSp(16)
                ),
              ),
              onTap: () {
                // 搜索页面
              },
            )
          )
        ],
      ),
    );
  }
}