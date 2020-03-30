class CartInfo {
  int id;
  String name;
  String imageUrl;
  int count;
  int maxCount;
  double price;
  double salePrice;
  bool selected;

  CartInfo({
    this.id,
    this.name,
    this.imageUrl,
    this.count,
    this.maxCount,
    this.price,
    this.salePrice,
    this.selected: false
  });
}