import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: Get.find<CheckOutViewModel>(),
      builder: (controller) => Form(
        key: controller.formState,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomText(
                    text: 'Billing address'.tr,
                    fontSize: 20.0,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomeFormField(
                    onSave: (String? value) {
                      controller.street1 = value!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your street';
                      }
                      return null;
                    },
                    text: 'Street 1'.tr,
                    hintText: '21, Mit-Ghamr'.tr,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomeFormField(
                    onSave: (String? value) {
                      controller.street2 = value!;
                    },
                    validator: (String? value) {
                      return null;
                    },
                    text: 'Street 2'.tr,
                    hintText: 'oppsite omegation'.tr,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomeFormField(
                    onSave: (String? value) {
                      controller.city = value!;
                    },
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'you must write your city';
                      }
                      return null;
                    },
                    text: 'State'.tr,
                    hintText: 'Dakahlia'.tr,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomeFormField(
                          onSave: (String? value) {
                            controller.state = value!;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'you must write your state';
                            }
                            return null;
                          },
                          text: 'City'.tr,
                          hintText: 'Mansoura'.tr,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: CustomeFormField(
                          onSave: (String? value) {
                            controller.country = value!;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'you must write your country';
                            }
                            return null;
                          },
                          text: 'Country'.tr,
                          hintText: 'Egypt'.tr,
                        ),
                      ),
                    ],
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
