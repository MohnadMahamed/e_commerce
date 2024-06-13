import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/model/category_model.dart';
import 'package:e_commerce/core/model/product_model.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference productCollectionRef =
      FirebaseFirestore.instance.collection('Products');
  var productsCollection = FirebaseFirestore.instance.collection('Products');
  var categoryCollection = FirebaseFirestore.instance.collection('Categories');

// CollectionReference productCollectionRefdd (doc) =
//       FirebaseFirestore.instance.collection('Products').doc(doc);

  DocumentReference<Map<String, dynamic>> productCollectionDocRef(String doc) {
    return FirebaseFirestore.instance.collection('Products').doc("'$doc'");
  }

  Future<void> addProductToFireStore(ProductModel productModel) async {
    return await productCollectionRef
        .doc(productModel.productId)
        .set(productModel.toJson());
  }

  Future<void> addProductIdToCatagoryListFireStore(
      {required String categoryId,
      required CategoryModel categoryModel}) async {
    return await categoryCollection
        .doc(categoryId)
        .update(categoryModel.toJson());
  }

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await productCollectionRef.get();
    return value.docs;
  }
}
