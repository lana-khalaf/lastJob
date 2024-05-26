import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class ProtofolioPage extends StatelessWidget {
  const ProtofolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light ? AssetImage('assets/images/light.bg.png') : AssetImage('assets/images/dark_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:
        Padding(
          padding: const EdgeInsets.only(left: 26, right: 26),
          child: Column(
            children: [
               Row(
                
                  children: [
                    Padding(     padding: const EdgeInsets.only( top: 19),
                    child: Image.asset("assets/images/back.png")),
                      Padding(
                           padding: const EdgeInsets.only(left: 300, top: 19),
                        child: Text("Skip",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Theme.of(context).colorScheme.primaryContainer,
                                fontFamily: "Poppins",
                                
                                  ),),
                      ),
          
                  ],
                ),
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Row(
                  children: [
                  CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.onTertiary, size: 16, text: "Portfolio", weight: FontWeight.w600),
                         CustomText(family:  "Poppins", color: Theme.of(context).colorScheme.secondaryContainer, size: 16, text: " (Optional)", weight: FontWeight.w400),
                  ],
                ),
              ),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

           Padding(

                padding: const EdgeInsets.only(
                  top: 20
                ),
                child: Container(
                  
                 width: 156,
                 height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                     color:Theme.of(context).colorScheme.onPrimaryContainer ,
                  ),
                  
                  child: Center(
                    child: Text(
                            "Portfolio Link",
                            style: TextStyle(
                              color:  Theme.of(context).colorScheme.primaryContainer ,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                            ),
                          ),
                  ),
                ),
              ),
    Padding(

                padding: const EdgeInsets.only(
                  top: 20
                ),
                child: Container(
                  
                 width: 156,
                 height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                     color:Theme.of(context).colorScheme.onPrimaryContainer ,
                  ),
                  
                  child: Center(
                    child: Text(
                            "Add Slide",
                            style: TextStyle(
                              color:  Theme.of(context).colorScheme.primaryContainer ,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                            ),
                          ),
                  ),
                ),
              ),
          
        ],
       ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

           Padding(

                padding: const EdgeInsets.only(
                  top: 16
                ),
                child: Container(
                  
                 width: 156,
                 height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                     color:Theme.of(context).colorScheme.onPrimaryContainer ,
                  ),
                  
                  child: Center(
                    child: Text(
                            "Portfolio Link",
                            style: TextStyle(
                              color:  Theme.of(context).colorScheme.primaryContainer ,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                                  fontFamily: "Poppins",
                            ),
                          ),
                  ),
                ),
              ),
    Padding(

                padding: const EdgeInsets.only(
                  top: 16
                ),
                child: Center(
                  child: Container(
                    
                   width: 156,
                   height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                       color:Theme.of(context).colorScheme.onPrimaryContainer ,
                    ),
                    
                    child: Center(
                      child: Text(
                              "Add Slide",
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.primaryContainer ,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                    ),
                  ),
                ),
              ),
          
        ],
       ),
       Padding(
         padding: const EdgeInsets.only(top: 40),
         child: CustomButton(text: "Save", press: (){}, color:Theme.of(context).colorScheme.primaryContainer,colorText: Theme.of(context).colorScheme.onPrimaryContainer,width: 337,height: 56,),
       )
            ],
          ),
        ) ,
      ),
      
    );
  }
}