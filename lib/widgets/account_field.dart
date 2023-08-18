import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';

import '../utils/dimensions.dart';

class AccountField extends StatelessWidget {

  final AppIcon appIcon;
  final ManyUseText manyUseText;

  AccountField({super.key,required this.appIcon,required this.manyUseText});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.only(top: Dimensions.width_10,left: Dimensions.width_10,right: Dimensions.width_10,bottom: Dimensions.width_10),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width_20,),
          manyUseText
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
        boxShadow: [
          BoxShadow(offset: Offset(0, 2),color: Colors.grey.withOpacity(0.2),blurRadius: 1)
        ]
      ),
    );
  }
}
