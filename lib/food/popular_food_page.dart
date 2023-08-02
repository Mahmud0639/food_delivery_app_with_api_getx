import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import '../utils/app_used_colors.dart';
import '../widgets/icon_and_text_widget.dart';
import '../widgets/many_use_text.dart';
import '../widgets/small_text.dart';

class PopularFoodPage extends StatelessWidget {
  const PopularFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(
                      "assets/images/laptop.webp"
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
                  AppIcon(icon: Icons.arrow_back_ios),
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
                    AppColumn(name: "MacOs book"),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight_20,
                    ),
                    ManyUseText(text: "Introduce"),
                    SizedBox(
                      height: Dimensions.sizedBoxHeight_20,
                    ),
                    //here SingleChildScrollView won't work alone when it is in the only Column widget, so to work properly we should wrap with Expanded widget
                    Expanded(child: SingleChildScrollView(child: ExpandableTextWidget(text: "Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,Bangladesh is my country, Bangladesh is my country,")))
                  ],
                ),





          ))
        ],
      ),
      bottomNavigationBar: Container(
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
                  Icon(Icons.remove,color: AppUsedColors.signColor,),
                  SizedBox(width: Dimensions.width_10/2,),
                  ManyUseText(text: "0"),
                  SizedBox(width: Dimensions.width_10/2,),
                  Icon(Icons.add,color: AppUsedColors.signColor,)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
              child: ManyUseText(text: "\$10 | Add to cart",color: Colors.white,),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius_20),
                color: AppUsedColors.mainColor
              ),
            )
          ],
        ),
      ),
    );
  }
}
