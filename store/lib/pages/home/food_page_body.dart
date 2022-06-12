// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:store/controllers/popular_product_controller.dart';
import 'package:store/pages/home/card_slider.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/food_info.dart';

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

        // Popular text section.
        // Popular text title.
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

        // Popular cards.
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
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
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white38,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/food1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // popular cards - text
                Expanded(
                  child: Container(
                    height: Dimensions.listViewTextSise,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(Dimensions.radius20),
                          bottomRight: Radius.circular(Dimensions.radius20)),
                      color: const Color.fromARGB(255, 220, 139, 139),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10, right: Dimensions.width10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            BigText(
                              text: "Nutrition fruit meal in China.",
                              color: Colors.white,
                            ),
                            SmallText(
                              text: "With a discovery characteristics.",
                              color: Colors.white,
                            ),
                            FoodInfo()
                          ]),
                    ),
                  ),
                )
              ]),
            );
          },
          itemCount: 10,
        )
      ],
    );
  }

// Build card slider section.
}
