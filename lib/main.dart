import 'package:flutter/material.dart';
import 'package:food_delivery_app/account/auth/sign_up_page.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/food/popular_food_page.dart';
import 'package:food_delivery_app/food/recommended_food_details.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/splash_screen.dart';
import 'package:get/get.dart';
import 'account/auth/sign_in_page.dart';
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

    Get.find<CartController>().getCartData();//to get storage data from the sharedPreferences

    //to keep in memory we need to keep everything in the before of GetMaterial called

    return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SignInPage(),
          //home: MainFoodPage(),
          //initialRoute: RoutesHelper.getSplash(),
          //getPages: RoutesHelper.routes,

        );
      });
    });


  }
}


