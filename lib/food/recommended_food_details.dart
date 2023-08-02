import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.clear),
                  AppIcon(icon: Icons.shopping_cart_outlined)
                ],
              ),
              bottom: PreferredSize(preferredSize: Size.fromHeight(20),
                child: Container(

                 child: Center(child: ManyUseText(text: "Custom Expanded Bar",size: Dimensions.font_20,)),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,left: Dimensions.sizedBoxHeight_10,right: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.radius_20),topRight: Radius.circular(Dimensions.radius_20)),
                    color: Colors.white,
                  ),
              ),),
              pinned: true,
              backgroundColor: AppUsedColors.mainColor,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("assets/images/bg2.jpg",width: double.maxFinite,fit: BoxFit.cover,),


              ),
            ),
            SliverToBoxAdapter(

              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: "My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,My name is Mahamudul Islam,"),
                    margin: EdgeInsets.only(left: Dimensions.width_20,right: Dimensions.width_20,bottom: Dimensions.sizedBoxHeight_20),
                  )
                ],
              ),
            )
          ],
        ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,//if Icons are showing on the top of the appBar then we should use it in the Column
        children: [
          Container(
            padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_20,right: Dimensions.width_20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.remove,backgroundColor: AppUsedColors.mainColor,iconSize: Dimensions.iconSize_24,),
                ManyUseText(text: "\$12.88"+" X"+" 0",color: AppUsedColors.mainBlackColor,size: Dimensions.font_24,),
                AppIcon(icon: Icons.add,backgroundColor: AppUsedColors.mainColor,iconSize: Dimensions.iconSize_24,)
              ],
            ),

          ),
          Container(
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
                  padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_20,right: Dimensions.width_20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius_20),
                      color: Colors.white
                  ),
                  child: Icon(Icons.favorite,color: AppUsedColors.mainColor,)
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
        ],
      ),
    );
  }
}