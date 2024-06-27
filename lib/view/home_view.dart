import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/service/home_services.dart';
import 'package:e_commerce/core/theme/app_colors.dart';
import 'package:e_commerce/core/view_model/add_product_view_model.dart';
import 'package:e_commerce/core/view_model/app_theme.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/category_view.dart';
import 'package:e_commerce/view/components/bottom_sheet_widget.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custome_static_color_text.dart';
import 'package:e_commerce/view/widgets/custome_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : GetBuilder<AppThemeViewModel>(
              init: AppThemeViewModel(),
              builder: (themeController) => SafeArea(
                child: Scaffold(
                  key: _scaffoldKey,
                  body: Container(
                    padding:
                        const EdgeInsets.only(top: 40, left: 20.0, right: 20.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          GetBuilder<AppThemeViewModel>(
                              init: AppThemeViewModel(),
                              builder: (controller) => InkWell(
                                  onTap: () {
                                    controller.changeAppTheme();
                                  },
                                  child: Container(
                                      child: _searchTextFormField(
                                          context: context,
                                          isDark: controller.isDark)))),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Categories'.tr,
                                fontSize: 20.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _listViewCategory(),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: 'Best Selling'.tr,
                                fontSize: 20.0,
                              ),
                              CustomText(
                                text: 'See all'.tr,
                                fontSize: 20.0,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          _listViewProducts(),
                          const SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: GetBuilder<AddProductViewModel>(
                      init: AddProductViewModel(),
                      builder: (addController) => FloatingActionButton(
                        backgroundColor: AppColors.mainAppColors,
                        onPressed: () {
                          if (addController.isBottomSheetOpen) {
                            Navigator.pop(context);
                            addController.toggleFloatingAction();
                          } else {
                            addController.toggleFloatingAction();

                            _scaffoldKey.currentState!.showBottomSheet(
                                enableDrag: true,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: AppColors.mainAppColors
                                          .withOpacity(.4),
                                      width: 2),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40)),
                                ),
                                backgroundColor: themeController.isDark
                                    ? AppColors.darkBackGroundColor
                                    : AppColors.lighBackGroundColor, (context) {
                              return BottomSheetWidget(
                                  themeController: themeController);
                            });
                          }
                        },
                        child: Icon(
                          addController.floatingActionIcon,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField(
      {required BuildContext context, required bool isDark}) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for a product'.tr,
          hintStyle: isDark
              ? const TextStyle(color: Colors.black, fontSize: 18.0)
              : Theme.of(context).textTheme.bodyMedium,
          prefixIcon: const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => SizedBox(
        height: 120,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // String categoryId;
                // if (controller.categoryModel[index].name == 'Gatgets') {
                //   categoryId = '';
                // } else if (controller.categoryModel[index].name == 'Men') {
                //   categoryId = '';
                // }else if (controller.categoryModel[index].name == 'Gaming') {
                //   categoryId = '';
                // }else if (controller.categoryModel[index].name == 'Women') {
                //   categoryId = '';
                // }else if (controller.categoryModel[index].name == 'Device') {
                //   categoryId = '';
                // }
                controller.selectedCategoryId(
                    categoryName: controller.categoryModel[index].name!);
                Get.to(() => CategoryView(
                      productId: controller.categoryId,
                    ));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.grey.shade100,
                    ),
                    height: 70,
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.network(
                        controller.categoryModel[index].image.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  CustomText(
                    text: controller.categoryModel[index].name.toString(),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, int index) => const SizedBox(
            width: 20.0,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return StreamBuilder(
        stream: HomeService().productCollectionRef.snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasData) {
            return GetBuilder<HomeViewModel>(
              init: Get.find<HomeViewModel>(),
              builder: (controller) => SizedBox(
                height: 290,
                child: ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsView(
                              productId: documentSnapshot['productId']));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  const SizedBox(
                                    height: 80.0,
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.green.withOpacity(.2),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 70.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: CustomText(
                                              text: documentSnapshot['name'],
                                              fontSize: 20.0,
                                              color: Colors.black54,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 7.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15.0),
                                            child: SizedBox(
                                              height: 30.0,
                                              child: CustomText(
                                                text: documentSnapshot[
                                                    'description']!,
                                                color: Colors.black38,
                                                maxLines: 2,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15.0,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: CustomeStaticColorText(
                                              text:
                                                  '${documentSnapshot['price']!} \$',
                                              color: AppColors.mainAppColors,
                                              // fontSize: 20.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: CircleAvatar(
                                  radius: 60.0,
                                  backgroundColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Container(
                                        height: 100.0,
                                        width: 100,
                                        clipBehavior: Clip.antiAlias,
                                        // padding: const EdgeInsets.all(0.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          color: Colors.white,
                                        ),
                                        child: documentSnapshot['image'] == null
                                            ? Image.network(
                                                'https://firebasestorage.googleapis.com/v0/b/e-commerce-1605e.appspot.com/o/AirPods.jpg?alt=media&token=2b2bf1aa-0e1e-4ca9-828d-a674082ea966')
                                            : Image.network(
                                                documentSnapshot['image'],
                                                fit: BoxFit.contain,
                                              )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ));
                  },
                  separatorBuilder: (context, int index) => const SizedBox(
                    width: 20.0,
                  ),
                ),
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
