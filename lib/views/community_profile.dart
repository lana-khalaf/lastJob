import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_searchFeild.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';

class CompanyProfile extends StatelessWidget {
   CompanyProfile({super.key});
   static String id = 'CompanyProfile';
List <Skill> test =[
   Skill(id: 12, userId: 231, title: "klj", startedAt: "kjk")
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/Mask Group (1).png') : AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.cover,
          ),      
        ),
        child:  
            Padding(
             padding:  const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
 Row(
             
                children: [
                  Padding(     padding: const EdgeInsets.only( top: 19),
                  child: Image.asset("assets/images/back.png")),
                    Padding(
                         padding: const EdgeInsets.only( top: 19,left: 140),
                      child: Text("Google Jobs",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.onSecondaryContainer ,
                              fontFamily: "Poppins",
                              
                                ),),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 33),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onPrimary , size: 13, text: "  Jops", weight: FontWeight.w500),
                    SizedBox(width: 50,),
                    SizedBox(height: 40,width: 40,child: Image.asset("assets/images/Google.png")),
                       SizedBox(width: 50,),
                      CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onPrimary , size: 13, text: "Follow", weight: FontWeight.w500),
                  ],
                ),
              ),
                Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onSecondaryContainer , size: 15, text: "140", weight: FontWeight.w600),
                    SizedBox(width: 50,),
                  CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onSecondaryContainer , size: 15, text: "Google", weight: FontWeight.w600) ,
                       SizedBox(width: 50,),
                      CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onSecondaryContainer , size: 15, text: "176", weight: FontWeight.w600),
                  
                  ],
                ),

              ),
                       Padding(
                         padding: const EdgeInsets.only(top: 10,bottom: 10),
                         child: InkWell(
                           onTap: (){},
                           child: Container(
                             height: 37,
                             width: 79,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(7),
                               color: Color(0x154AD2E4), // اللون مع الشفافية
                             ),
                             child: Center(
                               child: CustomText(
                                 family: "Tajawal",
                                 color: Color(0xff5669FF),
                                 size: 12,
                                 text: "Follow",
                                 weight: FontWeight.w400,
                               ),
                             ),
                           ),
                         ),
                       ),
    Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Color(0x154AD2E4), // اللون مع الشفافية
            ),
            child: Center(
              child: Image.asset("assets/images/Location.png"),
            ),
          ),
          SizedBox(width: 10,),
            Column(
            children: [
              CustomText(family: "Poppins", color:  Theme.of(context).colorScheme.onSecondaryContainer , size: 16, text: "Gala Convention Center", weight: FontWeight.w400),
                     CustomText(family: "Poppins", color:  Color(0xff747688) , size: 12, text: "36 Guild Street London, UK ", weight: FontWeight.w400)
            ],
            )
        ],
      ),
    ),
   
  
    
          
               
            
Padding(
  padding: const EdgeInsets.only(top: 20,right: 5,left: 5),
  child:   Row(
  
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
  
                       children: [
  
                         CustomSearchTextField(color:Color(0x9B3B4758),  hintText: "Search for Community "),
  
                         Container(
  
                                  height: 48,
  
                                  width: 56,
  
                                 
  
                                  decoration: BoxDecoration(
  
                                      color:  Theme.of(context).colorScheme.onPrimaryContainer,
  
                                       
  
                           boxShadow: [
  
                             BoxShadow(
  
                               color: Colors.black .withOpacity(0.25), // 25% opacity
  
                               offset: Offset(0, 5), // X: 0, Y: 4
  
                               blurRadius: 4, // Blur: 4
  
                               spreadRadius: 0, // Spread: 0
  
                             ),
  
                           ],
  
                         
  
                                      borderRadius: BorderRadius.circular(14)),
  
                                  child: Image.asset(
  
                                    'assets/images/Slider.png',
  
                                  ),
  
                                ),
  
                              
  
                   
  
                       ],
  
                     ),
),
SizedBox(
  height: 20,
),
            Expanded(
              child: ListView.builder(itemBuilder:  
              (context, index) => Padding(
                padding: const EdgeInsets.only(right: 14,left:14),
                child: job_container(tist: test, index: index,),
              ),
              itemCount: test.length,
              ),
            ),
          ],
        ),
    ),
    ),
    );
  }
}