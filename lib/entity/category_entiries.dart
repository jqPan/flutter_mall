class Category {
  int id;
  String name;
  String imageUrl;

  Category({this.id, this.name, this.imageUrl});

}

class SubCategory {
  String title;
  List<Category> list;

  SubCategory({this.title, this.list});

}

class SubCategoryList {
  int pId;
  Category topCategory;
  List<SubCategory> data;

  SubCategoryList({this.pId, this.topCategory, this.data});

}