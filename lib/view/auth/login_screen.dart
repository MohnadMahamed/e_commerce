import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/register_screen.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_button_social.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 70.0, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: 'Welcome'.tr,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: CustomText(
                          text: 'Sign Up'.tr,
                          fontSize: 18,
                          color: AppColors.mainAppColors,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      CustomText(
                        text: 'Sign in to Continue'.tr,
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomeFormField(
                    onSave: (value) {
                      controller.email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        debugPrint('error');
                        return 'Please write your Email';
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
                        return 'Please write your Email';
                      }
                      return null;
                    },
                    text: 'Password'.tr,
                    hintText: '********',
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    text: 'Forgot Password?'.tr,
                    fontSize: 14,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomeButton(
                      text: 'SIGN IN'.tr,
                      onPressed: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      }),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    text: 'OR'.tr,
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomeButtonSocial(
                      text: 'Sign In with Facebook'.tr,
                      imageName: 'assets/images/facebook.png',
                      onPressed: () {
                        controller.facebookSignInMethod();
                      }),
                  const SizedBox(
                    height: 40.0,
                  ),
                  CustomeButtonSocial(
                      text: 'Sign In with Google'.tr,
                      imageName: 'assets/images/google.png',
                      onPressed: () {
                        controller.googleSignInMethod();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
