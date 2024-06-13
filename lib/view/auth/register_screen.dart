import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade100,
          leading: GestureDetector(
              onTap: () {
                Get.off(() => LoginScreen());
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 30,
                ),
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomText(
                        text: 'Sign Up'.tr,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomeFormField(
                    onSave: (value) {
                      controller.name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        debugPrint('error');
                        return 'value!';
                      }
                      return null;
                    },
                    text: 'Name'.tr,
                    hintText: 'Mohnad Mahamed',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomeFormField(
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        debugPrint('error');
                        return 'value!';
                      }
                      return null;
                    },
                    text: 'Email'.tr,
                    hintText: 'mohnad_mahamed@gmail.com',
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomeFormField(
                    onSave: (value) {
                      controller.password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        debugPrint('error');
                        return 'value!';
                      }
                      return null;
                    },
                    text: 'Password'.tr,
                    hintText: '********',
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomeButton(
                      text: 'SIGN UP'.tr,
                      onPressed: () {
                        // Get.put(HomeViewModel());
                        // Get.put(ProfileViewModel());
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.createAccountWithEmailAndPassword();
                        }
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
