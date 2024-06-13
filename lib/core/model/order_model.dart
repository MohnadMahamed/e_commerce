// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce/core/model/cart_product_model.dart';

class OrderModel {
  String? userId, dataTime;
  Address? address;
  List<CartProductModel>? product;
  OrderModel({
    this.userId,
    this.dataTime,
    this.address,
    this.product,
  });

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
        userId: map['userId'],
        dataTime: map['dataTime'],
        address: map['address'],
        product: map['product']);
  }
  toMap() {
    return {
      'userId': userId,
      'dataTime': dataTime,
      'address': address,
      'product': product,
    };
  }
}

class Address {
  String? street1, street2, city, state, country;
  Address({this.street1, this.street2, this.city, this.state, this.country});

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street1: map['street1'],
      street2: map['street2'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
    );
  }
  toMap() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
