import 'dart:developer';

import 'package:e_commerce/core/model/user_model.dart';
import 'package:e_commerce/core/service/firestore_user.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final FacebookLogin _facebookLogin = FacebookLogin();
  String? email, password, name;
  final Rxn<User?> _user = Rxn<User>();
  String? get user => _user.value?.email;
  final LocalStorageData localStorageData = Get.find<LocalStorageData>();

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser!.uid);
    }
  }

  // @override
  // void onReady() {
  //    TDO: implement onReady
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //    TOO: implement onClose
  //   super.onClose();
  // }

  void googleSignInMethod() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    debugPrint(googleUser.toString());
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    await _auth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(() => const ControlView());
      log(user.user!.displayName.toString());
    });
  }

  void facebookSignInMethod() async {
    // FacebookLoginResult result = await _facebookLogin.logIn(['email']);
    // final accessToken = result.accessToken.token;
    // if (result.status == FacebookLoginStatus.loggedIn) {
    //   final faceCredential = FacebookAuthProvider.credential(accessToken);
    //   await _auth.signInWithCredential(faceCredential);
    // }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!)
          .then((value) async {
        getCurrentUserData(value.user!.uid);
      });

      Get.offAll(() => const ControlView());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(() => const ControlView());
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Error login account', e.toString(),
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email,
      name: name ?? user.user!.displayName,
      pic: user.user!.photoURL ?? 'default',
    );
    await FireStoreUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FireStoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }
}
