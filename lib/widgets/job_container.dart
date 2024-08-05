import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/skill.dart';

class job_container extends StatelessWidget {
   job_container({
    super.key,
    required this.tist,
    required this.index
  });
List tist;
num index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 17),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 327,
          height: 74,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
             boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.25),
                      spreadRadius: 2,
                      blurRadius: 5,
                    
                      offset: Offset(0, 2.5), 
                            //  color: Colors.black .withOpacity(0.25), // 25% opacity
                            //  offset: Offset(0, 5), // X: 0, Y: 4
                            //  blurRadius: 4, // Blur: 4
                            //  spreadRadius: 0, // Spread: 0
                           ),
                         ],
            color:   
            Theme.of(context).colorScheme.onInverseSurface,
            // Theme.of(context).colorScheme.onInverseSurface,
          ),
        
          child: Padding(
            padding: const EdgeInsets.only(left: 26,right: 26),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                    // SizedBox(width: 20,),
                Image.asset("assets/images/image 8.png",
                width: 45,
                height: 45,),
                SizedBox(width: 20,),
                Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Text(tist[0].title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,// غيرت  
              color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontFamily: "Cairo",
                      
            ),),
            Text(tist[0].body ?? "",
            style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),)
            ],),
            SizedBox(width: 55,),
             Column(mainAxisAlignment: MainAxisAlignment.center,children: [ 
              Text(
               tist[0].startedAt != null
            ? "${DateTime.parse(tist[0].startedAt).year}-${DateTime.parse(tist[0].startedAt).month}-${DateTime.parse(tist[0].startedAt).day}"
            : "",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 13,// غيرت 
              color: Theme.of(context).colorScheme.onErrorContainer,
                      fontFamily: "Cairo",
                      
            ),),
            Text( tist[0].endedAt != null
            ? "${DateTime.parse(tist[0].endedAt).year}-${DateTime.parse(tist[0].endedAt).month}-${DateTime.parse(tist[0].endedAt).day}"
            : "",
            style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),)
            ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}