import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';

class Customcommunity extends StatelessWidget {
   Customcommunity({
    super.key,
  required this.imageCommunity,
  required this.nameCommunity
  });
final String imageCommunity;
final String nameCommunity;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 327,
          height: 76,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        
          child: Row(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        SizedBox(width: 20,),
              Image.asset(imageCommunity,
              width: 52,
              height: 52,),
              SizedBox(width: 20,),
              Text(nameCommunity,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,// غيرت  
            color: Theme.of(context).colorScheme.onTertiary,
                    fontFamily: "Poppins",
                    
          ),),
          SizedBox(width: 75,),
          InkWell(
            child: 
            // Container(
            //   height: 37,
            //   width: 79,
            //   decoration: BoxDecoration(
            //          borderRadius: BorderRadius.circular(7),
            //     color: Color(0x154AD2E4),
            //   ),
            //   child: Center(child: CustomText(family: "Tajawal", color: Color(0xff5669FF), size: 12, text: "Follow", weight: FontWeight.w400),),
            // ),
            Material(
      elevation: 4.0, // تحديد ارتفاع الـ elevation
      borderRadius: BorderRadius.circular(7),
      shadowColor: Colors.black.withOpacity(0.25), // لون الظل
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
    )
          )
            ],
          ),
        ),
      ),
    );
  }
}