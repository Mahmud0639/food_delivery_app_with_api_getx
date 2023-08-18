import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/no_data_page.dart';
import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/routes/routes_helper.dart';
import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'models/cart_model.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {

    //now we have to put all the cart model data or object type data in a map...so that we can show data as list view
    //generally, we always take data from database as json or map format and we show these data as ListView.Builder or as ListView in our UI

    var getCartHistoryList = Get.find<CartController>().getCartHistory().reversed.toList();
    Map<String,int> cartItemsPerOrder = {};
    for(int i=0; i<getCartHistoryList.length; i++){
      if(cartItemsPerOrder.containsKey(getCartHistoryList[i].time)){
        //video time: part2: 4:21:23
        cartItemsPerOrder.update(getCartHistoryList[i].time!, (value) => ++value);
      }else{
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    //here we want to get time key that means time name in String so that we can get the specific item that we will click on it
    List<String> cartOrderStringTime(){
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    //after getting all the data as map now we can get the number of time count, how many times a product added at a time
    List<int> cartOrderTimeToList(){
     return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }


    List<int> orderTimes = cartOrderTimeToList();

    var listCounter = 0;

    Widget timeWidget(int index){

      var toShowDate = DateTime.now().toString();

      if(index<getCartHistoryList.length){//**** i need to understand this part again
        DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(getCartHistoryList[listCounter].time!);
        var inputDate = DateTime.parse(parsedDate.toString());
        var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
        toShowDate = outputFormat.format(inputDate);
      }

      return ManyUseText(text: toShowDate);
    }


    return Scaffold(
        body: Column(

          children: [
            Container(
              width: double.maxFinite,
              height: Dimensions.cart_history_page_appbar,
              //padding: EdgeInsets.only(top: Dimensions.cart_history_page_padding_appbar),
              padding: EdgeInsets.only(top: 40),
              color: AppUsedColors.mainColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ManyUseText(text: "Cart History",color: Colors.white,),
                  AppIcon(icon: CupertinoIcons.shopping_cart,iconColor: Colors.black54,)
                ],
              ),
            ),
            GetBuilder<CartController>(builder: (_cartController){
              return _cartController.getCartHistory().length>0?Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: Dimensions.sizedBoxHeight_20,
                      right: Dimensions.width_20,
                      left: Dimensions.width_20),
                  child: MediaQuery.removePadding(
                    removeTop: true,
                    context: context,
                    child: ListView(
                      children: [
                        for(int i = 0; i<orderTimes.length; i++)
                          Container(
                            height: Dimensions.sizedBoxHeight_20*7,
                            margin: EdgeInsets.only(bottom: Dimensions.sizedBoxHeight_20)
                            ,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                
                                timeWidget(listCounter),
                                //under for loop if we want to write dart code then we can't write dart code directly so to write dark code as our need
                                //we can take the iif(immediately invoked function)

                                //here it throws an error for putting this function here
                               /* ((){
                                  DateTime parsedDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(getCartHistoryList[listCounter].time!);
                                  var inputDate = DateTime.parse(parsedDate.toString());
                                  var outputFormat = DateFormat("MM/dd/yyyy hh:mm a");
                                  var toShowDate = outputFormat.format(inputDate);
                                  return ManyUseText(text: toShowDate);
                                }()),*/

                                //  ManyUseText(text: getCartHistoryList[listCounter].time!),
                                SizedBox(height: Dimensions.sizedBoxHeight_10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Wrap(//we took wrap widget here because it draws same thing again and again
                                        direction: Axis.horizontal,
                                        children: List.generate(orderTimes[i], (index){

                                          if(listCounter<getCartHistoryList.length){
                                            listCounter++;
                                          }

                                          return index<=2?Container(//when looping the loop then it check now the current index number is which..if it is 2 or less than 2 then that time it will draw images but when it over then it puts a empty container
                                            width: Dimensions.cart_history_image,
                                            height: Dimensions.cart_history_image,
                                            margin: EdgeInsets.only(right: Dimensions.width_10/2),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(Dimensions.radius_20/3),
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        AppConstants.BASE_URI+AppConstants.UPLOAD_URI+getCartHistoryList[listCounter-1].img!//here we do -1 because at first we declare the listCounter value as 0. But after that we make a condition that if listCounter less than getCartHistoryList.length then only increase so it will increase immediately o to 1. So we did the minus -1
                                                    )
                                                )
                                            ),
                                          ):Container();
                                        })
                                    ),
                                    Container(
                                      height: Dimensions.sizedBoxHeight_20*4,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SmallText(text: "Total",color: AppUsedColors.titleColor,),
                                          ManyUseText(text: orderTimes[i].toString()+" items",color: AppUsedColors.titleColor,),
                                          GestureDetector(
                                            onTap: (){
                                              var orderTime = cartOrderStringTime();
                                              // print('Clicked on : ${orderTime[i].toString()}');
                                              //here we want to check this time with the CartModel(come from SharedPreferences and converted to CartModel object data) time if equals with them then only we want to take the CartModel(come from SharedPreferences and converted to CartModel object data) items and send the _items map to show them in the cart page
                                              //we take this below Map because we want to send this map value to the _items map and so this and that Map type should be same
                                              Map<int,CartModel> moreOrder = {};
                                              for(int j=0; j<getCartHistoryList.length; j++){
                                                if(getCartHistoryList[j].time == orderTime[i]){
                                                  // print("The cart or product id is : ${getCartHistoryList[j].id}");
                                                  //print("The product info is: ${jsonEncode(getCartHistoryList[j])}");//here we use jsonEncode because it is also a CartModel(object type) data and  we need a list of String or json type data to print in the console
                                                  moreOrder.putIfAbsent(getCartHistoryList[j].id!, () =>
                                                      CartModel.fromJson(jsonDecode(jsonEncode(getCartHistoryList[j])))
                                                  );
                                                }
                                              }
                                              //now just give the moreOrder data to the _items map
                                              Get.find<CartController>().setItems = moreOrder;
                                              Get.find<CartController>().addToCartList();
                                              Get.toNamed(RoutesHelper.getCartPage());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(Dimensions.radius_20/4),
                                                  border: Border.all(width: 1,color: AppUsedColors.mainColor)
                                              ),
                                              child: SmallText(text: "One more",color: AppUsedColors.mainColor,),
                                              padding: EdgeInsets.symmetric(vertical: Dimensions.sizedBoxHeight_10/2,horizontal: Dimensions.width_10),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )

                      ],
                    ),
                  ),
                ),
              ):SizedBox(
                  height: MediaQuery.of(context).size.height/1.5,
                  child: const Center(child: NoDataPage(text: "No data is available to show")));
            })

          ],
        ),

    );
  }
}
