import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/cart_controller.dart';
import 'package:store/routes/route_helper.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/app_icon.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../utils/app_constans.dart';
import '../../utils/colors.dart';
import '../../widgets/text/big_text.dart';
import '../../widgets/text/small_text.dart';

class CartPage extends StatelessWidget {
  // final String page;

  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                  SizedBox(width: Dimensions.width20 * 5),
                  GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.getIntial()),
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ],
              )),
          Positioned(
              left: Dimensions.width20,
              right: Dimensions.width20,
              top: Dimensions.height20 * 5,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: GetBuilder<CartController>(builder: (cartController) {
                  var _cartList = cartController.getAllItems;
                  return ListView.builder(
                      itemCount: _cartList.length,
                      itemBuilder: (_, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          margin: EdgeInsets.symmetric(
                              vertical: Dimensions.height10),
                          child: Row(children: [
                            //  - image
                            GestureDetector(
                              onTap: () {
                                var popularIndex =
                                    Get.find<PopularProductController>()
                                        .popularProductList
                                        .indexOf(_cartList[index].product!);
                                if (popularIndex >= 0) {
                                  Get.toNamed(RouteHelper.getPopularFood(
                                      popularIndex, "cartpage"));
                                } else {
                                  var recommendedIndex =
                                      Get.find<RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                  Get.toNamed(RouteHelper.getRecommendedFood(
                                      recommendedIndex, "cartpage"));
                                }
                              },
                              child: Container(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(AppConstans.BASE_URL +
                                        "/uploads/" +
                                        _cartList[index].img!),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Dimensions.width10),

                            //  - text
                            Expanded(
                              child: SizedBox(
                                height: Dimensions.height20 * 5,
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
                                          text: _cartList[index].name!,
                                          color: Colors.black54,
                                        ),
                                        const SmallText(
                                          text: "spicy",
                                          color: Colors.white,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: _cartList[index]
                                                  .price
                                                  .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: Dimensions.width10,
                                                vertical: Dimensions.height10,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius20),
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            -1),
                                                    child: Icon(Icons.remove,
                                                        color: AppColors
                                                            .signColor),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  BigText(
                                                    text: _cartList[index]
                                                        .quantity
                                                        .toString(),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          Dimensions.width10 /
                                                              2),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        cartController.addItem(
                                                            _cartList[index]
                                                                .product!,
                                                            1),
                                                    child: Icon(Icons.add,
                                                        color: AppColors
                                                            .signColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ]),
                                ),
                              ),
                            )
                          ]),
                        );
                      });
                }),
              ))
        ],
      ),
    );
  }
}
