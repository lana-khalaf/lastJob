import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/Job.dart';
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
Job tist;
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
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child:  tist.job.owner.picture != null
                        ? Image.network(
                            tist.job.owner.picture!,
                            width: 45,
                            height: 45,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.error, size: 45);
                            },
                          )
                        : Icon(Icons.account_circle, size: 45,color: Theme.of(context).colorScheme.onErrorContainer,),
                  
                  ),
                  SizedBox(width: 20,),
                  Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                    // SizedBox(height: 20,),
                     Text(tist.job.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,// غيرت  
                color: Theme.of(context).colorScheme.onErrorContainer,
                        fontFamily: "Cairo",
                        
              ),),
              SizedBox(height: 4,),
              Text(tist.job.owner.name,
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
               Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Row(
                 children: [
                   Text(tist.job.minmumSalary.toString(),
                                 style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,// غيرت 
                    color: Theme.of(context).colorScheme.onErrorContainer,
                            fontFamily: "Cairo",
                            
                                 ),),
                                  Text("/${tist.job.maximumSalary.toString()}",
                                 style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,// غيرت 
                    color: Theme.of(context).colorScheme.primary,
                            fontFamily: "Cairo",
                            
                                 ),),
                 ],
               ),
              SizedBox(height: 4,),
              Text(tist.job.owner.country.toString(),
              style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),),
                            SizedBox(height: 31,),
                               CustomText(family: "Poppins", color:Theme.of(context).colorScheme.onTertiary , size: 12, text: tist.job.jobType.name, weight: FontWeight.w500)
                                             
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