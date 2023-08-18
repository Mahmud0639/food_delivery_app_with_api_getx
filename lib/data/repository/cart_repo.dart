import 'dart:convert';

import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList){
   /* sharedPreferences.remove(AppConstants.CART_LIST);
    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);*/

    //print('shared called.');

    var time = DateTime.now().toString();
      cart = [];
      cartList.forEach((element) {
        //here we should add same time for the each product because we want to show them in the same place as history that products are sold by user at once
        element.time = time;
        return cart.add(jsonEncode(element));//converting object to String with the help of jsonEncode() and for this we also need to add in the cartModel toJson function because it is encodable
      });

      sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
      print(sharedPreferences.getStringList(AppConstants.CART_LIST));

      getCartList();
  }

  List<CartModel> getCartList(){
    List<CartModel> cartLists=[];
    List<String> carts = [];

      if(sharedPreferences.containsKey(AppConstants.CART_LIST)){
       carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;

       print("inside length is : ${carts.length}");

      }

      carts.forEach((element) {
        return cartLists.add(CartModel.fromJson(jsonDecode(element)));//here we can see in the cart model there is a map so to convert String list into object we need to pass like this and also need the help of jsonDecode()
        //to convert String to object we need always jsonDecode()
        //to convert object to String we need always jsonEncode()
      });
      //we can do like this also
     // carts.forEach((element) =>CartModel.fromJson(jsonDecode(element)));

    return cartLists;
  }

  //here we need to put all the String list data to the sharedPreferences after clicking on the checkout button
  void addToCartHistoryList(){
    //here we are inserting all the cart data into the cartHistory list using for loop one by one
    //here we need another thing to keep in mind that if there is old data available of AppConstants.CART_HISTORY_LIST then we also want to keep these data
    //and then we also add new one
    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
      for(int i=0; i<cart.length; i++){
        print('history list: '+cart[i]);
        cartHistory.add(cart[i]);
      }
      removeOldCartData();
      sharedPreferences.setStringList(AppConstants.CART_HISTORY_LIST, cartHistory);
      print('The history lsit length is :'+getHistoryList().length.toString());

      //we can only see the time field only using for loop
    for(int i=0; i<getHistoryList().length; i++){
      print("The time is :"+getHistoryList()[i].time.toString());
    }

  }

  void removeOldCartData(){
    cart = [];
    //we want to remove all data before added for before adding data again
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  //now we want to get again last added data to show our user showing cart that is after tapping the checkout button
  List<CartModel> getHistoryList(){

    if(sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)){
      cartHistory = [];

      cartHistory = sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartHistoryList = [];

    //here we need to return model type of data converting String list to Model type so we used the CartModel.fromJson()
    //here we see that cartModel.fromJson() accepts Map type data so we have String data to convert them in the Object type
    //we need the help of jsonDecode() method
    cartHistory.forEach((element) => cartHistoryList.add(CartModel.fromJson(jsonDecode(element))));



    return cartHistoryList;


  }


}