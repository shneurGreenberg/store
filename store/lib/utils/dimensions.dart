import 'package:get/get.dart';

class Dimensions {
  static double getWidth = Get.context!.width;
  static double getHeight = Get.context!.height;

  static double pageView = getHeight / 2.64;
  static double pageViewContainer = getHeight / 3.84;
  static double pageViewTextContainer = getHeight / 7.03;
  static double pageViewBottom = getHeight / 7.03;

// dinamic height for padding and margin
  static double height45 = getHeight / 18.76;
  static double height30 = getHeight / 28.13;
  static double height20 = getHeight / 42.2;
  static double height15 = getHeight / 56.27;
  static double height10 = getHeight / 84.4;

// dinamic width for padding and margin
  static double width45 = getHeight / 18.76;
  static double width30 = getHeight / 28.13;
  static double width20 = getHeight / 42.2;
  static double width15 = getHeight / 56.27;
  static double width10 = getHeight / 84.4;
  static double width5 = getHeight / 168.8;

// dinamic text size
  static double font16 = getHeight / 52.75;

  static double font20 = getHeight / 42.2;
  static double font26 = getHeight / 32.46;

// dinamic radius
  static double radius15 = getHeight / 56.27;
  static double radius20 = getHeight / 42.2;
  static double radius30 = getHeight / 28.13;

// dinamic icon size
  static double iconSize24 = getHeight / 35.17;
  static double iconSize16 = getHeight / 52.75;

  // List view size.
  static double listViewImageSise = getWidth / 3.25;
  static double listViewTextSise = getWidth / 3.9;

  // Popular food
  static double popularFoodImageSise = getWidth / 2.41;
}
