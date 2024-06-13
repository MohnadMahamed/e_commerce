import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/service/home_services.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_language_view_model.dart';
import 'package:e_commerce/helper/extension.dart';
// import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view/widgets/expanded_text.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:e_commerce/core/model/cart_product_model.dart';
// import 'package:e_commerce/core/model/product_model.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
// import 'package:sqflite/utils/utils.dart';

// ignore: must_be_immutable
class DetailsView extends StatelessWidget {
  // DocumentSnapshot model;
  String productId;
  DetailsView({Key? key, required this.productId
      // required this.model,
      })
      : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // var collection = FirebaseFirestore.instance.collection('Products');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: HomeService().productsCollection.doc(productId).snapshots(),
            builder: (_,
                AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                    snapshot) {
              if (snapshot.hasError) {
                return CustomText(text: 'Error = ${snapshot.error}');
              }

              if (snapshot.hasData) {
                Map<String, dynamic>? model = snapshot.data!.data();

                return Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 270.0,
                          child: Image.network(
                            model!['image'].toString(),
                            fit: BoxFit.fill,
                          ),
                        ),
                        GetBuilder<AppLanguageViewModel>(
                          init: Get.find<AppLanguageViewModel>(),
                          builder: (controller) => Positioned(
                            left: 20,
                            height: 120.0,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                controller.appLanguage == 'en'
                                    ? Icons.arrow_back_ios
                                    : Icons.arrow_forward_ios,
                                size: 30.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: CustomText(
                                      text: model['name'],
                                      fontSize: 22,
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  model['size'] == ''
                                      ? const SizedBox()
                                      : Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomText(
                                                  text: 'Size'.tr,
                                                  fontSize: 18.0,
                                                ),
                                                CustomText(
                                                  text: model['size'],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  model['color'] == '#ff4caf50'
                                      ? const SizedBox()
                                      : Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(16),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.44,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                  color: Colors.grey),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                CustomText(
                                                  text: 'Color'.tr,
                                                  fontSize: 18.0,
                                                ),
                                                Container(
                                                  width: 30.0,
                                                  height: 20.0,
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    color: HexColor.fromHex(
                                                        model['color']),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                ],
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: 'Details'.tr,
                                    fontSize: 26,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20.0,
                              ),
                              ExpandableTextWidget(
                                text: model['description'],
                                // fontSize: 18,
                                // maxLines: 5,
                                // height: 2.0,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                padding: const EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width * 0.88,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomText(
                                      text: 'Category'.tr,
                                      fontSize: 18.0,
                                    ),
                                    CustomText(
                                      text: model['category'],
                                    ),
                                  ],
                                ),
                              ),
                              // const SizedBox(
                              //   width: 10,
                              // ),

                              const SizedBox(
                                height: 15.0,
                              ),
                              model['company'] == ''
                                  ? const SizedBox()
                                  : Container(
                                      padding: const EdgeInsets.all(16),
                                      width: MediaQuery.of(context).size.width *
                                          0.88,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          CustomText(
                                            text: 'Company'.tr,
                                            fontSize: 18.0,
                                          ),
                                          CustomText(
                                            text: model['company'],
                                          ),
                                        ],
                                      ),
                                    ),
                              const SizedBox(
                                height: 15.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: 'PRICE'.tr,
                                fontSize: 22.0,
                                color: Colors.grey,
                              ),
                              CustomText(
                                text: ' \$ ${model['price']}',
                                color: AppColors.mainAppColors,
                                fontSize: 18.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            child: GetBuilder<CartViewModel>(
                              init: Get.find<CartViewModel>(),
                              builder: (controller) => SizedBox(
                                  // padding: const EdgeInsets.all(20.0),
                                  width: 120,
                                  height: 60,
                                  child: CustomeButton(
                                      text: 'Add'.tr,
                                      onPressed: () {
                                        debugPrint(controller
                                            .cartProductModel.length
                                            .toString());
                                        controller.addProduct(CartProductModel(
                                            name: model['name'],
                                            image: model['image'] ??
                                                Image.network(
                                                    'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/AirPods.jpg?alt=media&token=2b2bf1aa-0e1e-4ca9-828d-a674082ea966'),
                                            price: model['price'],
                                            quantity: 1,
                                            productId: model['productId']));
                                      })),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return const CircularProgressIndicator();
            }),
      ),
    ));
  }
}
