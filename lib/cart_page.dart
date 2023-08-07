import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              top: Dimensions.sizedBoxHeight_20 * 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap:(){

      },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppUsedColors.mainColor,
                      iconSize: Dimensions.iconSize_24,
                    ),
                  ),
                  SizedBox(width: Dimensions.width_20*5,),
                  GestureDetector(
                    onTap: (){
                      //Get.to(()=>MainFoodPage());
                      Get.toNamed(RoutesHelper.getInitial());
                    },
                    child: AppIcon(
                      icon: Icons.home_outlined,
                      iconColor: Colors.white,
                      backgroundColor: AppUsedColors.mainColor,
                      iconSize: Dimensions.iconSize_24,
                    ),
                  ),
                  AppIcon(
                    icon: Icons.shopping_cart,
                    iconColor: Colors.white,
                    backgroundColor: AppUsedColors.mainColor,
                    iconSize: Dimensions.iconSize_24,
                  )
                ],
              )),
          Positioned(
            top: Dimensions.sizedBoxHeight_20*5,
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10),
               // color: Colors.red,
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: GetBuilder<CartController>(builder: (controller){

                    var _cartList = controller.getItems;

                    return ListView.builder(//ListView.Builder has a padding automatically.So to remove that we need to wrap this with the widget of "MediaQuery.removePadding"
                        itemCount: _cartList.length,
                        itemBuilder: (_,index){//here _ means a default context
                          return GestureDetector(
                            onTap: (){
                                var popularIndex = Get.find<PopularProductController>().popularProductList.indexOf(_cartList[index].products!);
                                if(popularIndex>=0){
                                  //if it returns 0 or more than 0 then we can confirm that it is popular products if it not return any thing 0 to more than 0 then it must come from recommended product
                                  Get.toNamed(RoutesHelper.getPopularFood(popularIndex,"cartpage"));
                                }else{
                                  var recommendedIndex = Get.find<RecommendedProductController>().recommendedProductList.indexOf(_cartList[index].products!);
                                  Get.toNamed(RoutesHelper.getRecommendedFood(recommendedIndex,"recommendedpage"));
                                }
                            },
                            child: Container(
                              width: double.maxFinite,
                              height: Dimensions.width_20*5,
                              child: Row(
                                children: [
                                  Container(
                                    width: Dimensions.width_20*5,
                                    height: Dimensions.width_20*5,
                                    margin: EdgeInsets.only(bottom: Dimensions.sizedBoxHeight_10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dimensions.radius_20),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              AppConstants.BASE_URI+AppConstants.UPLOAD_URI+controller.getItems[index].img!
                                            )
                                        )
                                    ),
                                  ),
                                  SizedBox(width: Dimensions.width_10,),
                                  Expanded(child: Container(
                                    //margin: EdgeInsets.only(left: Dimensions.width_10),
                                    //here we no need to write width because we used Expanded here so it will occupy the whole width space of it's parent Container width
                                    height: Dimensions.width_20*5,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ManyUseText(text: controller.getItems[index].name!,color: Colors.black54,),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            ManyUseText(text: "\$"+controller.getItems[index].price.toString(),color: Colors.redAccent,),
                                            Container(
                                              padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius_20),
                                                  color: Colors.white
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (){
                                                     controller.addItem(_cartList[index].products!, -1);
                                                    },
                                                    child:  Icon(Icons.remove,color: AppUsedColors.signColor,),
                                                  ),
                                                  SizedBox(width: Dimensions.width_10/2,),
                                                  ManyUseText(text: _cartList[index].quantity.toString()),//popularProduct.inCartItems.toString()),
                                                  SizedBox(width: Dimensions.width_10/2,),
                                                  GestureDetector(
                                                      onTap: (){
                                                        controller.addItem(_cartList[index].products!, 1);
                                                      },
                                                      child: Icon(Icons.add,color: AppUsedColors.signColor,))
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        });
                  },),
                ),
          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (cartController){
        return Container(
          height: Dimensions.bottom_height_bar,
          //padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_30,left: Dimensions.sizedBoxHeight_20,right: Dimensions.sizedBoxHeight_20,bottom: Dimensions.sizedBoxHeight_30),
          padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
          decoration: BoxDecoration(
            // color:Colors.black26,
              color: AppUsedColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_20),topRight: Radius.circular(Dimensions.radius_20))
          ),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius_20),
                    color: Colors.white
                ),
                child: Row(
                  children: [
                    SizedBox(width: Dimensions.width_10/2,),
                    ManyUseText(text: "\$"+cartController.totalPrice.toString()),
                    SizedBox(width: Dimensions.width_10/2,),

                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                 // popularProduct.addItem(productId);
                },
                child: Container(
                  padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),

                  child: ManyUseText(text: "Checkout",color: Colors.white,),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius_20),
                      color: AppUsedColors.mainColor
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
