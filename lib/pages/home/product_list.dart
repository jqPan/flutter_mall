import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mall/entity/home_entiries.dart';
import 'package:flutter_mall/utils/ThemeUtils.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';

class ProductList extends StatelessWidget {
  final List<Product> productDataList;


  ProductList(this.productDataList);

  @override
  Widget build(BuildContext context) => Container(
    child: GridView.builder(
      padding: EdgeInsets.all(ScreenUtil.getInstance().getWidth(10)),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productDataList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: ScreenUtil.getInstance().getWidth(8),
        crossAxisSpacing: ScreenUtil.getInstance().getWidth(8),
        childAspectRatio: 2 / 3
      ),
      itemBuilder: (context, index) {
        return InkWell(
          child: _buildItem(context, index),
        );
      },
    )
  );



  Widget _buildItem(BuildContext context, int index) {
    var item = productDataList[index];
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.circular(ScreenUtil.getInstance().getWidth(4))
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: CacheImageView(
              item.faceImageUrl,
              padding: EdgeInsets.all(0),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(4),
                topLeft: Radius.circular(4)
              ),
            )
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().getWidth(6),
              right: ScreenUtil.getInstance().getWidth(4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: ScreenUtil.getInstance().getSp(14)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(2)
                  ),
                ),
                Text(
                  item.desc,
                  style: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: ScreenUtil.getInstance().getSp(12)
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().getHeight(2)
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: ScreenUtil.getInstance().getWidth(4),
              right: ScreenUtil.getInstance().getWidth(4),
            ),
            child: RichText(
              text: TextSpan(
                  text: '￥',
                  style: TextStyle(
                      fontSize: ScreenUtil.getInstance().getSp(10),
                      color: ThemeUtils.defaultColor
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: '${item.price.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: ScreenUtil.getInstance().getSp(14)
                        )
                    )
                  ]
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil.getInstance().getHeight(6)
            ),
          )
        ],
      ),
    );
  }

}