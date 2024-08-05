import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/views/login_page.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class SecondWelcomePage extends StatelessWidget {
  const SecondWelcomePage({super.key});
static String id = 'SecondWelcomePage';
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:Theme.of(context).brightness == Brightness.light
                  ? AssetImage('assets/images/Mask Group (3).png')
                  : AssetImage('assets/images/Home (3).jpg'),
            fit: BoxFit.cover,
          ),
        ),
       child:Column(
        children: [
          Container(
      height: 386,
      width: double.infinity,
    
      decoration: BoxDecoration(
         borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                  ),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/second_image.jpeg'),
        fit: BoxFit.cover
        ),
       
      ),
    ),
Padding(
  padding: const EdgeInsets.only(top: 40, bottom: 10),
  child:   Text("Use".tr(),
  textAlign: TextAlign.center,
  
  style: TextStyle(
  
    fontWeight: FontWeight.w700,
  
    fontSize: 24,
  
    fontFamily: "Cairo",

    color: Theme.of(context).colorScheme.primary
  
    
  
  ),),
),
// Text("Start".tr(),
// textAlign: TextAlign.center,
// style: TextStyle(
//   color: Theme.of(context).colorScheme.primary,
//      fontWeight: FontWeight.w400,
  
//     fontSize: 14,// كان 16
//     // height: 11,
  
//     fontFamily: "Cairo",

// ),),
Padding(
  padding: const EdgeInsets.only(top: 28, bottom: 79),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
       
    
  
      SizedBox(
  
      
  
        width: 8,
  
      
  
        height: 8,
  
      
  
      
  
      
  
        child:   LinearProgressIndicator(
  
      
  
        value: 1,
  
      
  
          color: Color(0xff969AA0),
  
      
  
        borderRadius: BorderRadius.circular(20),
  
      
  
       
  
      
  
        ),
  
      
  
      ),

  SizedBox(width: 8,),
          SizedBox(
  
      
  
        width: 35,
  
      
  
        height: 8,
  
      
  
      
  
      
  
        child:   LinearProgressIndicator(
  
      
  
        value: 1,
  
      
  
          color: Theme.of(context).colorScheme.primary,
  
      
  
        borderRadius: BorderRadius.circular(8),
  
      
  
       
  
      
  
        ),
  
      
  
      ),
  
  
    ],
  
  ),
),


Padding(
  padding: const EdgeInsets.only(top: 46,bottom: 15, left: 16, right: 16 ),
   child:   CustomButton(text: "Start".tr(), colorText: Theme.of(context).colorScheme.onSecondary, press: (){
  
      Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
  
  }, color: Theme.of(context).colorScheme.primary,),
  
),

        ],
      ),
      ),
    );
  }
}