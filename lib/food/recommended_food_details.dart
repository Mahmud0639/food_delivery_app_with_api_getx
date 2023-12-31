import 'package:flutter/material.dart';
import 'package:food_delivery_app/cart_page.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:get/get.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int recommenPageId;
  final String page;
  const RecommendedFoodDetails({super.key,required this.recommenPageId,required this.page});

  @override
  Widget build(BuildContext context) {

    var recoProduct = Get.find<RecommendedProductController>().recommendedProductList[recommenPageId];
    Get.find<PopularProductController>().initProduct(recoProduct, Get.find<CartController>());


    return Scaffold(
      backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,//by default it is true so we can see one back button appear and it works. But in this case we don't need this because we have cross button
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(page=="recommendedpage"){
                        Get.toNamed(RoutesHelper.getCartPage());
                      }else{
                        Get.toNamed(RoutesHelper.getInitial());
                      }

                    },
                    child: AppIcon(icon: Icons.clear),
                  ),
                  //AppIcon(icon: Icons.shopping_cart_outlined)
                  GetBuilder<PopularProductController>(builder: (popularProduct){
                    return GestureDetector(
                      onTap: (){
                        if(popularProduct.totalItems>=1){
                          Get.toNamed(RoutesHelper.getCartPage());
                        }

                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          //or we can like this
                          //Get.find<PopularProductController>().totalItems>=1?Container():Container()
                          popularProduct.totalItems>=1?Positioned(
                              right:0,top:0,

                                  child: AppIcon(icon: Icons.circle,size: 20,iconColor: Colors.transparent,backgroundColor: AppUsedColors.mainColor,)):Container(),
                          popularProduct.totalItems>=1?Positioned(top: 3,right: 3,child: ManyUseText(text: popularProduct.totalItems.toString(),size: 12,color: Colors.white,)):Container()



                        ],
                      ),
                    );
                  })
                ],
              ),
              bottom: PreferredSize(preferredSize: Size.fromHeight(20),
                child: Container(

                 child: Center(child: ManyUseText(text: recoProduct.name!,size: Dimensions.font_20,)),
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
                background: Image.network(AppConstants.BASE_URI+AppConstants.UPLOAD_URI+recoProduct.img!),


              ),
            ),
            SliverToBoxAdapter(

              child: Column(
                children: [
                  Container(
                    child: ExpandableTextWidget(text: recoProduct.description!),
                    margin: EdgeInsets.only(left: Dimensions.width_20,right: Dimensions.width_20,bottom: Dimensions.sizedBoxHeight_20),
                  )
                ],
              ),
            )
          ],
        ),
      bottomNavigationBar: GetBuilder<PopularProductController>(builder: (popularController){
        return Column(
          mainAxisSize: MainAxisSize.min,//if Icons are showing on the top of the appBar then we should use it in the Column
          children: [
            Container(
              padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_20,right: Dimensions.width_20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(

                      onTap: (){
                        popularController.setQuantity(false);
                      },
                      child: AppIcon(icon: Icons.remove,backgroundColor: AppUsedColors.mainColor,iconSize: Dimensions.iconSize_24,)),
                  ManyUseText(text: "\$ ${recoProduct.price} X  ${popularController.inCartItems}",color: AppUsedColors.mainBlackColor,size: Dimensions.font_24,),
                  GestureDetector(

                      onTap: (){
                          popularController.setQuantity(true);
                      },
                      child: AppIcon(icon: Icons.add,backgroundColor: AppUsedColors.mainColor,iconSize: Dimensions.iconSize_24,))
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
                  GestureDetector(
                    onTap: (){
                      popularController.addItem(recoProduct);
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: Dimensions.sizedBoxHeight_10,bottom: Dimensions.sizedBoxHeight_10,left: Dimensions.width_10,right: Dimensions.width_10),
                      child: ManyUseText(text: "\$ ${recoProduct.price} | Add to cart",color: Colors.white,),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius_20),
                          color: AppUsedColors.mainColor
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },)
    );
  }
}
