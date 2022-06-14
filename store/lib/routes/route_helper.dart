// ignore_for_file: unnecessary_string_interpolations

import 'package:get/get.dart';
import 'package:store/pages/food/popular_food_detail.dart';
import 'package:store/pages/food/recommended_food_details.dart';

import '../pages/home/main_food_page.dart';

class RouteHelper {
  static String initial = "/",
      popularFood = "/popular-food",
      recommendedFood = "/recommended-food";

  static String getIntial() => "$initial";
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood() => "$recommendedFood";

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () {
        return const MainFoodPage();
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        return PopularFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () => const RecommendedFood(),
      transition: Transition.fadeIn,
    ),
  ];
}
