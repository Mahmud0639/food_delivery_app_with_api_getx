import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/main_food_page.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import 'package:get/get.dart';

import '../utils/app_used_colors.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/many_use_text.dart';
import '../widgets/small_text.dart';

class PopularFoodPage extends StatelessWidget {

  int pageId;

  PopularFoodPage({super.key,required this.pageId});

  @override
  Widget build(BuildContext context) {
    var productId = Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>().initProduct(productId,Get.find<CartController>());

    /*print("page id is: "+pageId.toString());
    print("Product name is: "+productId.name!);*/


    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
              left: 0,//it will start from the left side with 0 margin
              right: 0,//it will start from the right side with 0 margin
              child: Container(
                width: double.maxFinite,//it will occupy the whole space of the parent as much as possible
                height: Dimensions.fullImage_food_details,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      AppConstants.BASE_URI+AppConstants.UPLOAD_URI+productId.img!
                    )
                  )
                ),
          )),
          Positioned(
              top: Dimensions.height_45,
              left: Dimensions.width_20,
              right: Dimensions.width_20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>MainFoodPage());
                    },
                      child: AppIcon(icon: Icons.arrow_back_ios)),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
          )),
          Positioned(
              top: Dimensions.fullImage_food_details-Dimensions.sizedBoxHeight_20,//here our container will take place after the fullImage size quantity so we need to overlap of this image
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.only(left:Dimensions.width_20,right:Dimensions.width_20,top: Dimensions.sizedBoxHeight_20  ),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius_20),topLeft: Radius.circular(Dimensions.radius_20)),
                  color: Colors.white
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(name: productId.name!),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight_20,
                    ),
                    ManyUseText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight_20,
                    ),
                    //here SingleChildScrollView won't work alone when it is in the only Column widget, so to work properly we should wrap with Expanded widget
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: productId.description!)))
                  ],
                ),





          ))
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularProduct){
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
                   GestureDetector(
                     onTap: (){
                       popularProduct.setQuantity(false);
                     },
                     child:  Icon(Icons.remove,color: AppUsedColors.signColor,),
                   ),
                    SizedBox(width: Dimensions.width_10/2,),
                    ManyUseText(text: popularProduct.inCartItems.toString()),
                    SizedBox(width: Dimensions.width_10/2,),
                    GestureDetector(
                        onTap: (){
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(Icons.add,color: AppUsedColors.signColor,))
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
                child: GestureDetector(
                    onTap: (){
                      popularProduct.addItem(productId);//we need to get the same product that is clicked by user with pageId and this is already over here with the help of "Get" and that is "productId"
                    },
                    child: ManyUseText(text: "\$ ${productId.price} | Add to cart",color: Colors.white,)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius_20),
                    color: AppUsedColors.mainColor
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
