import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/education.dart';
import 'package:flutter_jobs_app/widgets/education_container.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';

class SeeAll extends StatelessWidget {
   SeeAll({super.key, required this.title, required this.result});
  static String id = 'SeeAll';
  String title;
  List result;
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
             child: Padding(
          padding: const EdgeInsets.only(left: 20,right: 20),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Row(
                  children: [
                    InkWell(
                      child:Theme.of(context).brightness == Brightness.light
                   ? Image.asset('assets/images/back.png')
                    : Image.asset('assets/images/Vector (25).png'), onTap: (){  Navigator.pop(context);},),
                        Spacer(),
                    Text(title,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 21,// غيرت 
                      color: Theme.of(context).colorScheme.primary,
                              fontFamily:"Poppins",
                              
                    ),),
                        Spacer(),
                    // SizedBox(
                    //   width: 115,
                    // ),

                  ],
                ),
                
              ),
                Expanded(
                 child:   Padding(
                 padding: const EdgeInsets.only(left: 26, right: 26, top: 30),
                   child: ListView.builder(               
                          itemCount: result.length,

                          itemBuilder: (context, index) => 
                      Builder(builder: (context){
                              if (result is List<Education>) {
                               return Padding(
                                 padding: const EdgeInsets.only(top: 20),
                                 child: Education_container(educationTist: result,index: index,),
                               );
                              
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: job_container(tist: result,index: index,),
                                );
                               }
                              
                                   })
                   ),
                 )
                ),
            ],
),
             ),
),
    );
  }
}