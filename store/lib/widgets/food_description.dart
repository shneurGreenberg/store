import 'package:flutter/material.dart';
import 'package:store/widgets/text/big_text.dart';
import 'package:store/widgets/text/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'food_info.dart';

class FoodDescription extends StatelessWidget {
  final String title;
  const FoodDescription({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BigText(
        text: title,
        size: Dimensions.font26,
      ),
      SizedBox(height: Dimensions.height10),
      Row(
        children: [
          Wrap(
            children: List.generate(
              5,
              (index) => Icon(Icons.star,
                  color: AppColors.mainColor, size: Dimensions.height20),
            ),
          ),
          SizedBox(width: Dimensions.width10),
          const SmallText(text: "4.5"),
          SizedBox(width: Dimensions.width10),
          const SmallText(text: "1287"),
          SizedBox(width: Dimensions.width10),
          const SmallText(text: "coments"),
        ],
      ),
      SizedBox(height: Dimensions.height10),
      const FoodInfo()
    ]);
  }
}
