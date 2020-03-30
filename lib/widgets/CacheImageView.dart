import 'package:cached_network_image/cached_network_image.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';

const _defaultPadding = EdgeInsets.all(8);
class CacheImageView extends StatelessWidget {

  final String url;
  final double height;
  final double width;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  CacheImageView(this.url, {
    this.width: double.infinity,
    this.height: double.infinity,
    this.padding: const EdgeInsets.all(8),
    this.borderRadius: const BorderRadius.all(Radius.circular(8))
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      padding: this.padding,
      child: ClipRRect(
        borderRadius: this.borderRadius,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.fill,
          width: width,
          height: height,
          placeholder: (context, url) => Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            color: Colors.grey[350],
            child: Text(
              '图片加载中...',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
