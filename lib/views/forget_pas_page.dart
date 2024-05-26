import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:flutter_jobs_app/widgets/custom_textField.dart';

class ForgetPassPage extends StatelessWidget {
   ForgetPassPage({super.key});
final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
      child:Column(
        children: [
          Row(
            children: [Padding(
              padding: const EdgeInsets.only(left: 15, top: 19),
              child: Icon(Icons.arrow_back_ios_outlined,
              color:  Theme.of(context).colorScheme.primary,
              
              ),
            )],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Center(
              child: Text("نسيت كلمة المرور",
                          style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 32,// غيرت 
                  color: Theme.of(context).colorScheme.secondary,
              fontFamily: "Cairo",
              
                ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 32, left: 40),
            child:  CustomText(family: "Cairo", color: Theme.of(context).colorScheme.onPrimary, size: 16, text: "قم بادخال رقم الهاتف الذي قمت بالتسجيل به حتى\n      نتمكن من استعادة كلمة المرور الخاصه بك", weight: FontWeight.w400),
          ),
         
          
                        Padding(
                          padding: const EdgeInsets.only(top: 60, right: 10, left: 10),
                          child: CustomTextFeild(
                          controller: phoneController,
                          type:TextInputType.phone,
                          validate:(String? value){
                          if (value == null || value.isEmpty){
                            return "phoneline";
                          }
                          },
                          label: "  الرقم" ,
                          prefix:Icons.phone_outlined, isPassword: false, 
                          onSubmit: (value) { 
                                              
                           },
                          
                          ),
                        ),
                         SizedBox(
                          height: 24,
                        ),
                            Padding(
  padding: const EdgeInsets.only(top: 12, bottom: 4, left: 19, right: 19),
  child:   CustomButton(text: "استعادة كلمة المرور", colorText:  Theme.of(context).colorScheme.onSecondary, press: (){
  
    
  
  }, color: Theme.of(context).colorScheme.primary,),
),
          
        ],
      ),
      ),
    );
  }
}