import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';

class JobDetails extends StatelessWidget {
  const JobDetails({super.key});
 static String id = 'jobDetails';
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
         decoration: BoxDecoration(
          image: DecorationImage(
            image:  Theme.of(context).brightness == Brightness.light
                   ? AssetImage('assets/images/Mask Group (3).png')
                    : AssetImage('assets/images/Home (3).jpg'),
            fit: BoxFit.cover,
          ),

          
        ),
        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              
               decoration:  BoxDecoration(
                  color:  Theme.of(context).colorScheme.inversePrimary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30)
                  )
                ),
                child: Padding(
                  padding:  const EdgeInsets.only(left: 26, right: 26),
                  child: Column(
                    children: [
                      Row(
                        children: [
                            Padding(     padding: const EdgeInsets.only( top: 19),
                  child: InkWell(onTap: (){},child: Theme.of(context).brightness == Brightness.light
                   ? Image.asset('assets/images/Vector (25).png')
                    :  Image.asset('assets/images/back.png'))),
                    Padding(
                         padding: const EdgeInsets.only(left: 300, top: 19),
                      child:InkWell(onTap: (){},child: Image.asset("assets/images/Vector (17).png"))
                    ),
        
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.onBackground ,
                        child: Image.asset("assets/images/grommet-icons_google.png"),
                        radius:42,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12, bottom: 4
                        ),
                        child: CustomText(family: "CircularStd", color:  Theme.of(context).colorScheme.onBackground, size: 20, text: "Product Designer", weight: FontWeight.w700),
                      ),
                        CustomText(family: "CircularStd", color:  Theme.of(context).colorScheme.onBackground, size: 15, text: "Google", weight: FontWeight.w400),
                        Padding(
                          padding: const EdgeInsets.only(top: 16,bottom: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CustomButton(text: "Design", press: (){}, radius:164 ,width: 99,height: 26,color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.15) ,colorText: Theme.of(context).colorScheme.onBackground ,
                              size: 11,weight:FontWeight.w400 ,family:"CircularStd" ,),
                              CustomButton(text: "Full-Time", press: (){},radius: 164,width: 99,height: 26,color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.15) ,colorText: Theme.of(context).colorScheme.onBackground ,
                              size: 11,weight:FontWeight.w400 ,family:"CircularStd" ,),
                              CustomButton(text: "Junior", press: (){},radius: 164,width: 99,height: 26,color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.15) ,colorText: Theme.of(context).colorScheme.onBackground ,
                              size: 11,weight:FontWeight.w400 ,family:"CircularStd" ,),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                             CustomText(family: "CircularStd", color:  Theme.of(context).colorScheme.onBackground, size: 16, text: "\$160,00/year", weight: FontWeight.w600),
                               CustomText(family: "CircularStd", color:  Theme.of(context).colorScheme.onBackground, size: 16, text: "California, USA", weight: FontWeight.w600),
                        
                            ],
                          ),
                        )
                    ],
                  ),
                ),
            ),
            Padding(
              padding:  const EdgeInsets.only(left: 26, right: 26,top: 16,bottom: 20),
              child: CustomText(family: "CircularStd", color: Theme.of(context).colorScheme.primary, size: 16, text: "Description:", weight: FontWeight.w400),
            ),
             Padding(
              padding:  const EdgeInsets.only(left: 26, right: 26,bottom: 20),
              child: CustomText(family: "CircularStd", color: Theme.of(context).colorScheme.primary, size: 12, text: "We are the teams who create all of Facebook's products used by billions of people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more?", weight: FontWeight.w100),
            ),
              Padding(
              padding:  const EdgeInsets.only(left: 26, right: 26,bottom: 20),
              child: CustomText(family: "CircularStd", color: Theme.of(context).colorScheme.primary, size: 16, text: "Responsibilities:", weight: FontWeight.w400),
            ),
              Padding(
              padding:  const EdgeInsets.only(left: 26, right: 26,bottom: 20),
              child: CustomText(family: "CircularStd", color: Theme.of(context).colorScheme.primary, size: 12, text: "Full stack web/mobile application development with a variety of coding languages \n\nCreate consumer products and features using internal programming language Hack \n\nImplement web or mobile interfaces using XHTML, CSS, and JavaScript", weight: FontWeight.w100),
            ),
        //       Padding(
        //  padding: const EdgeInsets.only(top: 40,left: 26, right: 26,),
        //  child: 
         Center(child: CustomButton(text: "Save", press: (){}, color:Theme.of(context).colorScheme.inversePrimary,colorText: Theme.of(context).colorScheme.onBackground,width: 337,height: 56,)),
      //  )
          ],
        ),
        ),
       
      
    );
  }
}