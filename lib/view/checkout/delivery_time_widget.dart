import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CheckOutViewModel>(
        init: Get.find<CheckOutViewModel>(),
        builder: (controller) => Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            RadioListTile<Delivery>(
              value: Delivery.standardDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  controller.delivery = value!;
                });
              },
              title: Row(
                children: [
                  CustomText(
                    text: 'Standard Delivery'.tr,
                    fontSize: 22.0,
                  ),
                ],
              ),
              subtitle: CustomText(
                text: 'between 3-5 days'.tr,
                fontSize: 16.0,
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            RadioListTile<Delivery>(
              value: Delivery.nextDayDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  controller.delivery = value!;
                });
              },
              title: Row(
                children: [
                  CustomText(
                    text: 'Next Day Delivery'.tr,
                    fontSize: 22.0,
                  ),
                ],
              ),
              subtitle: CustomText(
                text: 'will be delivered the next day'.tr,
                fontSize: 16.0,
                maxLines: 3,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            RadioListTile<Delivery>(
              value: Delivery.nominatedDelivery,
              groupValue: controller.delivery,
              onChanged: (Delivery? value) {
                setState(() {
                  controller.delivery = value!;
                });
              },
              title: Row(
                children: [
                  CustomText(
                    text: 'Nominated Delivery'.tr,
                    fontSize: 22.0,
                  ),
                ],
              ),
              subtitle: CustomText(
                text: 'selected date'.tr,
                fontSize: 16.0,
                maxLines: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
