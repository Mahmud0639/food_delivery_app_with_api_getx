import 'package:food_delivery_app/models/product_model.dart';

class CartModel {

  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExist;
  String? time;
  Products? products;



  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.quantity,
    this.isExist,
    this.time,
    this.products
  });

  CartModel.fromJson(Map<String,dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
    products = Products.fromJson(json['products']);

  }

//we need this when we try to save data in the sharedPreferences with String list
  Map<String,dynamic> toJson(){
    return{
      "id":this.id,
      "name":this.name,
      "price":this.price,
      "img":this.img,
      "quantity":this.quantity,
      "isExist":this.isExist,
      "time": this.time,
      "products":this.products!.toJson()
    };
  }




}