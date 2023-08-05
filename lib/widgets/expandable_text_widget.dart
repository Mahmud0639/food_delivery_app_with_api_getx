import 'package:flutter/material.dart';
import 'package:food_delivery_app/utils/app_used_colors.dart';
import 'package:food_delivery_app/utils/dimensions.dart';
import 'package:food_delivery_app/widgets/expanded_small_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {

  final String text;

  const ExpandableTextWidget({super.key,required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {

  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;//first time we try with long text
  double textHeight = Dimensions.screenHeight/8;//here textHeight is the space that our text might occupy. We only want to give this space for taking space for the text
  //but if the total text takes more this space then we will apply the Show more approach


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length > textHeight){
      firstHalf = widget.text.substring(0,textHeight.toInt());//first half will take place 0 to the space of textHeight
      secondHalf = widget.text.substring(textHeight.toInt()+1,widget.text.length);//second half will take place from the first half ending point to the total text length. It can be 200 or more etc. must be larger than the total height of the textHeight variable
    }else{
      firstHalf = widget.text;//firstHalf variable will get small text because we get small text from the database
      secondHalf = "";//at this time secondHalf will not get any text because we have small text that can show properly we don't need to go secondHalf place
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?ExpandedSmallText(size: Dimensions.font_16,height:1.5,color: AppUsedColors.paraColor,text: firstHalf):Column(
        children: [
          ExpandedSmallText(size: Dimensions.font_16,color:AppUsedColors.paraColor,height: 1.5,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),//if false it will show the full line of text
          InkWell(
            onTap: (){
              setState(() {
                hiddenText = !hiddenText;//it will toggling the button..if it is false then run above code(firstHalf+secondHalf)
              });

            },
            child: Row(
              children: [
                ExpandedSmallText(text:hiddenText?"Show more":"Show less",color: AppUsedColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color: AppUsedColors.mainColor,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
