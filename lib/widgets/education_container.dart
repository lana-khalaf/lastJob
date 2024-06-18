import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/skill.dart';

class Education_container extends StatelessWidget {
   Education_container({
    super.key,
    required this.educationTist,
   required this.index
  });
List educationTist;
 int index;
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
                             color: Colors.black .withOpacity(0.25), // 25% opacity
                             offset: Offset(0, 5), // X: 0, Y: 4
                             blurRadius: 4, // Blur: 4
                             spreadRadius: 0, // Spread: 0
                           ),
                         ],
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        SizedBox(width: 20,),
              Image.asset("assets/images/image 8.png",
              width: 45,
              height: 45,),
              SizedBox(width: 20,),
              Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Text(educationTist[index].major,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,// غيرت  
            color: Theme.of(context).colorScheme.primary,
                    fontFamily: "Cairo",
                    
          ),),
          Text(educationTist[index].specialization ,
          style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),)
          ],),
          SizedBox(width: 55,),
           Column(mainAxisAlignment: MainAxisAlignment.center,children: [ Text(educationTist[index].startedAt,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,// غيرت 
            color: Theme.of(context).colorScheme.primary,
                    fontFamily: "Cairo",
                    
          ),),
          Text(educationTist[index].endedAt??"",
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
    );
  }
}