// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/recommended_product_controller.dart';
import 'package:store/pages/home/card_slider.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/food_info.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constans.dart';
import '../../utils/colors.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/small_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  // final double _scaleFactor = 0.8;
  double height = Dimensions.pageViewContainer;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // slider and dots section.

        const CardSlider(),

        // Recommended text section.
        // Recommended text title.
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const BigText(
                text: "Recommended",
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: const BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(width: Dimensions.width10),
              const SmallText(
                text: "See all",
                color: Colors.black54,
              ),
            ],
          ),
        ),

        // Recommended cards.
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recommendedProduct.recommendedrProductList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: Dimensions.width20,
                          right: Dimensions.width20,
                          top: Dimensions.height10,
                        ),
                        child: Row(children: [
                          // popular cards - image
                          Container(
                            width: Dimensions.listViewImageSise,
                            height: Dimensions.listViewImageSise,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius20),
                              color: Colors.white38,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppConstans.BASE_URL +
                                      "/uploads/" +
                                      recommendedProduct
                                          .recommendedrProductList[index].img!,
                                ),
                              ),
                            ),
                          ),

                          // popular cards - text
                          Expanded(
                            child: Container(
                              height: Dimensions.listViewTextSise,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight:
                                        Radius.circular(Dimensions.radius20),
                                    bottomRight:
                                        Radius.circular(Dimensions.radius20)),
                                color: const Color.fromARGB(255, 220, 139, 139),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimensions.width10,
                                    right: Dimensions.width10),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      BigText(
                                        text: recommendedProduct
                                            .recommendedrProductList[index]
                                            .name!,
                                        color: Colors.white,
                                      ),
                                      SmallText(
                                        text: recommendedProduct
                                            .recommendedrProductList[index]
                                            .name!,
                                        color: Colors.white,
                                      ),
                                      const FoodInfo()
                                    ]),
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        })
      ],
    );
  }

// Build card slider section.
}
