
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/food/popular_food_page.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import 'models/product_model.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimensions.pageViewContainer;

  //for showing another slider some edge
  PageController pageController = PageController(viewportFraction: 0.85);



  @override
  void initState() {
    super.initState();

    pageController.addListener(() {
      setState(() {

        _currentPageValue = pageController.page!;
        //print("Current Page is :"+_currentPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
   // super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //to get data from the server immediately we should use the Getx GetBuilder..whenever any update happen in the server immediately it will update the ui
        GetBuilder<PopularProductController>(builder: (popularProducts){
          return popularProducts.isLoaded?Container(
            // color: Colors.black,
            height: Dimensions.pageViewMainContainer,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: popularProducts.popularProductList.length,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position,popularProducts.popularProductList[position]);
                  }),

          ):CircularProgressIndicator(color: AppUsedColors.mainColor,);
        }, ),
      GetBuilder<PopularProductController>(builder: (popularProducts){
        return  DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty?1:popularProducts.popularProductList.length,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: AppUsedColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
        SizedBox(
          height: Dimensions.sizedBoxHeight_30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width_30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ManyUseText(text: "Recommended",size: Dimensions.font_20,),
                SizedBox(width: Dimensions.width_10,),
                Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: ManyUseText(text: ".",color: Colors.black26,),
                ),
                SizedBox(
                  width: Dimensions.width_10,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food pairing"),
                )
              ],
            ),
        ),

        GetBuilder<RecommendedProductController>(builder: (recommendedProducts){
          return recommendedProducts.isLoaded?ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: recommendedProducts.recommendedProductList.length,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    Get.toNamed(RoutesHelper.recommendedFood);
                  },
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(RoutesHelper.getRecommendedFood(index));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: Dimensions.width_20,right: Dimensions.width_20,bottom: Dimensions.width_10),
                      child: Row(
                        children: [
                          Container(
                            width: Dimensions.listViewImageWidth,
                            height: Dimensions.listViewImageHeight,
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(Dimensions.radius_20),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        AppConstants.BASE_URI+AppConstants.UPLOAD_URI+recommendedProducts.recommendedProductList[index].img!
                                    ),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          Expanded(//here we use wrapping the Container widget with Expanded widget so that the Container can occupy the whole width of the parent
                            child: Container(
                              height: Dimensions.listViewContainerText,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(Dimensions.radius_20),bottomRight: Radius.circular(Dimensions.radius_20)),
                                  color: Colors.white
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: Dimensions.width_10,right: Dimensions.width_10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ManyUseText(text: recommendedProducts.recommendedProductList[index].name!),
                                    SizedBox(
                                      height: Dimensions.sizedBoxHeight_10,
                                    ),
                                    SmallText(text: recommendedProducts.recommendedProductList[index].description!),
                                    SizedBox(height: Dimensions.sizedBoxHeight_10,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppUsedColors.iconColor1),
                                        IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppUsedColors.mainColor),
                                        IconAndTextWidget(icon: Icons.access_time_rounded, text: "32min", iconColor: AppUsedColors.iconColor2)

                                      ],
                                    )

                                  ],
                                ),
                              ),
                            ),

                          )
                        ],
                      ),

                    ),
                  ),
                );
              }):CircularProgressIndicator(color: AppUsedColors.mainColor,);
        }),

      ],
    );
  }

  Widget _buildPageItem(int index,Products productList) {

    //to make the slider smaller than the current one
    Matrix4 matrix = Matrix4.identity();
    if(index == _currentPageValue.floor()){//it will give us the whole number int value not as double of fractional like 0, 1, 2 like this not 0.123, 1.123 etc.

        var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);//here 1-(0-0)*(1-something_don't_know_double_value) = 1-0 = 1,so 1 means it will occupy the full height that is 1
      //now we need to pass this currentScale value to the matrix variable
        var currTrans = _height*(1-currentScale)/2;
        matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currTrans, 0);

    }else if(index == _currentPageValue.floor()+1){
      var currentScale = _scaleFactor + (_currentPageValue-index+1)*(1-_scaleFactor);//here index is 2 because we are now in the else if condition(in this index is 2)...so 0.8+(1-2+1)*(1-some_value)= 0.8+0*any_value=0.8
      var currTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if(index == _currentPageValue.floor()-1){
      var currentScale = 1-(_currentPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else{
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(

            onTap: (){
              Get.toNamed(RoutesHelper.getPopularFood(index));
            },

            child: Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius_30),
                  color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
                  image: DecorationImage(
                      image: NetworkImage(AppConstants.BASE_URI+AppConstants.UPLOAD_URI+productList.img!),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: 30.0, right: 30.0,bottom: 30.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius_20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0,5)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-5,0)
                    ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(5,0)
                    )
                  ]
                  ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.padding_15,left: Dimensions.padding_15,right: Dimensions.padding_15),
                child: AppColumn(name: productList.name!,),
              ),
            ),
          )
        ],
      ),
    );
  }
}
