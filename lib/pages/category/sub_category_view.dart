import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/entity/category_entiries.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class SubCategoryView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends State<SubCategoryView> {
  SubCategoryList _subCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // 'png
    List<SubCategory> data = [];
    for (int i = 0; i < 3; i++) {
      data.add(SubCategory(
          title: '热门分类$i',
          list: <Category>[
            Category(
                name: '服饰0',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/03a4a0afcbe194e75726fcfc2083d15e.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            ),
            Category(
                name: '服饰10',
                imageUrl: 'https://img.youpin.mi-img.com/800_pic/0a2eb30be69a305a2e4bac5b8c01d5fb.png'
            )
          ]
      ));
    }
    _subCategory = new SubCategoryList(
      topCategory: Category(
        imageUrl: 'https://img.youpin.mi-img.com/youpinoper/96aee36524e8a037d59299dd85a22fd6.jpg'
      ),
      data: data
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _subCategory.data.length + getHeaderCount(),
        itemBuilder: (context, index) {
          return _buildListItem(index);
        },
      ),
    );
  }

  int getHeaderCount() => _subCategory.topCategory != null ? 1 : 0;

  Widget _buildListItem(index) {

    if (getHeaderCount() > 0) {
      return index == 0
          ? Container(
            padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(10)),
            child: GestureDetector(
              onTap: () => {},
              child: CacheImageView(
                _subCategory.topCategory.imageUrl,
                height: ScreenUtil.getInstance().getHeight(70),
              ),
            ),
          )
          : _buildGridView(_subCategory.data[index - 1]);
    } else {
      return _buildGridView(_subCategory.data[index]);
    }
  }

  Widget _buildGridView(SubCategory subCategory) {
    return Container(
      margin: EdgeInsets.all(ScreenUtil.getInstance().getWidth(6)),
      padding: EdgeInsets.only(
        left: ScreenUtil.getInstance().getWidth(4),
        right: ScreenUtil.getInstance().getWidth(4),
        bottom: ScreenUtil.getInstance().getWidth(6)
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil.getInstance().getWidth(6))
        ),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Container(
              height: ScreenUtil.getInstance().getHeight(26),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.all(ScreenUtil.getInstance().getWidth(4)),
              child: Text(
                subCategory.title,
                style: TextStyle(
                    fontSize: ScreenUtil.getInstance().getSp(14),
                    color: Color(0xFF333333)
                ),
              )
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: ScreenUtil.getInstance().getWidth(5),
              crossAxisSpacing: ScreenUtil.getInstance().getWidth(5),
            ),
            itemBuilder: (BuildContext _context, int _index) {
              return _buildItem(subCategory.list[_index], _index);
            },
            itemCount: subCategory.list.length,
          )
        ],
      ),
    );
  }

  Widget _buildItem(Category category, int index) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: CacheImageView(
                category.imageUrl,
                padding: EdgeInsets.all(0),
                borderRadius: BorderRadius.all(Radius.circular(0)),
              )
            ),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil.getInstance().getHeight(2)
              ),
            ),
            Text(
              category.name,
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