import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store/controllers/popular_product_controller.dart';
// import 'package:store/pages/cart/cart_page.dart';
import 'package:store/pages/home/main_food_page.dart';
import 'package:store/routes/route_helper.dart';
import 'controllers/recommended_product_controller.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // provide the PopularProductController to the GetX
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home:
            // CartPage()
            const MainFoodPage(),
        initialRoute: RouteHelper.initial,
        getPages: RouteHelper.routes);
  }
}
