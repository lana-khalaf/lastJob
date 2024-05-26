import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatelessWidget {
   Profile({super.key});
  List <String> test =[
      "UI","UX", "PLA", "PLA", "PLA","PLA"
      ];
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
        child: Padding(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Column(
            children: [
              Row(
              
                children: [
                  Padding(     padding: const EdgeInsets.only( top: 19),
                  child: Image.asset("assets/images/back.png")),
                    Padding(
                         padding: const EdgeInsets.only(left: 300, top: 19),
                      child: Text(" Edit",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.primaryContainer,
                              fontFamily: "Cairo",
                              
                                ),),
                    ),
        
                ],
              ),
               CircleAvatar(radius: 52,child: 
                        Image.asset("assets/images/photo_٢٠٢٢-٠٥-٢٠_١١-٢٤-٠٩ 1.png")
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 12, bottom: 4
                          ),
                          child: Center(
                            child: Text(
                              config.get<SharedPreferences>().getString("userName")!,
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.onTertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                    fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "UX Designer ",
                                style: TextStyle(
                                  color:  Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                      fontFamily: "Poppins",
                                ),
                              ),
                              Image.asset("assets/images/Vector (10).png"),
                            ],
                            
                          ),
                        ),
                                                         Padding(
                            padding: const EdgeInsets.only(
                              top: 40
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "27", weight: FontWeight.w700),
                            CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "19", weight: FontWeight.w700),
                            CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "14", weight: FontWeight.w700)
                            
                              ],
                            ),
                          ),
                            Padding(
                            padding: const EdgeInsets.only(
                              top: 6 , left: 8
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "Applied", weight: FontWeight.w700),
                            CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "Reviewed", weight: FontWeight.w700),
                            CustomText(family: "Poppins", color: Theme.of(context).colorScheme.onTertiary , size: 16, text: "Interview", weight: FontWeight.w700)
                            
                              ],
                            ),
                          ),
                        Expanded(
                          child: ListView(
                            children: [

                            Padding(
                                       padding: const EdgeInsets.only(bottom: 16, top: 30),
                                       child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                         
                                CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Experience", weight: FontWeight.w600),
                                     InkWell(onTap: (){},child: CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.primaryContainer, size: 13, text: "See all", weight: FontWeight.w400))
                                         ],
                                       ),
                                     ),
                                               job_container(tist: test),
                               Padding(
                                       padding: const EdgeInsets.only(bottom: 16, top: 30),
                                       child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                         
                                CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Education", weight: FontWeight.w600),
                                     InkWell(onTap: (){},child: CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.primaryContainer, size: 13, text: "See all", weight: FontWeight.w400))
                                         ],
                                       ),
                                     ),
                                               job_container(tist: test),
                                 Padding(
                                       padding: const EdgeInsets.only(bottom: 16, top: 30),
                                       child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                         
                                CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Resume", weight: FontWeight.w600),
                                     InkWell(onTap: (){},child: CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.primaryContainer, size: 13, text: "Make a resume", weight: FontWeight.w400))
                                         ],
                                       ),
                                     ),
                                               job_container(tist: test),
                                               Padding(
                                       padding: const EdgeInsets.only(bottom: 16, top: 30),
                                       child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                         
                                CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Portfolio", weight: FontWeight.w600),
                                     InkWell(onTap: (){},child: CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.primaryContainer, size: 13, text: "See all", weight: FontWeight.w400))
                                         ],
                                       ),
                                     ),
                        
                                               SizedBox(
                          height: 300,
                           child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 12,
                                crossAxisSpacing: 12,
                              ),
                              itemCount: 6,
                              itemBuilder: (BuildContext context, int index) {
                                return Image.asset("assets/images/protofolio (1).png");
                                    
                              },
                            ),
                                               )
                                    
                            ],
                          ),
                        )
                     
                       
            ],
          ),
        ),
      ),
    );
  }
}