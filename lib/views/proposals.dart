import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';

class ProposalPage extends StatelessWidget {
  const ProposalPage({super.key});

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
                 crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                 
                    children: [
                      Padding(     padding: const EdgeInsets.only( top: 19),
                      child: Image.asset("assets/images/back.png")),
                        Padding(
                             padding: const EdgeInsets.only( top: 19,left: 140),
                          child: Text("Prorpsals",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Theme.of(context).colorScheme.onTertiary ,
                                  fontFamily: "Poppins",
                                  
                                    ),),
                        ),
                    ],
                  ),
         
              const SizedBox(
                height: 50,
              ),
              InkWell(
                    onTap: (){},
                    child: Row(
                                  children: [ Image.asset("assets/images/Road.png"),
                                  SizedBox(width: 10,),
                                   Text(
                              "Road Map",
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.onTertiary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                                  ],
                                ),
                  ),
            
              const SizedBox(
                height: 28,
              ),
               InkWell(
                    onTap: (){},
                    child: Row(
                                  children: [ Image.asset("assets/images/People.png"),
                                  SizedBox(width: 10,),
                                   Text(
                              "Community",
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.onTertiary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                                  ],
                                ),
                  ),
            
              const SizedBox(
                height: 28,
              ),
              InkWell(
                    onTap: (){},
                    child: Row(
                                  children: [ Image.asset("assets/images/Download Resume.png"),
                                  SizedBox(width: 10,),
                                   Text(
                              "Make a Resume",
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.onTertiary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                                  ],
                                ),
                  ),
            
            
              ],
            ), ),
      ),
    );
  }
}