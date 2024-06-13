import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/checkout/checkout_screen.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  // final _scaffoldKey = GlobalKey<ScaffoldState>();

  deleteAlert({context, model, required AppThemeViewModel themeController}) {
    final AlertDialog alart = AlertDialog(
      scrollable: true,
      backgroundColor: themeController.isDark
          ? AppColors.darkBackGroundColor
          : AppColors.lighBackGroundColor,
      title: CustomText(
        text: 'You wanaa delete?'.tr,
        fontSize: 20.0,
      ),
      content: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(300.0)),
        child: GetBuilder<CartViewModel>(
          init: Get.find<CartViewModel>(),
          builder: (controller) => Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        controller.deleteProductById(model.productId!, model);
                        // showToast(
                        //     text: 'Task deleted successfully',
                        //     state: ToastStates.error);
                      },
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 4.0,
                            ),
                            const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            CustomeStaticColorText(
                                text: 'Delete'.tr,
                                color: Colors.white,
                                fontSize: 15.0),
                            const SizedBox(
                              height: 4.0,
                            ),
                          ],
                        ),
                      )),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.blue),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Center(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 5.0,
                            ),
                            const Icon(
                              Icons.cancel,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 2.0,
                            ),
                            CustomeStaticColorText(
                              text: 'Cancel'.tr,
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                          ],
                        ),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          return alart;
        });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      // init: Get.find<CartViewModel>(),
      builder: (controller) => SafeArea(
        child: Scaffold(
          // key: _scaffoldKey,
          body: controller.cartProductModel.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/empty_cart.svg',
                      width: 200.0,
                      height: 200.0,
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    CustomText(
                      text: 'Cart Empty'.tr,
                      fontSize: 25.0,
                    ),
                  ],
                )
              : GetBuilder<AppThemeViewModel>(
                  init: AppThemeViewModel(),
                  builder: (themeController) => Column(children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Dismissible(
                                    key: ValueKey(controller
                                        .cartProductModel[index].productId!),
                                    confirmDismiss:
                                        (DismissDirection direction) async {
                                      return await deleteAlert(
                                          themeController: themeController,
                                          context: context,
                                          model: controller
                                              .cartProductModel[index]);
                                    },
                                    background: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Row(children: [
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        CustomeStaticColorText(
                                          color: Colors.white,
                                          text: 'Delete'.tr,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.delete_rounded,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        const Spacer(),
                                        CustomeStaticColorText(
                                          color: Colors.white,
                                          text: 'Delete'.tr,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.delete_rounded,
                                          size: 25.0,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                      ]),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => DetailsView(
                                            productId: controller
                                                .cartProductModel[index]
                                                .productId!));
                                      },
                                      child: Container(
                                        height: 140,
                                        width: double.infinity,
                                        clipBehavior: Clip.antiAlias,
                                        padding: const EdgeInsets.all(10.0),
                                        decoration: BoxDecoration(
                                            // shape: BoxShape.rectangle,
                                            borderRadius:
                                                BorderRadius.circular(50.0),
                                            color: index % 2 == 0
                                                ? themeController.isDark
                                                    ? AppColors
                                                        .darkBackGroundColor
                                                    : AppColors
                                                        .lighBackGroundColor
                                                : Colors.transparent
                                                    .withOpacity(0.2)),
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: CircleAvatar(
                                                  radius: 55.0,
                                                  backgroundColor: Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    child: Container(
                                                        height: 120.0,
                                                        width: 120,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        // padding: const EdgeInsets.all(0.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Image.network(
                                                          controller
                                                              .cartProductModel[
                                                                  index]
                                                              .image!,
                                                          fit: BoxFit.contain,
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 150,
                                                      child: CustomText(
                                                        text: controller
                                                            .cartProductModel[
                                                                index]
                                                            .name!,
                                                        fontSize: 20.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    CustomText(
                                                      text:
                                                          '\$ ${controller.cartProductModel[index].price!.toString()}',
                                                      color: AppColors
                                                          .mainAppColors,
                                                      fontSize: 20,
                                                    ),
                                                    const SizedBox(
                                                      height: 10.0,
                                                    ),
                                                    Container(
                                                      height: 40.0,
                                                      width: 140.0,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .mainAppColors
                                                              .withOpacity(.3),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      30.0)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              controller
                                                                  .increaseQuantity(
                                                                      index);
                                                            },
                                                            child: Icon(
                                                              Icons.add,
                                                              color: themeController
                                                                      .isDark
                                                                  ? Colors
                                                                      .white70
                                                                  : Colors
                                                                      .black54,
                                                              size: 25.0,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20.0,
                                                          ),
                                                          CustomText(
                                                            text: controller
                                                                .cartProductModel[
                                                                    index]
                                                                .quantity!
                                                                .toString(),
                                                            fontSize: 20.0,
                                                            color: Colors.black,
                                                          ),
                                                          const SizedBox(
                                                            width: 20.0,
                                                          ),
                                                          Container(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom:
                                                                        20.0),
                                                            child:
                                                                GestureDetector(
                                                              onTap: () {
                                                                controller
                                                                    .decreaseQuantity(
                                                                        index);
                                                              },
                                                              child: Icon(
                                                                Icons.minimize,
                                                                color: themeController
                                                                        .isDark
                                                                    ? Colors
                                                                        .white70
                                                                    : Colors
                                                                        .black54,
                                                                size: 25.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10.0),
                              itemCount: controller.cartProductModel.length),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              CustomText(
                                text: 'TOTAL'.tr,
                                fontSize: 22.0,
                                // color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              GetBuilder<CartViewModel>(
                                init: Get.find<CartViewModel>(),
                                builder: (controller) => CustomeStaticColorText(
                                  text: '\$ ${controller.totalPrice}',
                                  fontSize: 20.0,
                                  color: AppColors.mainAppColors,
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 100,
                              width: 170,
                              padding: const EdgeInsets.all(20.0),
                              child: CustomeButton(
                                  text: 'CHECKOUT'.tr,
                                  onPressed: () {
                                    Get.to(() => const CheckOutScreen());
                                  })),
                        ],
                      ),
                    )
                  ]),
                ),
        ),
      ),
    );
  }
}
