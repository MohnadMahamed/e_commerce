class CartProductModel {
  String? name, image, price, productId;
  int? quantity;
  CartProductModel({
    this.name,
    this.image,
    this.quantity,
    this.price,
    this.productId,
  });

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    name = map['name'];
    image = map['image'];
    quantity = map['quantity'];
    price = map['price'];
    productId = map['productId'];
  }

  toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'image': image,
      'price': price,
      'productId': productId,
    };
  }
}
