import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/Model/skill.dart';
import 'package:flutter_jobs_app/widgets/job_container.dart';

class SearchResult extends StatelessWidget {
   SearchResult({super.key, required this.test});
List <Skill>test;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("293 Jobs Found", 
           style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,// غيرت 
                          color: Theme.of(context).colorScheme.primaryContainer,
                                  fontFamily: "Poppins",
                                  
                        ),),
        ),
Expanded(
  child:   ListView.builder(
  
  
  
                        itemCount: test.length,
  
  
  
                        itemBuilder: (context, index) => 
  
  
  
                        job_container(tist: test, index:  index,)
  
  
  
                      ),
),
      ],

    )
    ;
  }
}