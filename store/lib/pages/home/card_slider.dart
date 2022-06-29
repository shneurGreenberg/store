import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/popular_product_controller.dart';
import 'package:store/routes/route_helper.dart';
import 'package:store/utils/app_constans.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/dimensions.dart';
import '../../models/products_model.dart';
import '../../widgets/food_description.dart';

class CardSlider extends StatefulWidget {
  const CardSlider({Key? key}) : super(key: key);

  @override
  State<CardSlider> createState() => _CardSliderState();
}

class _CardSliderState extends State<CardSlider> {
  var _currentPageValue = 0.0;

  double height = Dimensions.pageViewContainer;
  final double _scaleFactor = 0.8;
  PageController pageController = PageController(viewportFraction: 0.85);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PopularProductController>(builder: (popularProduct) {
      return popularProduct.isLoaded
          ? Column(
              children: [
                SizedBox(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProduct.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPageItem(position,
                            popularProduct.popularProductList[position]);
                      }),
                ),

                // dots section.
                DotsIndicator(
                  dotsCount: popularProduct.popularProductList.length > 1
                      ? popularProduct.popularProductList.length
                      : 10,
                  position: _currentPageValue,
                  decorator: DotsDecorator(
                    activeColor: AppColors.mainColor,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ],
            )
          : CircularProgressIndicator(
              color: AppColors.mainColor,
            );
    });
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // make the page item smaller when it's not the current page
    Matrix4 matrix = Matrix4.identity();
    // current page
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTrans = height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);

      // next page
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTrans = height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1);

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);

      // previous page
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);

      var currentTrans = height * (1 - currentScale) / 2;

      matrix = Matrix4.diagonal3Values(1, currentScale, 1);

      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index, "home"));
          },
          child: Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width10, right: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstans.BASE_URL + "/uploads/" + popularProduct.img!,
                ),
              ),
            ),
          ),
        ),

        // text and reviews section
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimensions.pageViewTextContainer,
            margin: EdgeInsets.only(
                left: Dimensions.width30,
                right: Dimensions.width30,
                bottom: Dimensions.height30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius20),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xffe8e8e8),
                  blurRadius: 5.0,
                  offset: Offset(0, 5),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-5, 0),
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5, 0),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height15,
                  left: Dimensions.width15,
                  right: Dimensions.width15),
              child: FoodDescription(
                title: popularProduct.name!,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
