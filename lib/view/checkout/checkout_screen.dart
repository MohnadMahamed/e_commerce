import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/core/view_model/payment_view_model.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view/payment/payment_toggle_screen.dart';
import 'package:e_commerce/view/widgets/custome_button.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      init: CheckOutViewModel(),
      builder: (controller) => GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeCsontroller) => SafeArea(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 80,
              elevation: 1.0,
              // backgroundColor: Colors.white,
              title: CustomText(
                text: 'Checkout'.tr,
                fontSize: 25.0,
                // style: const TextStyle(color: Colors.black, fontSize: 25),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color:
                      themeCsontroller.isDark ? Colors.white70 : Colors.black54,
                ),
                onPressed: () {
                  Get.to(() => const ControlView());
                  controller.goodBye();
                },
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 70.0, left: 70.0, top: 20.0, bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CustomeStaticColorText(
                        text: pageCheckOutName(controller.index),
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                IconStepper(
                  enableNextPreviousButtons: false,
                  enableStepTapping: false,
                  lineColor: AppColors.mainAppColors,
                  lineDotRadius: 2.0,
                  lineLength: 70.0,
                  icons: const [
                    Icon(
                      Icons.donut_large_outlined,
                      color: Colors.white,
                    ),
                    Icon(
                      color: Colors.white,
                      Icons.donut_large_outlined,
                    ),
                    Icon(
                      color: Colors.white,
                      Icons.donut_large_outlined,
                    ),
                  ],
                  activeStep: controller.index,
                  onStepReached: (int i) {
                    // controller.index == incdex;
                    // Get.to(ControlView());
                    // print('---------------------Finsh----------------------');
                  },
                ),
                controller.currentPage(controller.index),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.index == 0
                        ? Container()
                        : Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              padding: const EdgeInsets.all(20.0),
                              width: 150.0,
                              height: 100.0,
                              child: CustomeButton(
                                text: 'Back'.tr,
                                color: Colors.white,
                                textColor: AppColors.mainAppColors,
                                onPressed: () {
                                  if (controller.index > 0) {
                                    controller.decrementIndex();
                                    debugPrint(controller.index.toString());
                                  }
                                },
                              ),
                            ),
                          ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        width: 170.0,
                        height: 100.0,
                        child: GetBuilder<PaymentViewModel>(
                          init: PaymentViewModel(),
                          builder: (paymentController) => GetBuilder<
                                  CartViewModel>(
                              init: CartViewModel(),
                              builder: (cartViewModelController) {
                                return CustomeButton(
                                  text: controller.index == 2
                                      ? 'CHECKOUT'.tr
                                      : 'NEXT'.tr,
                                  onPressed: () {
                                    if (controller.index == 1) {
                                      controller.formState.currentState!.save();
                                      if (controller.formState.currentState!
                                          .validate()) {
                                        if (controller.index <
                                            controller.upperBound) {
                                          controller.incrementIndex();
                                          debugPrint(
                                              controller.index.toString());
                                        }
                                      }
                                    } else if (controller.index == 0) {
                                      controller.incrementIndex();

                                      // Get.to(ControlView());
                                    } else {
                                      paymentController.getOrderReqisterationId(
                                          firstName: 'firstName',
                                          lastName: 'lastName',
                                          email: 'email',
                                          phone: 'phone',
                                          price: cartViewModelController
                                              .totalPrice
                                              .toString());
                                      paymentController.loading.value
                                          ? Get.to(() => const ToggleScreen())
                                          : null;

                                      // Get.to(() => const ControlView());
                                      // controller.goodBye();
                                      // controller.index = 0;
                                      debugPrint(
                                          '---------------Finsh-------------------');
                                    }
                                  },
                                );
                              }),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
