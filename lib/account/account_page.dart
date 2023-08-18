import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/account_field.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppUsedColors.mainColor,
        title: ManyUseText(text: "Profile",size: Dimensions.font_20,color: Colors.white,),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.sizedBoxHeight_20),

        child: Column(
          children: [
            AppIcon(icon: Icons.person,backgroundColor: AppUsedColors.mainColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20*6,iconSize: Dimensions.padding_15*5,),
            SizedBox(height: Dimensions.sizedBoxHeight_30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    AccountField(appIcon: AppIcon(icon: Icons.person,backgroundColor: AppUsedColors.yellowColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "Name")),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                    AccountField(appIcon: AppIcon(icon: Icons.phone,backgroundColor: AppUsedColors.yellowColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "+8801774362950")),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                    AccountField(appIcon: AppIcon(icon: Icons.email,backgroundColor: AppUsedColors.yellowColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "bappi@gmail.com",)),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                    AccountField(appIcon: AppIcon(icon: Icons.location_on,backgroundColor: AppUsedColors.yellowColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "Fill in your address")),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                    AccountField(appIcon: AppIcon(icon: Icons.message,backgroundColor: Colors.lightGreen,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "Name")),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                    AccountField(appIcon: AppIcon(icon: Icons.person,backgroundColor: AppUsedColors.mainColor,iconColor: Colors.white,size: Dimensions.sizedBoxHeight_20+Dimensions.sizedBoxHeight_30,iconSize: Dimensions.padding_15+Dimensions.width_10,), manyUseText: ManyUseText(text: "Name")),
                    SizedBox(height: Dimensions.sizedBoxHeight_20,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
