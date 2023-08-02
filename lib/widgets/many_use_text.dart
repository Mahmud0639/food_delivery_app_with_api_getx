import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class ManyUseText extends StatelessWidget {

  final String text;
  Color? color;
  double size;
  TextOverflow overflow;

   ManyUseText({super.key,required this.text,this.color = const Color(0xFF332d2b),this.size=0,this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,overflow: overflow,
      maxLines: 1,
      style: TextStyle(color: color,fontSize: size==0?Dimensions.font_20:size,fontFamily: 'Roboto',fontWeight: FontWeight.w400),
    );
  }
}
