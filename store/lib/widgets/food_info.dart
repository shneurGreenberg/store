import 'package:flutter/material.dart';

import 'icon_text_card.dart';
import '../utils/colors.dart';

class FoodInfo extends StatelessWidget {
  const FoodInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconAndText(
            icon: Icons.circle_sharp,
            text: "normal",
            iconColor: AppColors.iconColor1),
        IconAndText(
            icon: Icons.location_on,
            text: "1.7km",
            iconColor: AppColors.mainColor),
        IconAndText(
            icon: Icons.access_time_rounded,
            text: "32 min",
            iconColor: AppColors.iconColor2),
      ],
    );
  }
}
