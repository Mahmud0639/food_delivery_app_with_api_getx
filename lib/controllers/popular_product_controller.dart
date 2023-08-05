import 'dart:convert';

import 'package:food_delivery_app/controllers/cart_controller.dart';
import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<Products> _popularProductList = [];
  List<Products> get popularProductList => _popularProductList;//it is like a getter method of android and it also a public member

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;//we need how many items in the cart added previously with the newly added quantity

  late CartController _cart;

  Future<void> getPopularProductList()async{
   Response response = await popularProductRepo.getPopularProductList();

   if(response.statusCode == 200){
     print("got products");
     _popularProductList = [];//here every time this method(getPopularProductList) can call so if i don't initialise it empty then data can come repeatedly. It is almost like "list.clear()" method of android

     _popularProductList.addAll(ProductModel.fromJson(response.body).products);//here we need a model class of the json type of data
     update();//it is almost like the setState() of flutter own..update is getx library method
     //print(popularProductList);
     _isLoaded = true;

   }else{

   }
  }

  void setQuantity(bool isIncrement){
    if(isIncrement){
      print('increment');
        _quantity = checkQuantity(_quantity+1);
    }else{
     _quantity = checkQuantity(_quantity-1);

    }
    update();
  }
  
  int checkQuantity(int quantity){
    if(_inCartItems+quantity<0){
      Get.snackbar("Item count", "You can't reduce more!");
      return 0;
    }else if(_inCartItems+quantity>20){
      Get.snackbar("Item count", "You can't add more!");
      return 20;
    }else{
      return quantity;
    }
  }

  void initProduct(Products products,CartController cart){
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(products);
    print('exist or not '+exist.toString());

    if(exist){
      _inCartItems = _cart.getQuantity(products);
    }
    print('the quantity in the cart is :'+_inCartItems.toString());
    //if exist then insert the _inCartItems
    //get from storage and set it in the _inCartItems (after hitting the add to cart button and it will saved all the items in the storage)
  }
//here we need the instance of CartController to access the addItem() of CartController class. So we get the CartController class instance from the popular_food_page
  void addItem(Products products){
   // if(_quantity>0){
      _cart.addItem(products, _quantity);
      _quantity = 0;
      _inCartItems = _cart.getQuantity(products);
      _cart.items.forEach((key, value) {
          print('The id is: '+value.id.toString()+" The quantity is :"+value.quantity.toString());
      });
   /* }else{
      Get.snackbar("Add Item", "You should add at least one item to proceed further.");
    }*/

  }
}