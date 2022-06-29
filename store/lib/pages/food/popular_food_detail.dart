import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/widgets/app_icon.dart';
// import 'package:store/pages/home/main_food_page.dart';
import 'package:store/utils/app_constans.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/food_description.dart';
import 'package:store/widgets/text/big_text.dart';
import '../../controllers/cart_controller.dart';
import '../../controllers/popular_product_controller.dart';
import '../../routes/route_helper.dart';
import '../../widgets/text/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImageSise,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      AppConstans.BASE_URL + "/uploads/" + product.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // icons widgets
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => page == "cartpage"
                          ? Get.toNamed(RouteHelper.getCartPage())
                          : Get.toNamed(RouteHelper.getIntial()),
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(
                    builder: ((controller) => Stack(children: [
                          GestureDetector(
                              onTap: () => controller.totalItems >= 1
                                  ? Get.toNamed(RouteHelper.getCartPage())
                                  : null,
                              child: const AppIcon(
                                  icon: Icons.shopping_cart_outlined)),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          controller.totalItems >= 1
                              ? Positioned(
                                  right: 3,
                                  top: 3,
                                  child: BigText(
                                    text: controller.totalItems.toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container()
                        ])),
                  )
                ]),
          ),
          // Food introduction.
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImageSise - 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(
                Dimensions.width20,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodDescription(title: product.name!),
                    SizedBox(height: Dimensions.height20),
                    const BigText(
                      text: "intreduse",
                    ),
                    SizedBox(height: Dimensions.height20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableText(
                          text: product.description!,
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        ],
      ),

      // bottom bar.
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (popularProduct) {
        return Container(
          height: Dimensions.pageViewBottom,
          decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(Dimensions.radius20 * 2)),
          ),
          padding: EdgeInsets.only(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => popularProduct.setQuantity(false),
                      child: Icon(Icons.remove, color: AppColors.signColor),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    BigText(
                      text: popularProduct.inCartItems.toString(),
                    ),
                    SizedBox(width: Dimensions.width10 / 2),
                    GestureDetector(
                      onTap: () {
                        popularProduct.setQuantity(true);
                      },
                      child: Icon(Icons.add, color: AppColors.signColor),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(
                  Dimensions.width20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                ),
                child: GestureDetector(
                  onTap: () => popularProduct.addToCart(product),
                  child: BigText(
                    text: "\$ ${product.price!} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
