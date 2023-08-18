import 'package:flutter/material.dart';
import 'package:food_delivery_app/food_page_body.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {

  Future<void> _loadResource() async{
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {




   // print("Current screen size is: "+MediaQuery.of(context).size.height.toString());
    //here we are using refresh loader for swipe refreshing to get updated data
    return RefreshIndicator(child:  Column(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 45,bottom: 15),
            padding: EdgeInsets.only(left: 20,right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    ManyUseText(text: "Bangladesh",color: AppUsedColors.mainColor,),
                    Row(
                      children: [
                        SmallText(text: "Madaripur",color: Colors.black54,),
                        Icon(Icons.arrow_drop_down_rounded)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    child: Icon(Icons.search,color: Colors.white,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppUsedColors.mainColor
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(child: SingleChildScrollView(child: FoodPageBody()))
      ],
    ), onRefresh: _loadResource);
  }
}
