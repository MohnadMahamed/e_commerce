// import 'package:e_commerce/core/model/product_model.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/add_product_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/components/pick_color.dart';
import 'package:e_commerce/view/components/product_category.dart';
import 'package:e_commerce/view/components/upload_image_function.dart';
// import 'package:e_commerce/view/components/upload_image_widget.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:dotted_border/dotted_border.dart';
// import 'package:uuid/uuid.dart';

class BottomSheetWidget extends StatelessWidget {
  final AppThemeViewModel themeController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  BottomSheetWidget({super.key, required this.themeController});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      init: AddProductViewModel(),
      builder: (addController) => SizedBox(
        height: MediaQuery.of(context).size.height * .7,
        child: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 15),
                    child: Column(children: [
                      Icon(
                        Icons.linear_scale_sharp,
                        size: 40.0,
                        color: themeController.isDark
                            ? Colors.white70
                            : Colors.black54,
                      ),
                      const SizedBox(height: 10.0),
                      Column(
                        children: [
                          addController.file == null
                              ? DottedBorder(
                                  color: AppColors.mainAppColors,
                                  strokeWidth: 3,
                                  borderType: BorderType.RRect,
                                  radius: const Radius.circular(12),
                                  // padding: EdgeInsets.all(6),
                                  child: GetBuilder<AddProductViewModel>(
                                    init: Get.find<AddProductViewModel>(),
                                    builder: (addController) => InkWell(
                                      onTap: uploadImageFunction(
                                          themeController: themeController,
                                          addController: addController,
                                          pageContext: context),
                                      child: Container(
                                        height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: AppColors.mainAppColors
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                          child: CustomText(
                                            text: 'upload image'.tr,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 103.0,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 200.0,
                                            width: 200.0,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(100.0),
                                              image: DecorationImage(
                                                image: FileImage(
                                                    addController.imageFile!),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0.0,
                                            bottom: 0.0,
                                            child: SizedBox(
                                              height: 60.0,
                                              width: 60.0,
                                              child: IconButton(
                                                onPressed: uploadImageFunction(
                                                    themeController:
                                                        themeController,
                                                    addController:
                                                        addController,
                                                    pageContext: context),
                                                icon: const CircleAvatar(
                                                  radius: 70.0,
                                                  child: Icon(
                                                    Icons.camera_alt_outlined,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomeFormField(
                                    controller:
                                        addController.productNameController,
                                    hintText: 'apple iphone'.tr,
                                    type: TextInputType.name,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter product Name'.tr;
                                      }
                                      return null;
                                    },
                                    text: 'product name'.tr),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                CustomeFormField(
                                    controller:
                                        addController.descriptionController,
                                    hintText: 'write description'.tr,
                                    maxLines: 4,
                                    type: TextInputType.name,
                                    validator: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Please Enter product Description'
                                            .tr;
                                      }
                                      return null;
                                    },
                                    text: 'description'.tr),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomeFormField(
                                        controller:
                                            addController.priceController,
                                        text: 'price'.tr,
                                        hintText: '56,400'.tr,
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return 'Please Enter product Price'
                                                .tr;
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: const ProductCategory()),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      child: CustomeFormField(
                                        controller:
                                            addController.sizeController,
                                        text: 'size'.tr,
                                        hintText: '256 GB'.tr,
                                        validator: (value) {
                                          return null;
                                        },
                                      ),
                                    ),
                                    const PickColorWidget(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: CustomeFormField(
                                      controller:
                                          addController.companyController,
                                      text: 'company'.tr,
                                      hintText: 'amazon.eg'.tr,
                                      validator: (value) {
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                                GetBuilder<AddProductViewModel>(
                                  init: AddProductViewModel(),
                                  builder: (addController) => CustomeButton(
                                      isLoading: addController.loading,
                                      color: addController.loading == true
                                          ? AppColors.mainAppColors
                                              .withOpacity(0.2)
                                          : AppColors.mainAppColors,
                                      text: 'add product'.tr,
                                      onPressed: () {
                                        if (addController.file == null) {
                                          Get.snackbar(
                                              'You Must Add Product Image',
                                              'Uploade Image Is Required',
                                              duration:
                                                  const Duration(seconds: 5),
                                              colorText: Colors.black,
                                              snackPosition: SnackPosition.TOP);
                                        }

                                        if (_formKey.currentState!.validate() &&
                                            addController.file != null) {
                                          print('Addddd Okaaaaaaaaaaaaaaaay');
                                          // Navigator.pop(context);

                                          // addController.toggleFloatingAction();
                                          addController
                                              .addProductToFirebase(context);
                                        } else {
                                          print('3eeeeeeeb kdaaaaaaaaa');
                                        }
                                      }),
                                ),
                                const SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ])))),
      ),
    );
  }
}

/* product name
   description
   color picker
   size (optinal)
   price (optinal)
   email (and dont show to user)
   address (optinal)
   your company (optinal)
   category
   image
*/