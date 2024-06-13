import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/add_product_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:e_commerce/view/widgets/custome_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// productCategory(
//         {required AddProductViewModel addController,
//         required BuildContext context,
//         required AppThemeViewModel themeController}) =>
//     () {
//       showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//                 backgroundColor: themeController.isDark
//                     ? AppColors.darkBackGroundColor
//                     : AppColors.lighBackGroundColor,
//                 title: CustomText(
//                   text: 'select product category'.tr,
//                   fontSize: 20.0,
//                   alignment: Alignment.center,
//                 ),
//                 content: Container(
//                   height: MediaQuery.of(context).size.height * .5,
//                   width: double.infinity,
//                   decoration:
//                       BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
//                   child: SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(),
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       GetBuilder<HomeViewModel>(
//                         init: Get.find<HomeViewModel>(),
//                         builder: (controller) => SizedBox(
//                           height: MediaQuery.of(context).size.height * .4,
//                           child: controller.loading.value
//                               ? const Center(child: CircularProgressIndicator())
//                               : GridView.builder(
//                                   gridDelegate:
//                                       const SliverGridDelegateWithFixedCrossAxisCount(
//                                     crossAxisCount: 2,
//                                     crossAxisSpacing: 10,
//                                   ),
//                                   scrollDirection: Axis.vertical,
//                                   itemCount: controller.categoryModel.length,
//                                   itemBuilder: (context, index) {
//                                     return GetBuilder<AddProductViewModel>(
//                                       init: AddProductViewModel(),
//                                       builder: (addController) => InkWell(
//                                         onTap: () {
//                                           addController.selectCategory(
//                                               selected: controller
//                                                   .categoryModel[index]);
//                                         },
//                                         child: Column(
//                                           children: [
//                                             addController.selectedCategory ==
//                                                     controller
//                                                         .categoryModel[index]
//                                                 ? Stack(
//                                                     children: [
//                                                       Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       50.0),
//                                                           color: Colors
//                                                               .grey.shade100,
//                                                         ),
//                                                         height: 70,
//                                                         width: 70,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(12.0),
//                                                           child: Image.network(
//                                                             controller
//                                                                 .categoryModel[
//                                                                     index]
//                                                                 .image
//                                                                 .toString(),
//                                                             fit: BoxFit.contain,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                       Container(
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(
//                                                                       50.0),
//                                                           color: Colors
//                                                               .transparent
//                                                               .withOpacity(.4),
//                                                         ),
//                                                         height: 70,
//                                                         width: 70,
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(12.0),
//                                                           child: Image.network(
//                                                             controller
//                                                                 .categoryModel[
//                                                                     index]
//                                                                 .image
//                                                                 .toString(),
//                                                             fit: BoxFit.contain,
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   )
//                                                 : Container(
//                                                     decoration: BoxDecoration(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               50.0),
//                                                       color:
//                                                           Colors.grey.shade100,
//                                                     ),
//                                                     height: 70,
//                                                     width: 70,
//                                                     child: Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               12.0),
//                                                       child: Image.network(
//                                                         controller
//                                                             .categoryModel[
//                                                                 index]
//                                                             .image
//                                                             .toString(),
//                                                         fit: BoxFit.contain,
//                                                       ),
//                                                     ),
//                                                   ),
//                                             const SizedBox(
//                                               height: 15.0,
//                                             ),
//                                             CustomText(
//                                               alignment: Alignment.center,
//                                               text: controller
//                                                   .categoryModel[index].name
//                                                   .toString(),
//                                             ),
//                                             const SizedBox(
//                                               height: 5.0,
//                                             )
//                                           ],
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(15.0),
//                         child: CustomeButton(
//                           onPressed: () {
//                             Navigator.pop(context);
//                             print(addController.color);
//                           },
//                           text: 'SELECT'.tr,
//                         ),
//                       )
//                     ]),
//                   ),
//                 ),
//               ));
//     };

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddProductViewModel>(
      init: AddProductViewModel(),
      builder: (addController) => GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeController) => InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: themeController.isDark
                            ? AppColors.darkBackGroundColor
                            : AppColors.lighBackGroundColor,
                        title: CustomText(
                          text: 'select product category'.tr,
                          fontSize: 20.0,
                        ),
                        content: Container(
                          height: MediaQuery.of(context).size.height * .5,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0)),
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  GetBuilder<HomeViewModel>(
                                    init: Get.find<HomeViewModel>(),
                                    builder: (controller) => SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .4,
                                      child: controller.loading.value
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator())
                                          : GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 10,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount: controller
                                                  .categoryModel.length,
                                              itemBuilder: (context, index) {
                                                return GetBuilder<
                                                    AddProductViewModel>(
                                                  init: AddProductViewModel(),
                                                  builder: (addController) =>
                                                      InkWell(
                                                    onTap: () {
                                                      addController.selectCategory(
                                                          selected: controller
                                                                  .categoryModel[
                                                              index]);
                                                    },
                                                    child: Column(
                                                      children: [
                                                        addController
                                                                    .selectedCategory ==
                                                                controller
                                                                        .categoryModel[
                                                                    index]
                                                            ? Stack(
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      color: Colors
                                                                          .grey
                                                                          .shade100,
                                                                    ),
                                                                    height: 70,
                                                                    width: 70,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          12.0),
                                                                      child: Image
                                                                          .network(
                                                                        controller
                                                                            .categoryModel[index]
                                                                            .image
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50.0),
                                                                      color: Colors
                                                                          .transparent
                                                                          .withOpacity(
                                                                              .4),
                                                                    ),
                                                                    height: 70,
                                                                    width: 70,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                              .all(
                                                                          12.0),
                                                                      child: Image
                                                                          .network(
                                                                        controller
                                                                            .categoryModel[index]
                                                                            .image
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            : Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade100,
                                                                ),
                                                                height: 70,
                                                                width: 70,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          12.0),
                                                                  child: Image
                                                                      .network(
                                                                    controller
                                                                        .categoryModel[
                                                                            index]
                                                                        .image
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                        const SizedBox(
                                                          height: 15.0,
                                                        ),
                                                        CustomText(
                                                          text: controller
                                                              .categoryModel[
                                                                  index]
                                                              .name
                                                              .toString(),
                                                        ),
                                                        const SizedBox(
                                                          height: 5.0,
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CustomeButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        print(addController.color);
                                      },
                                      text: 'SELECT'.tr,
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ));
            },
            child: CustomeFormField(
              controller: addController.categoryController,
              enabled: false,
              text: 'category'.tr,
              hintText:
                  addController.selectedCategory.name ?? 'Not selected'.tr,
              validator: (String? value) {
                if (addController.selectedCategory.name == null) {
                  return 'Please Enter product Category'.tr;
                }
                return null;
              },
            )
            // Container(
            //   padding: const EdgeInsets.all(16),
            //   height: 60.0,
            //   width: MediaQuery.of(context).size.width * 0.44,
            //   decoration: BoxDecoration(
            //     color: AppColors.mainAppColors.withOpacity(0.5),
            //     borderRadius: BorderRadius.circular(15.0),
            //     border: Border.all(
            //       width: 0.0,
            //       color: AppColors.mainAppColors.withOpacity(0.5),
            //     ),
            //   ),
            //   child: Container(
            //     width: 30.0,
            //     height: 20.0,
            //     padding: const EdgeInsets.all(12.0),
            //     decoration: BoxDecoration(
            //       border: Border.all(
            //         width: 0.0,
            //         color: Colors.transparent,
            //       ),
            //       borderRadius: BorderRadius.circular(15.0),
            //       color: addController.color,
            //     ),
            //   ),
            // )

            // // Container(
            //   width: 20,
            //   height: 20,
            //   decoration: BoxDecoration(
            //     shape: BoxShape.circle,
            //     color: addController.color,
            //   ),
            // ),
            ),
      ),
    );
  }
}
