import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 220,
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => SizedBox(
                      height: 350.0,
                      width: 160,
                      child: Column(
                        children: [
                          SizedBox(
                              width: 160.0,
                              height: 130.0,
                              child: CircleAvatar(
                                  radius: 55.0,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                      height: 120.0,
                                      width: 120,
                                      clipBehavior: Clip.antiAlias,
                                      // padding: const EdgeInsets.all(0.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: Colors.white,
                                      ),
                                      child: Image.network(
                                        controller
                                            .cartProductModel[index].image!,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ))),
                          const SizedBox(
                            height: 10.0,
                          ),
                          CustomText(
                              maxLines: 1,
                              text: controller.cartProductModel[index].name!),
                          const SizedBox(
                            height: 5.0,
                          ),
                          CustomeStaticColorText(
                            fontSize: 18.0,
                            text:
                                '\$ ${controller.cartProductModel[index].price!} X ${controller.cartProductModel[index].quantity!}',
                            color: AppColors.mainAppColors,
                          ),
                        ],
                      ),
                    ),
                    itemCount: controller.cartProductModel.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10.0),
                  ),
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Shopping Address'.tr,
                      fontSize: 22.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GetBuilder<CheckOutViewModel>(
                  builder: (controller) => CustomText(
                      maxLines: 3,
                      color: Colors.grey,
                      text:
                          '${controller.street1} , ${controller.street2} ${controller.street2 == null ? null : ','} ${controller.city} , ${controller.state} , ${controller.country}'),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Row(
                  children: [
                    CustomText(
                      text: 'Delivery Type'.tr,
                      fontSize: 22.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                GetBuilder<CheckOutViewModel>(
                  builder: (controller) => Row(
                    children: [
                      CustomText(
                          maxLines: 3,
                          color: Colors.grey,
                          text: chooseDeliveryKind(controller.delivery)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
