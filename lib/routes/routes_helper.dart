import 'dart:ffi';

import 'package:food_delivery_app/cart_page.dart';
import 'package:food_delivery_app/food/popular_food_page.dart';
import 'package:food_delivery_app/food/recommended_food_details.dart';
import 'package:food_delivery_app/home_page.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/splash_screen.dart';
import 'package:get/get.dart';

class RoutesHelper{
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  //make a function of popularFood to send any data using parameter


  static String getSplash(){
    return '$splashPage';
  }

  static String getInitial(){
    return '$initial';
  }

  static String getPopularFood(int pageId,String page){
    return '$popularFood?pageId=$pageId&page=$page';
  }

  static String getRecommendedFood(int recommendedPageId,String page) {
    return '$recommendedFood?recPageId=$recommendedPageId&page=$page';
  }
    static String getCartPage()=>'$cartPage';
    //or we can like this
    //static String getPopularFood()=>'$popularFood';

    static List<GetPage> routes = [

      GetPage(name: splashPage, page: ()=>SplashScreen()),

      GetPage(name: initial, page: ()=>HomePage()),


      GetPage(name: popularFood, page: (){


        var pageId = Get.parameters['pageId'];
        var page = Get.parameters['page'];
        return PopularFoodPage(pageId:int.parse(pageId!),page:page!);
      },transition: Transition.fadeIn),



      GetPage(name: recommendedFood, page:(){
        var recomPageId = Get.parameters['recPageId'];
        var page = Get.parameters['page'];
        return RecommendedFoodDetails(recommenPageId: int.parse(recomPageId!),page:page!);
      } ),



      GetPage(name: cartPage, page: (){
        return CartPage();
      },
          transition: Transition.fadeIn
      )

    ];
  }
