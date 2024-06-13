import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class EmptyList extends StatelessWidget {
  final String text;
  const EmptyList({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/empty_cart.svg',
                  width: 200.0,
                  height: 200.0,
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: CustomText(
                    text: text.tr,
                    maxLines: 2,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
