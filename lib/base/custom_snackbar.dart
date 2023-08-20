import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String message,{bool isError = true, String title = "Error"}){
  Get.snackbar(title, message,titleText: ManyUseText(text: title,color: Colors.white,), messageText: Text(title,style: TextStyle(color: Colors.white),),colorText: Colors.white,snackPosition: SnackPosition.TOP,backgroundColor: Colors.redAccent);
}