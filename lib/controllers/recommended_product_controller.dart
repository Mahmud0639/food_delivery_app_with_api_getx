import 'dart:convert';

import 'package:food_delivery_app/data/repository/popular_product_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

import '../data/repository/recommended_product_repo.dart';

class RecommendedProductController extends GetxController{
  final RecommendedProductRepo recommendedProductRepo;

  RecommendedProductController({required this.recommendedProductRepo});

  List<Products> _recommendedProductList = [];
  List<Products> get recommendedProductList => _recommendedProductList;//it is like a getter method of android and it also a public member

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList()async{
    Response response = await recommendedProductRepo.getRecommendedProductList();

    if(response.statusCode == 200){
      print("got products");
      _recommendedProductList = [];//here every time this method(getPopularProductList) can call so if i don't initialise it empty then data can come repeatedly. It is almost like "list.clear()" method of android

      _recommendedProductList.addAll(ProductModel.fromJson(response.body).products);//here we need a model class of the json type of data
      update();//it is almost like the setState() of flutter own..update is getx library method
      //print(popularProductList);
      _isLoaded = true;

    }else{
        print('Could not get product of recommended');
    }
  }
}