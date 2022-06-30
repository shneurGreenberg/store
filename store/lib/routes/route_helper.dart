// ignore_for_file: unnecessary_string_interpolations
import 'package:get/get.dart';
import 'package:store/pages/food/popular_food_detail.dart';
import 'package:store/pages/food/recommended_food_details.dart';
import '../pages/cart/cart_page.dart';
import '../pages/home/main_food_page.dart';

class RouteHelper {
  static String initial = "/",
      popularFood = "/popular-food",
      cartPage = "/cart-page",
      recommendedFood = "/recommended-food";

  static String getIntial() => "$initial";
  static String getPopularFood(int pageId, String page) =>
      "$popularFood?pageId=$pageId&page=$page";
  static String getRecommendedFood(int pageId, String page) =>
      "$recommendedFood?pageId=$pageId&page=$page";
  static String getCartPage() => "$cartPage";

  static List<GetPage> routes = [
    GetPage(
      name: "/",
      page: () => const MainFoodPage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: popularFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];
        return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters["pageId"];
        var page = Get.parameters["page"];

        return RecommendedFood(pageId: int.parse(pageId!), page: page!);
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: cartPage,
      page: () => const CartPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
