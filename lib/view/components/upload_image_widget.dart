// import 'package:e_commerce/core/theme/app_colors.dart';
// import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
// import 'package:e_commerce/view/widgets/custome_text.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class UploadImageDialog extends StatelessWidget {
//   final BuildContext pageContext;

//   const UploadImageDialog({
//     super.key,
//     required this.pageContext,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//         onPressed: () {
//           final AlertDialog alart = AlertDialog(
//             scrollable: true,
//             backgroundColor: AppColors.darkBackGroundColor,
//             title: CustomText(
//               text: 'Upload Image from ?'.tr,
//             ),
//             content: Container(
//               decoration:
//                   BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: AppColors.mainAppColors.withOpacity(.8)),
//                       child: InkWell(
//                           onTap: () {
//                             // await cubit.pickGalleryImage().then((value) {
//                             //   Navigator.pop(context);
//                             // });

//                             //  controller.deleteProductById(model.productId!, model);
//                             // showToast(
//                             //     text: 'Task deleted successfully',
//                             //     state: ToastStates.error);
//                           },
//                           child: Center(
//                             child: CustomeStaticColorText(
//                               text: 'Gallery'.tr,
//                               color: Colors.white,
//                             ),
//                           )),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 10.0,
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.all(10.0),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: Colors.blue),
//                       child: InkWell(
//                           onTap: () async {
//                             // await cubit.pickCameraImage().then((value) {
//                             //   Navigator.pop(context);
//                             // });
//                           },
//                           child: Center(
//                             child: CustomeStaticColorText(
//                               color: Colors.white,
//                               text: 'Camara'.tr,
//                             ),
//                           )),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//           showDialog(
//               context: pageContext,
//               barrierDismissible: true,
//               builder: (ctx) {
//                 return alart;
//               });
//         },
//         icon: const CircleAvatar(
//           radius: 22.0,
//           child: Icon(
//             Icons.camera_alt_outlined,
//             size: 20.0,
//           ),
//         ));
//   }
// }
