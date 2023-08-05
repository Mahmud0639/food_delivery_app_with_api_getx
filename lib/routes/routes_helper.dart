import 'dart:ffi';

import 'package:food_delivery_app/food/popular_food_page.dart';
import 'package:food_delivery_app/food/recommended_food_details.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:get/get.dart';

class RoutesHelper{
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  //make a function of popularFood to send any data using parameter


  static String getInitial(){
    return '$initial';
  }

  static String getPopularFood(int pageId){
    return '$popularFood?pageId=$pageId';
  }

  static String getRecommendedFood(int recommendedPageId)=>'$recommendedFood?recPageId=$recommendedPageId';
  //or we can like this
  //static String getPopularFood()=>'$popularFood';

  static List<GetPage> routes = [
    GetPage(name: initial, page: ()=>MainFoodPage()),


    GetPage(name: popularFood, page: (){


      var pageId = Get.parameters['pageId'];
      return PopularFoodPage(pageId:int.parse(pageId!));
  },transition: Transition.fadeIn),



    GetPage(name: recommendedFood, page:(){
        var recomPageId = Get.parameters['recPageId'];
        return RecommendedFoodDetails(recommenPageId: int.parse(recomPageId!));
  } )

  ];
}