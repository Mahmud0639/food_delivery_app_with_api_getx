import 'dart:convert';

import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;//it is like a getter method of android and it also a public member

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

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
}