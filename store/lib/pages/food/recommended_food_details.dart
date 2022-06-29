import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/popular_product_controller.dart';
import 'package:store/widgets/app_icon.dart';
import 'package:store/controllers/recommended_product_controller.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/text/big_text.dart';
import 'package:store/widgets/text/expandable_text.dart';
import '../../controllers/cart_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constans.dart';
import '../../utils/colors.dart';

class RecommendedFood extends StatelessWidget {
  final int pageId;
  final String page;

  const RecommendedFood({Key? key, required this.pageId, required this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => page == "cartpage"
                        ? Get.toNamed(RouteHelper.getCartPage())
                        : Get.toNamed(RouteHelper.getIntial()),
                    child: const AppIcon(icon: Icons.clear)),
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
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(Dimensions.radius20),
                  ),
                  color: Colors.white,
                ),
                width: double.maxFinite,
                child: Center(
                    child:
                        BigText(text: product.name!, size: Dimensions.font26)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstans.BASE_URL + "/uploads/" + product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableText(
                    text: product.description!,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar:
          GetBuilder<PopularProductController>(builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20 * 2.5,
                  vertical: Dimensions.width10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => controller.setQuantity(false),
                    child: AppIcon(
                      icon: Icons.remove,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                  BigText(
                    text: '\$ ${product.price!}  x  ${controller.inCartItems}',
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font26,
                  ),
                  GestureDetector(
                    onTap: () => controller.setQuantity(true),
                    child: AppIcon(
                      icon: Icons.add,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimensions.iconSize24,
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                      size: Dimensions.iconSize24,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.addToCart(product),
                    child: Container(
                      padding: EdgeInsets.all(
                        Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                      ),
                      child: BigText(
                        text: "\$ ${product.price!} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
