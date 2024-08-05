import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';

class ProposalPage extends StatelessWidget {
  const ProposalPage({super.key});
static String id = 'ProposalPage';
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
            padding: const EdgeInsets.only(left: 26, right: 26),
            child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                          Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child:
                 Row(
                  children: [
                    InkWell(
                      child:Theme.of(context).brightness == Brightness.light
                   ? Image.asset('assets/images/back.png')
                    : Image.asset('assets/images/Vector (25).png'), onTap: (){  Navigator.pop(context);},),
                        Spacer(),
                    Text("Guidelines".tr(),
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
                
       
              const SizedBox(
                height: 50,
              ),
              InkWell(
                    onTap: (){},
                    child: Row(
                       
                                  children: [ Spacer(flex: 1,),
                                    Image.asset("assets/images/Road.png",color: Theme.of(context).colorScheme.primary,),
                                Spacer(),
                                   Text(
                              "Road Map          ".tr(),
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                            Spacer(flex: 4,),
                               Image.asset("assets/images/shape.png"),
                               Spacer()
                                  ],
                                ),
                  ),
            
            buildDivider(),
               InkWell(
                    onTap: (){},
                    child: Row(
                                  children: [ Spacer(flex: 1,),
                                    Image.asset("assets/images/People.png",color: Theme.of(context).colorScheme.primary,),
                               Spacer(flex: 1,),
                                   Text(
                              "Community       ".tr(),
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                            Spacer(flex: 4,),
 Image.asset("assets/images/shape.png"),
                            Spacer(flex: 1,),
                                  ],
                                ),
                  ),
            
            buildDivider(),
              InkWell(
                    onTap: (){},
                    child: Row(
                                  children: [
                                          Spacer(flex: 1,),
                                     Image.asset("assets/images/Download Resume.png",color: Theme.of(context).colorScheme.primary,),
                                      Spacer(flex: 1,),
                                   Text(
                              "Make a Resume".tr(),
                              style: TextStyle(
                                color:  Theme.of(context).colorScheme.primary,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                    fontFamily: "Poppins",
                              ),
                            ),
                                  Spacer(flex: 4,),
                             Image.asset("assets/images/shape.png"),
                                   Spacer(flex: 1,),
                                  ],
                                ),
                              
                  ),
                  buildDivider()
            
            
              ],
            ), ),
      ),
    );
  }
}
  Divider buildDivider() {
    return Divider(
      color: Colors.grey,
      height: 36,
      thickness: 1,
      indent: 40,
    );
  }
