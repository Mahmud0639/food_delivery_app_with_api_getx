import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

import '../utils/app_used_colors.dart';
import '../utils/dimensions.dart';
import 'icon_and_text_widget.dart';
import 'many_use_text.dart';

class AppColumn extends StatelessWidget {

  final String name;

   AppColumn({super.key,required this.name});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ManyUseText(text: name),
        SizedBox(height: Dimensions.sizedBoxHeight_10,),
        Row(
          children: [
            //as we need same thing again again so we can use to achieve this with the help of Wrap widget
            Wrap(
              children: List.generate(5, (index) => Icon(Icons.star,color: AppUsedColors.mainColor,size: 15,)),

            ),
            SizedBox(width: 10,),
            SmallText(text: "4.5"),
            SizedBox(width: 10,),
            SmallText(text: "1287"),
            SizedBox(width: 10,),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(height: Dimensions.sizedBoxHeight_20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(icon: Icons.circle_sharp, text: "Normal", iconColor: AppUsedColors.iconColor1),
            IconAndTextWidget(icon: Icons.location_on, text: "1.7km", iconColor: AppUsedColors.mainColor),
            IconAndTextWidget(icon: Icons.access_time_rounded, text: "32min", iconColor: AppUsedColors.iconColor2)

          ],
        )
      ],
    );
  }
}
