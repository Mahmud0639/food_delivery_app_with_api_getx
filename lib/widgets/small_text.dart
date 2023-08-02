import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  Color? color;
  double size,height;
  TextOverflow textOverFlow;

  
  
  SmallText({super.key,required this.text,this.color = const Color(0xFFccc7c5),this.size = 12,this.height = 1.2,this.textOverFlow=TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(text,
      overflow: textOverFlow,
      maxLines: 2,
      style: TextStyle(color: color,fontSize: size,fontFamily: 'Roboto',height: height),
    );
  }
}
