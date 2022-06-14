import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/app_icon.dart';
import 'package:store/utils/colors.dart';
import 'package:store/utils/dimensions.dart';
import 'package:store/widgets/text/big_text.dart';
import 'package:store/widgets/text/expandable_text.dart';
import '../../routes/route_helper.dart';

class RecommendedFood extends StatelessWidget {
  const RecommendedFood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    onTap: () {
                      Get.toNamed(RouteHelper.getIntial());
                    },
                    child: const AppIcon(icon: Icons.clear)),
                const AppIcon(icon: Icons.shopping_cart_outlined)
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
                    child: BigText(
                        text: "Recommended Food", size: Dimensions.font26)),
                padding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food1.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: const ExpandableText(
                  text:
                      "loremorem ipsum dolor sit amet consoorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing elirem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem orem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eliipsum dolor sit amet consectetur adipiscing eliectetur adipiscing eli orem ipsum dolor sit amet consectetur adipiscing eli orem ipsum dolor sit amet consectetur adipiscing eli orem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eli orem ipsum dolor sit amet consectetur adipiscing eliorem ipsum dolor sit amet consectetur adipiscing eli orem ipsum dolor sit amet consectetur adipiscing eli ipsum dolor sit amet consectetur adipiscing elit"),
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.width10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "\$12.88 " " x " " 1",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
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
                Container(
                  padding: EdgeInsets.all(
                    Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                  ),
                  child: const BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
