class MallBanner {
  int proId;
  String proName;
  String url;
  MallBanner(this.proId, this.proName, this.url);
}

class Product {
  int id;
  String faceImageUrl;
  String name;
  String desc;
  double price;
  double scalePrice;

  Product({
    this.id,
    this.faceImageUrl,
    this.name,
    this.desc,
    this.price,
    this.scalePrice
  });

}