
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:get/get.dart';

import 'controllers/popular_product_controller.dart';
import 'controllers/recommended_product_controller.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

 late Animation<double> animation;
 late AnimationController animationController;

 Future<void> _loadResource() async{
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();
 }

 @override
  void dispose() {
    // TODO: implement dispose

    animationController.dispose();

    super.dispose();
  }

 void _navigateAfterDelay() async {
   await Future.delayed(const Duration(seconds: 13));
   Get.offNamed(RoutesHelper.getInitial());
 }

 @override
 void initState(){
   super.initState();

   _loadResource();


   animationController = AnimationController(vsync: this,duration: const Duration(seconds: 10))..forward();

   //animationController = animationController.forward() as AnimationController;//we can do it with the short cut that is already we saw above
   animation = CurvedAnimation(parent: animationController, curve: Curves.linear);


   // Delay the navigation for 3 seconds without interrupting the animation.
   _navigateAfterDelay();

  /* Timer(
     const Duration(seconds: 3),
       ()=>Get.offNamed(RoutesHelper.getInitial())
   );*/


 }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(child: Image.asset("assets/images/healty_food.png",width: Dimensions.splash_image,))),
          SizedBox(height: 20,),
          Center(child: Text("FoodPie",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.greenAccent),),)
        ],
      ),
    );
  }
}
