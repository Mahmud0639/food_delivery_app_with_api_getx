import 'package:food_delivery_app/data/repository/cart_repo.dart';
import 'package:food_delivery_app/models/product_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  Map<int,CartModel> _items = {};//we want to save our items as model with the int id
  Map<int,CartModel> get items => _items;

  List<CartModel> storageItems = [];

  //whenever add to cart button will be clicked then addItem() will be called but not directly it will be called from PopularProductController
  //that means PopularProductController will call this CartController's addItem()
  void addItem(Products products, int quantity){

    var totalQuantity = 0;
    
    //print('length of the items is: '+_items.length.toString());
    if(_items.containsKey(products.id)){
          _items.update(products.id!, (value) {

            totalQuantity = value.quantity! + quantity;

            return CartModel(
                id: value.id,
                name: value.name,
                price: value.price,
                img: value.img,
                quantity: value.quantity!+quantity,//value.quantity is the quantity that was already saved and new quantity will be added here
                isExist: true,
                time: DateTime.now().toString(),
                products: products
            );
          });

          if(totalQuantity<=0){//after adding more items and do the add to cart and when we reducing items till the 0 then if we do add to cart then it will not save the 0
            _items.remove(products.id);
          }

    }else{
      if(quantity>0){
        _items.putIfAbsent(products.id!, () {

          // print('adding item to the cart '+products.id.toString()+"Product quantity: "+quantity.toString());

          /* _items.forEach((key, value) {
           print('quantity is :'+value.quantity.toString());
         });*/

          return CartModel(
              id: products.id,
              name: products.name,
              price: products.price,
              img: products.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              products: products
          );
        });
      }else{
        Get.snackbar("Add Item", "You should add at least one item to proceed further.");
      }

    }

    //after adding every object of products we need to save them in the sharedPreferences
    cartRepo.addToCartList(getItems);

    update();

  }

 bool existInCart(Products products){
    if(_items.containsKey(products.id)){
      return true;
    }else{
      return false;
    }
  }

 int getQuantity(Products products){

    var quantity = 0;

    if(_items.containsKey(products.id)){
      _items.forEach((key, value) {
        if(key==products.id){
          quantity = value.quantity!;
        }
      });
    }
    return quantity;


  }

  //for showing total quantity in the cart as notification number
int get totalItems{
    var totalQuantity = 0;

    _items.forEach((key, value) {
      totalQuantity += value.quantity!;//it will triggered the whole loop for every items of object of map and add all one after another and assign in the totalQuantity variable
    });

    return totalQuantity;
}

//we retrieve all the items make a list of them to show as recycler view that means in flutter as ListView.Builder
List<CartModel> get getItems{
    return _items.entries.map((e){
      return e.value;

    }).toList();
}


int get totalPrice{
    var total = 0;

    _items.forEach((key, value) {
      total += value.price! * value.quantity!;
    });

    return total;
}

//for storage
List<CartModel> getCartData(){//this will called when app will open from the scratch that means app will not be in the ram but previously added product user
    setCart = cartRepo.getCartList();
    return storageItems;
}

set setCart(List<CartModel> items){
    storageItems = items;//storing data to storage

    //putting data if not absent and it will put data while for first time user open the app because for the opening time there will not be any data available in the map list
    for(int i=0; i<storageItems.length; i++){
      _items.putIfAbsent(storageItems[i].products!.id!, () => storageItems[i]);
    }

}




}