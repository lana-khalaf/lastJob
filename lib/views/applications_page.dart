import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_applicatons.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class ApplicationsPage extends StatelessWidget {
   ApplicationsPage({super.key});
 List <String> test =[
      "UI","UX", "PLA", "PLA", "PLA","PLA"
      ];
    late  Color buttonColor;
late Color textColor;
String buttonText="Cancelled";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
                Padding(
                      padding: const EdgeInsets.only(left: 24,right: 26),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(     padding: const EdgeInsets.only( top: 19),
                      child: Image.asset("assets/images/back.png")),
                        Padding(
                             padding: const EdgeInsets.only( top: 19),
                          child: Text("Applications",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Theme.of(context).colorScheme.onTertiary ,
                                  fontFamily: "Poppins",
                                  
                                    ),),
                        ),
                        Stack(
                          children:[
                            Padding(
                            padding: const EdgeInsets.only( top: 19),
                            child: Image.asset("assets/images/Group 90.png"),
                          ),
                          Positioned(
                      right: 0,
                      top: 16,
                      child: 
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffEBEFFC),
                
                        ),
                        child: Image.asset("assets/images/Ellipse 767.png"),
                        ),
                          ),
                          ]
                          
                        ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.only(left: 24,right: 26),
                  child: CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 24, text: "You have\n27 Applications", weight: FontWeight.w600),
                ),
             Padding(
               padding: const EdgeInsets.only(top: 40,bottom: 40,left: 24),
              
               child: SizedBox(
                height: 37,
                 child: ListView(scrollDirection: Axis.horizontal,children: [
                               
                  CustomButton(text: "All", press: (){},colorText:Theme.of(context).colorScheme.onPrimaryContainer,radius: 97  ,color:Theme.of(context).colorScheme.primaryContainer ,width: 57,height: 37,),
                SizedBox(width: 11,),
                 CustomButton(text: "Cancelled", press: (){},colorText:Color(0xff95969D),radius: 97  ,color: Color(0xffDCE2FB) ,width: 115,height: 37,colorBorder: Color(0xff95969D),),
                    SizedBox(width: 11,),
                   CustomButton(text: "Reviewing", press: (){},colorText:Color(0xff95969D),radius: 97  ,color: Color(0xffDCE2FB) ,width: 120,height: 37,colorBorder: Color(0xff95969D),),
                     SizedBox(width: 11,),
                     CustomButton(text: "Submitted", press: (){},colorText:Color(0xff95969D),radius: 97  ,color: Color(0xffDCE2FB) ,width: 120,height: 37,colorBorder: Color(0xff95969D),),
                       
                 
                 ],),
               ),
             ),
    
             Expanded(
                 child:   Padding(
                 padding: const EdgeInsets.only(left: 26, right: 26),
                   child: ListView.builder(
                   
                   
                   
                          itemCount: test.length,
                   
                   
                   
                          itemBuilder: (context, index) => 
                   
                   Builder(builder: (context){
                              if (buttonText == "Cancelled") {
                                buttonColor = Color(0xffFFEDED);
                                textColor = const Color(0xffDC312D);
                              
                              } else if (buttonText == "Submitted") {
                                buttonColor = const Color(0xffEDF3FC);
                                textColor =  const Color(0xff5386E4);
                              } else {
                                 buttonColor = Color(0xffE8FDF2);
                                textColor = const Color(0xff0E9D57);}
                                 return CustomApplication(tist: test, buttontext: buttonText,
                                   textColor: textColor,
                              
                                   buttonColor:buttonColor,);
                                   })
                         
                   
                   
                   
                        ),
                 ),
               ),
             ],
          ),
      ),
    );
  }
}