import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/dimensions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon; // here we will send icon we can't use here Icon instead of IconData
  final Color backgroundColor;
  final Color iconColor;
  final double size;//this size for the container that will show as circular format
  final double iconSize;

  //here without icon member another member has it's default value so while it would call then without icon another member will not ask for any value because they has their own default value declared here
  AppIcon({super.key,required this.icon,this.backgroundColor=const Color(0xFFfcf4e4),this.iconColor=const Color(0xFF756d54),this.size=40,this.iconSize=16});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size/2)//it will make the container fully circular type
      ),
      child: Icon(icon,color: iconColor,size: iconSize,),
    );
  }
}
