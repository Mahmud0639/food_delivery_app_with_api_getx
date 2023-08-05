import 'package:flutter/material.dart';

class ExpandedSmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size,height;




  ExpandedSmallText({super.key,required this.text,this.color = const Color(0xFFccc7c5),this.size = 12,this.height = 1.2,});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(color: color,fontSize: size,fontFamily: 'Roboto',height: height),
    );
  }
}
