import 'dart:io';

import 'package:e_commerce/core/model/user_model.dart';
import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class ProfileViewModel extends GetxController {
  TextEditingController updateNameController = TextEditingController();
  TextEditingController updateEmailController = TextEditingController();
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  final LocalStorageData localStorageData = Get.find<LocalStorageData>();
  UserModel get userModel => _userModel!;
  UserModel? _userModel;

  void getCurrentUser() async {
    _loading.value = true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    _loading.value = false;

    update();
  }

  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }

  bool isLoading = false;
  void updateUserData() async {
    isLoading = true;

    update();
    file == null ? null : await uploadImage();
    UserModel userModel = UserModel(
      userId: _userModel!.userId,
      name: (updateNameController.text == '')
          ? _userModel!.name
          : updateNameController.text,
      email: (updateEmailController.text == '')
          ? _userModel!.email
          : updateEmailController.text,
      pic: urlDownload ?? _userModel!.pic,
    );

    await FireStoreUser().updateUserInfo(userModel);

    updateEmailController.clear();
    updateNameController.clear();
    getCurrentUserData(userModel.userId!);
    // showToast(text: 'Update Suc'.tr, state: ToastStates.success);
    isLoading = false;
    update();
    file = null;
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      _userModel = UserModel.fromJson(value.data() as Map<String, dynamic>);
      // emit(GetCurrentUserState());
      setUser(UserModel.fromJson(value.data() as Map<String, dynamic>));
      update();
    });
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

  UploadTask? uploadTask;
  String? urlDownload;
  Future<void>? uploadImage() async {
    final storageRef = FirebaseStorage.instance.ref();
    final path = file!.path;
    Reference reference = storageRef.child('users_images/${p.basename(path)}');
    uploadTask = reference.putFile(imageFile!);
    final snapshot = await uploadTask!.whenComplete(() {});
    urlDownload = await snapshot.ref.getDownloadURL();
    update();
  }
}
