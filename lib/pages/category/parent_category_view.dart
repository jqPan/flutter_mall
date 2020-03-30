import 'dart:ffi';

import 'package:flustars/flustars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/entity/category_entiries.dart';
import 'package:flutter_mall/utils/ThemeUtils.dart';

class ParentCategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ParentCategoryViewState();
}

class _ParentCategoryViewState extends State<ParentCategoryView> {
  List<Category> _categoryList;
  int _selectIndex = 0;
  @override
  void initState() {
    _categoryList = List();
    _categoryList.add(Category(name: '男装'));
    _categoryList.add(Category(name: '女装'));
    _categoryList.add(Category(name: '男鞋'));
    _categoryList.add(Category(name: '女鞋'));
    _categoryList.add(Category(name: '内衣配饰'));
    _categoryList.add(Category(name: '箱包手袋'));
    _categoryList.add(Category(name: '美妆护肤'));
    _categoryList.add(Category(name: '个人清洁'));
    _categoryList.add(Category(name: '钟表珠宝'));
    _categoryList.add(Category(name: '手机数码'));
    _categoryList.add(Category(name: '电脑办公'));
    _categoryList.add(Category(name: '家用电器'));
    _categoryList.add(Category(name: '食品生鲜'));
    _categoryList.add(Category(name: '酒水饮料'));
    _categoryList.add(Category(name: '母婴童装'));
    _categoryList.add(Category(name: '玩具乐器'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: _categoryList.length,
        itemBuilder: (context, index) {
          return _buildItem(_categoryList[index], index);
        },
      ),
    );
  }

  Widget _buildItem(Category category, int index) {
    return GestureDetector(
      onTap: () => _itemClick(index),
      child: Container(
        height: ScreenUtil.getInstance().getHeight(40),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: index == _selectIndex
                  ? ThemeUtils.defaultColor
                  : Color(0xffeeeeee)
            )
          )
        ),
        child: Text(
          category.name,
          style: TextStyle(
              fontSize: ScreenUtil.getInstance().getSp(14),
              color: index == _selectIndex
                  ? ThemeUtils.defaultColor
                  : Color(0xff333333)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  _itemClick(index) {
    setState(() {
      this._selectIndex = index;
    });
  }
}