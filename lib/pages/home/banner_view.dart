import 'package:flutter/material.dart';
import 'package:flutter_mall/entity/home_entiries.dart';
import 'package:flutter_mall/widgets/CacheImageView.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

/// 首页banner view
class BannerView extends StatelessWidget {
  final List<MallBanner> data;
  final double height;
  BannerView(this.data, {this.height: 180 });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: this.height * 0.7,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(40.0),
                bottomLeft: Radius.circular(40.0)
              ),
              color: Colors.red
          ),
        ),// 设置弧形背景
        Container(
          width: double.infinity,
          height: this.height,
          child: renderSwipe(),
        )
      ],
    );
  }

  Widget renderSwipe() {
    return Swiper(
      onTap: (index) {
      },
      itemCount: data.length,
      scrollDirection: Axis.horizontal,
      loop: true,
      duration: 3000,
      autoplay: true,
//      scale: 0.9,
//      viewportFraction: 0.8,
      itemBuilder: (context, index) {
        return CacheImageView(data[index].url);
      },
      pagination: SwiperPagination(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 20.0),
        builder: DotSwiperPaginationBuilder(
          size: 8.0,
          color: Colors.white,
          activeColor: Colors.deepOrangeAccent
        )
      ),
    );
  }
}