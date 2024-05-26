import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class CustomApplication extends StatelessWidget {
   CustomApplication({
    super.key,
    required this.tist,
    this.buttonColor,
   required this.buttontext,
    this.text,
    this.textColor
  });
List tist;
Color? buttonColor ;
Color? textColor;
    String buttontext;
    String? text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: (){},
          child: Container(
            width: 327,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Image.asset("assets/images/image 8.png",
                    width: 45,
                    height: 45,),
                  ),
                  SizedBox(width: 20,),
                  Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    // SizedBox(height: 20,),
                     Text("Product Manager",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,// غيرت  
                color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                        
              ),),
              SizedBox(height: 4,),
              Text("Beats",
              style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),),
                            SizedBox(height: 20,),
                                  //  CustomButton(text: buttontext, press: (){},colorText:textColor,radius: 97  ,color:buttonColor ,width: 114,height: 33,),
                                  Container(width: 114,height: 33,decoration: BoxDecoration(
                                    color: buttonColor,
                                    borderRadius: BorderRadius.circular(52)
                                  ),
                                  child: Center(child: CustomText(family: "Poppins", color: textColor!, size: 13, text: buttontext, weight: FontWeight.w500)),
                                  )
              ],),
              SizedBox(width: 55,),
               Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Text("\$84,000/y",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,// غيرت 
                color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                        
              ),),
              SizedBox(height: 4,),
              Text("Florida, US",
              style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),),
                            SizedBox(height: 31,),
                               CustomText(family: "Poppins", color:Theme.of(context).colorScheme.onTertiary , size: 12, text: "Full-Time", weight: FontWeight.w500)
                                             
              ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}