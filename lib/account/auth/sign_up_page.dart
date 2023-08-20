import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/base/custom_snackbar.dart';
import 'package:food_delivery_app/controllers/auth_controller.dart';
import 'package:food_delivery_app/models/signup_body_model.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/widgets/app_text_field.dart';
import 'package:food_delivery_app/widgets/many_use_text.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  var sigupImages = [
    "facebook.png",
    "google.png",
    "twitter.png"
  ];


  void _registration(){

    var authController = Get.find<AuthController>();

    String name = nameController.text.trim();
    String phone = phoneController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if(!GetUtils.isEmail(email)){
        showCustomSnackbar("Type in your valid email",title: "Email");
    }else if(password.isEmpty){
        showCustomSnackbar("Type in your password",title: "Password");
    }else if(password.length<6){
      showCustomSnackbar("Type in at least 6 char password",title: "Invalid password");
    }

    else if(name.isEmpty){
        showCustomSnackbar("Type in your name",title: "Name");
    }else if(phone.isEmpty){
        showCustomSnackbar("Type in your Phone",title: "Phone");
    }else{
        showCustomSnackbar("You are perfect.",title: "Perfection");
        SignUpBody signUpBody = SignUpBody(name: name, phone: phone, email: email, password: password);

        authController.registration(signUpBody).then((value){
          if(value.isSuccess){
            print('Successfully registered');
          }else{
            showCustomSnackbar(value.message);
          }
        });
    }
  }

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
            AppTextField(textEditingController: emailController, hintText: "Enter email", icon: Icons.email),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            AppTextField(textEditingController: passwordController, hintText: "Password", icon: Icons.password),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            AppTextField(textEditingController: nameController, hintText: "Enter name", icon: Icons.edit),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            AppTextField(textEditingController: phoneController, hintText: "Phone number", icon: Icons.phone),
            SizedBox(height: Dimensions.sizedBoxHeight_20,),
            GestureDetector(
              onTap: (){
                _registration();
              },
              child: Container(
                width: Dimensions.screenWidth/2,
                height: Dimensions.screenHeight/13,
                decoration: BoxDecoration(
                  color: AppUsedColors.mainColor,
                  borderRadius: BorderRadius.circular(Dimensions.radius_30)
                ),
                child: Center(child: ManyUseText(text: "Sign up",color: Colors.white,)),
              ),
            ),
            SizedBox(height: Dimensions.sizedBoxHeight_10,),
            RichText(text: TextSpan(
              recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
              text: "Already have an account?",
              style: TextStyle(color: Colors.grey[500],fontSize: Dimensions.font_20)
            )),
            SizedBox(height: Dimensions.sizedBoxHeight_20),
            RichText(text: TextSpan(
              text: "Sign up using one of the following methods",
              style: TextStyle(fontSize: Dimensions.font_16,color: Colors.grey[500])
            )),

            SizedBox(height: Dimensions.sizedBoxHeight_20,),

            Wrap(
              children: List.generate(3, (index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.radius_30,
                  backgroundImage: AssetImage("assets/images/"+sigupImages[index]),
                ),
              )),
            ),
            SizedBox(height: Dimensions.sizedBoxHeight_20,)
          ],
        ),
      ),
    );
  }
}
