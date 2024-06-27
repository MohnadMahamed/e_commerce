import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';

class CustomeButtonSocial extends StatelessWidget {
  final String text;
  final String imageName;
  final void Function() onPressed;

  const CustomeButtonSocial(
      {super.key,
      required this.text,
      required this.imageName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Image.asset(imageName),
            const SizedBox(width: 80),
            CustomText(
              text: text,
            )
          ],
        ),
      ),
    );
  }
}
