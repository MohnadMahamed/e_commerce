import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/model/product_model.dart';
import 'package:e_commerce/core/service/home_services.dart';
import 'package:e_commerce/helper/extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:e_commerce/core/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class AddProductViewModel extends GetxController {
  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController companyController = TextEditingController();

  bool isBottomSheetOpen = false;
  IconData floatingActionIcon = Icons.add_circle_outline_rounded;

  toggleFloatingAction() {
    isBottomSheetOpen = !isBottomSheetOpen;
    floatingActionIcon = isBottomSheetOpen
        ? Icons.close_rounded
        : Icons.add_circle_outline_rounded;
    update();
  }

  Color color = Colors.green;
  changColor(Color pickColor) {
    color = pickColor;
    update();
  }

  CategoryModel selectedCategory = CategoryModel();
  selectCategory({required CategoryModel selected}) {
    selectedCategory = selected;
    categoryController.text = selected.name!;
    update();
  }

  XFile? file;
  File? imageFile;
  Future<void> pickCameraImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.camera);
    file = image!;
    imageFile = File(file!.path);

    update();
  }

  Future<void> pickGalleryImage() async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    file = image!;
    imageFile = File(file!.path);
    update();
  }

//
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FacebookLogin _facebookLogin = FacebookLogin();
  // String? email, password, name;
  final Rxn<User?> _user = Rxn<User>();
  String? get user => _user.value?.email;
//

  UploadTask? uploadTask;
  String? urlDownload;
  Future<void>? uploadImage() async {
    loading = true;
//
    _user.bindStream(_auth.authStateChanges());
//
// UploadTask task = FirebaseStorage.instance.ref('/notes.text').putString('My notes!');
    final storageRef = FirebaseStorage.instance.ref();
    final path = file!.path;
    Reference reference =
        storageRef.child('product_images/${p.basename(path)}');
    uploadTask = reference.putFile(imageFile!);
    final snapshot = await uploadTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();
    loading = false;

    update();
  }

  String categoryId = '';

  selectedCategoryId({required String categoryName}) {
    if (categoryName == 'Gadgets') {
      categoryId = '0luxU4KUoinNgo8BAIYN';
    } else if (categoryName == 'Men') {
      categoryId = 'NAr6ngsrmbQ3SMjQnYzf';
    } else if (categoryName == 'Gaming') {
      categoryId = '1LW2BIJakNdymFLJuOKV';
    } else if (categoryName == 'Women') {
      categoryId = 'MCc6DtlaBhxxKnAbH61X';
    } else if (categoryName == 'Devices') {
      categoryId = 'dKzRmWCI0cTBUQUdlD5I';
    }
    update();
  }

  String categoryImage = '';

  selectedCategoryImage({required String categoryName}) {
    if (categoryName == 'Gadgets') {
      categoryImage =
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/headphone.png?alt=media&token=59151533-000e-47b4-86b7-351d186d1340';
    } else if (categoryName == 'Men') {
      categoryImage =
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/shoes.png?alt=media&token=1f0ffb78-4645-4f25-b6a3-9adf8e6015db';
    } else if (categoryName == 'Gaming') {
      categoryImage =
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/console.png?alt=media&token=6cbce10a-5d6a-4a13-9afa-33f67b73c6fd';
    } else if (categoryName == 'Women') {
      categoryImage =
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/high-heels.png?alt=media&token=b167a3d8-792d-454e-935f-12f6af65f57e';
    } else if (categoryName == 'Devices') {
      categoryImage =
          'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/idea.png?alt=media&token=e4fd2132-08a0-4e83-93cd-fc6733ba3e2a';
    }
    update();
  }

  addProductIdToCatagoryList(
      {required String categoryName, required String productId}) {
    List<dynamic> productIdList = [productId];
    selectedCategoryId(categoryName: categoryName);
    selectedCategoryImage(categoryName: categoryName);
    CategoryModel categoryModel = CategoryModel(
        image: categoryImage,
        name: categoryName,
        productsId: FieldValue.arrayUnion(productIdList));
    HomeService().addProductIdToCatagoryListFireStore(
        categoryId: categoryId, categoryModel: categoryModel);
  }

  final _uid = const Uuid();
  bool loading = false;
  // final ValueNotifier<bool> _loading = ValueNotifier(false);

  addProductToFirebase(BuildContext context) async {
    loading = true;
    update();

    file == null ? null : await uploadImage();
    // String id = _uid.v1();
    ProductModel productModel = ProductModel(
        productId: _uid.v1(),
        image: urlDownload,
        name: productNameController.text,
        description: descriptionController.text,
        price: priceController.text,
        category: categoryController.text,
        size: sizeController.text,
        color: color.toHex(),
        company: companyController.text);
    addProductIdToCatagoryList(
        categoryName: categoryController.text,
        productId: productModel.productId!);
    await HomeService().addProductToFireStore(productModel).then((value) {
      // print('file ${file.toString()}');
      Navigator.pop(context);
      // toggleFloatingAction();
      isBottomSheetOpen = false;
      floatingActionIcon = Icons.add_circle_outline_rounded;
    });
    loading = false;

    update();
  }
}
