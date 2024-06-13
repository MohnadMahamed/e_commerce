class CategoryModel {
  String? name, image;
  dynamic productsId;
  CategoryModel({this.name, this.image, this.productsId});

  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    productsId = map['productsId'];
  }

  toJson() {
    return {'name': name, 'image': image, 'productsId': productsId};
  }
}
