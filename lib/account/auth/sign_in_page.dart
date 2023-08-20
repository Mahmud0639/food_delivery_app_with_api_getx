import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/account/auth/sign_up_page.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(



      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        //to remove the overflow problem while tap one of the editText we can use physics
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.screenHeight*0.07,
            ),
            Container(
              height: Dimensions.screenHeight*0.25,
              child: Center(
                child: CircleAvatar(
                  radius: Dimensions.sizedBoxHeight_30*2,
                  backgroundColor: Colors.black12,
                  backgroundImage: AssetImage(
                      "assets/images/plant.png"
                  ),
                ),
              ),
            ),

            //welcome section
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(left: Dimensions.width_20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello",style: TextStyle(fontSize: Dimensions.font_20*3+Dimensions.width_20/2,fontWeight: FontWeight.bold),),
                  Text("Sign into your account",style: TextStyle(fontSize: Dimensions.font_20,color: Colors.grey[500]),)
                ],
              ),
            ),

            SizedBox(height: Dimensions.sizedBoxHeight_20*2,),

            AppTextField(textEditingController: emailController, hintText: "Enter email", icon: Icons.email),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            AppTextField(textEditingController: passwordController, hintText: "Password", icon: Icons.password),
            SizedBox(height: Dimensions.sizedBoxHeight_20,),
            Row(
              children: [
                //SizedBox(width: Dimensions.width_30*5,),
                //best way to push the text till the end
              Expanded(child: Container()),
                RichText(text: TextSpan(
                    text: "Sign in your account",
                    style: TextStyle(color: Colors.grey[500],fontSize: Dimensions.font_20)
                )),
                SizedBox(width: Dimensions.width_20,)
              ],
            ),
            SizedBox(height: Dimensions.sizedBoxHeight_30,),
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                  color: AppUsedColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius_30)
              ),
              child: Center(child: ManyUseText(text: "Sign in",color: Colors.white,)),
            ),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            RichText(text: TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                text: "Don\'t have an account?",
                style: TextStyle(color: Colors.grey[500],fontSize: Dimensions.font_20),
              children: [
                TextSpan(
                recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(),transition: Transition.fade),
                text: "Create",
                style: TextStyle(color: AppUsedColors.mainBlackColor,fontSize: Dimensions.font_20,fontWeight: FontWeight.bold))
              ]
            ),



            ),
            SizedBox(height: Dimensions.sizedBoxHeight_20),


            SizedBox(height: Dimensions.sizedBoxHeight_20,),

            SizedBox(height: Dimensions.sizedBoxHeight_20,)
          ],
        ),
      ),
    );
  }
}
