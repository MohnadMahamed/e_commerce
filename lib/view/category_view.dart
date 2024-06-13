// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/view/components/empty_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:e_commerce/core/service/home_services.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';

class CategoryView extends StatelessWidget {
  final String productId;

  const CategoryView({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GetBuilder<AppThemeViewModel>(
        init: AppThemeViewModel(),
        builder: (themeController) => Center(
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 30.0,
                          color: themeController.isDark
                              ? Colors.white70
                              : Colors.black54,
                        ),
                      ),
                      const SizedBox(
                        width: 30.0,
                      ),
                      const CustomText(
                        text: 'Category Page',
                        fontSize: 23.0,
                      ),
                    ],
                  ),
                ),
                StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                    stream: HomeService()
                        .categoryCollection
                        .doc(productId)
                        .snapshots(),
                    builder: (_,
                        AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return CustomText(text: 'Error = ${snapshot.error}');
                      }
                      if (snapshot.hasData) {
                        // Map<String, dynamic>? model = snapshot.data!.data();
                        List productsId = snapshot.data!['productsId'];
                        return Expanded(
                          child: Column(
                            children: [
                              Expanded(
                                child: productsId.isEmpty
                                    ? const EmptyList(text: 'Category is Empty')
                                    : Center(
                                        child: Container(
                                          // color: Colors.amberAccent,
                                          // height: MediaQuery.of(context).size.height * .9,
                                          padding: const EdgeInsets.all(10.0),

                                          width: double.infinity,
                                          child: ListView.separated(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                var productId =
                                                    productsId[index];

                                                return Center(
                                                  child: StreamBuilder<
                                                          DocumentSnapshot<
                                                              Map<String,
                                                                  dynamic>>>(
                                                      stream: HomeService()
                                                          .productsCollection
                                                          .doc(productId
                                                              .toString())
                                                          .snapshots(),
                                                      builder: (_,
                                                          AsyncSnapshot<
                                                                  DocumentSnapshot<
                                                                      Map<String,
                                                                          dynamic>>>
                                                              snapshot) {
                                                        if (snapshot.hasError) {
                                                          return CustomText(
                                                              text:
                                                                  'Error = ${snapshot.error}');
                                                        }

                                                        if (snapshot.hasData) {
                                                          Map<String, dynamic>?
                                                              model = snapshot
                                                                  .data!
                                                                  .data();

                                                          return InkWell(
                                                            onTap: () {
                                                              Get.to(() =>
                                                                  DetailsView(
                                                                      productId:
                                                                          model[
                                                                              'productId']));
                                                            },
                                                            child: Container(
                                                              // height: 140,
                                                              width: double
                                                                  .infinity,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      10.0),
                                                              decoration: BoxDecoration(
                                                                  // shape: BoxShape.rectangle,
                                                                  borderRadius: BorderRadius.circular(50.0),
                                                                  color: index % 2 == 0
                                                                      ? themeController.isDark
                                                                          ? AppColors.darkBackGroundColor
                                                                          : AppColors.lighBackGroundColor
                                                                      : Colors.transparent.withOpacity(0.2)),
                                                              child: Center(
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              10.0),
                                                                      child:
                                                                          CircleAvatar(
                                                                        radius:
                                                                            55.0,
                                                                        backgroundColor:
                                                                            Colors.white,
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsets
                                                                              .all(
                                                                              10.0),
                                                                          child: Container(
                                                                              height: 120.0,
                                                                              width: 120,
                                                                              clipBehavior: Clip.antiAlias,
                                                                              // padding: const EdgeInsets.all(0.0),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(50.0),
                                                                                color: Colors.white,
                                                                              ),
                                                                              child: Image.network(
                                                                                model!['image'],
                                                                                fit: BoxFit.contain,
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .symmetric(
                                                                          horizontal:
                                                                              20.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          SizedBox(
                                                                            width:
                                                                                150,
                                                                            child:
                                                                                CustomText(
                                                                              text: model['name'],
                                                                              fontSize: 20.0,
                                                                              maxLines: 2,
                                                                            ),
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10.0,
                                                                          ),
                                                                          CustomeStaticColorText(
                                                                            text:
                                                                                '\$ ${model['price']}',
                                                                            color:
                                                                                AppColors.mainAppColors,
                                                                            fontSize:
                                                                                20,
                                                                          ),
                                                                          const SizedBox(
                                                                            height:
                                                                                10.0,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        return const CircularProgressIndicator();
                                                      }),
                                                );
                                              },
                                              //  itemCount: 10,
                                              separatorBuilder: (context,
                                                      index) =>
                                                  const SizedBox(height: 10.0),
                                              itemCount: productsId.length),
                                        ),
                                      ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 10),
                                child: Container(
                                  width: double.infinity,
                                  clipBehavior: Clip.antiAlias,
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                      // shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(50.0),
                                      color:
                                          Colors.transparent.withOpacity(0.2)),
                                  child: Center(
                                    child: CustomText(
                                      fontSize: 22,
                                      text: '${productsId.length} Product',
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return const CircularProgressIndicator();
                    })
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
