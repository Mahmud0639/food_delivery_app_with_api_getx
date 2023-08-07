import 'dart:convert';

import 'package:food_delivery_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/cart_model.dart';

class CartRepo{
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList){

      cart = [];
      cartList.forEach((element) {
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

       print("inside length is : "+carts.length.toString());
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
}