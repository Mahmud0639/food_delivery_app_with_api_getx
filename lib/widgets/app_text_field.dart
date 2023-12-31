import 'package:flutter/material.dart';

import '../utils/app_used_colors.dart';
import '../utils/dimensions.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;

  const AppTextField({super.key,required this.textEditingController,required this.hintText, required this.icon});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(left: Dimensions.width_20,right: Dimensions.width_20),
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(Dimensions.radius_30),//to make the editText circlular shape
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 7,
                offset: Offset(1,10),
                color: Colors.grey
            )
          ]
      ),
      child: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: Icon(icon,color: AppUsedColors.mainColor,),
          //focused Border is only work when clicking on it
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.width_20),
              borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white
              )
          ),
          //enabled Border is working without clicking(border will remain without clicking)
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.width_20),
              borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.white
              )
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimensions.width_20),

          ),
        ),

      ),
    );
  }
}
