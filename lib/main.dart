import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/food/popular_food_page.dart';
import 'package:food_delivery_app/food/recommended_food_details.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:get/get.dart';
import 'cart_page.dart';
import 'helper/dependencies.dart' as dep;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();//we need it to ensure that dependencies are initialized properly
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MainFoodPage(),
      initialRoute: RoutesHelper.getInitial(),
      getPages: RoutesHelper.routes,

    );
  }
}


