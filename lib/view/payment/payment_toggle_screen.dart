import 'package:e_commerce/core/constance.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/payment_view_model.dart';
import 'package:e_commerce/view/payment/payment_reference_screen.dart';
import 'package:e_commerce/view/payment/payment_visa_screen.dart';
import 'package:e_commerce/view/widgets/custome_snack_bar_widget.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToggleScreen extends StatelessWidget {
  const ToggleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeCsontroller) => GetBuilder<PaymentViewModel>(
            init: PaymentViewModel(),
            builder: (controller) {
              return SafeArea(
                  child: Scaffold(
                appBar: AppBar(
                  toolbarHeight: 80,
                  elevation: 1.0,
                  title: const CustomText(
                    text: 'Payment Way',
                    fontSize: 25.0,
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: themeCsontroller.isDark
                          ? Colors.white70
                          : Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            controller.getRefCode();
                            if (controller.getRefCodeSucess) {
                              showSnackBar(
                                context: context,
                                text: "Success get ref code ",
                                color: Colors.amber.shade400,
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ReferenceScreen(),
                                ),
                                (route) => false,
                              );
                            }
                            if (controller.getRefCodeFail) {
                              showSnackBar(
                                context: context,
                                text: "Error get ref code ",
                                color: Colors.red,
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15.0),
                              border:
                                  Border.all(color: Colors.black87, width: 2.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: NetworkImage(AppImages.refCodeImage),
                                ),
                                SizedBox(height: 15.0),
                                CustomText(
                                  text: 'Payment with Ref code',
                                  fontSize: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const VisaScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15.0),
                              border:
                                  Border.all(color: Colors.black, width: 2.0),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: NetworkImage(AppImages.visaImage),
                                ),
                                CustomText(
                                  text: 'Payment with visa',
                                  fontSize: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ));
            }));
  }
}
