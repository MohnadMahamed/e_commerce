class ProductModel {
  String? name, productId, description, image, size, price, category, company;
  String? color;
  ProductModel({
    this.name,
    this.color,
    this.image,
    this.description,
    this.size,
    this.price,
    this.productId,
    this.category,
    this.company,
  });

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    // color = HexColor.fromHex(map['color']);
    color = map['color'];
    image = map['image'];
    description = map['description'];
    size = map['size'];
    price = map['price'];
    productId = map['productId'];
    category = map['category'];
    company = map['company'];
  }

  toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'size': size,
      'price': price,
      'color': color,
      'productId': productId,
      'category': category,
      'company': company,
    };
  }
}
