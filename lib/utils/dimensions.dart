import 'package:get/get.dart';

class Dimensions{
//current mobile screen height is 640
  //here we can use to divide screenHeight or screenWidth no problem to find out the resolution
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageViewContainer = screenHeight/2.91;
  static double pageViewTextContainer = screenHeight/4.57;

  static double pageViewMainContainer = screenHeight/2;

  static double sizedBoxHeight_10 = screenHeight/64;
  static double sizedBoxHeight_20 = screenHeight/32;
  static double sizedBoxHeight_30 = screenHeight/21.33;

  static double padding_15 = screenHeight/42.67;

  static double font_16 = screenHeight/40;
  static double font_20 = screenHeight/32;
  static double font_24 = screenHeight/26.67;


  static double radius_20 = screenHeight/32;
  static double radius_30 = screenHeight/21.33;


  static double width_30 = screenHeight/21.33;
  static double width_10 = screenHeight/64;
  static double width_20 = screenHeight/32;

  static double height_45 = screenHeight/14.22;

  static double listViewImageHeight = screenHeight/5.33;
  static double listViewImageWidth = screenHeight/6.4;

  static double listViewContainerText = screenHeight/6.4;

  static double fullImage_food_details = screenHeight/2.37;

  static double iconSize_16 = screenHeight/40;
  static double iconSize_24 = screenHeight/26.67;

  static double bottom_height_bar = screenHeight/8;

  static double splash_image = screenHeight/4.27;
  static double cart_history_image = screenHeight/9.85;
  static double cart_history_page_appbar = screenHeight/7.53;
  static double cart_history_page_padding_appbar = screenHeight/16;


}