import 'package:e_commerce/core/constance.dart';
import 'package:e_commerce/view/control_view.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReferenceScreen extends StatelessWidget {
  const ReferenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reference Code'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              paymentExitApp(context);
            },
            icon: const Icon(
              Icons.exit_to_app,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Go to any market to pay',
                fontSize: 20.0,
              ),
              const SizedBox(height: 10.0),
              const CustomText(
                text: 'This is reference code',
                fontSize: 18.0,
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green.shade300,
                ),
                child: Center(
                  child: CustomeStaticColorText(
                    text: ApiConstants.refCode.isEmpty
                        ? '🚫'
                        : ApiConstants.refCode,
                    fontSize: 40.0,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void paymentExitApp(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const CustomText(
            text: 'Are you sure not completed the pay?',
            fontSize: 14,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.offAll(const ControlView());
              },
              child: const Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
