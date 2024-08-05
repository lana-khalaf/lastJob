import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_state.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
static String id = 'settingsPage';
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        
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
                  padding: const EdgeInsets.only(left: 26, right: 36),
                  child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                         
                            children: [
                              InkWell(
                                onTap: (){  Navigator.pop(context);},
                                child: Theme.of(context).brightness == Brightness.light
                                                   ? Image.asset('assets/images/back.png')
                                                    : Image.asset('assets/images/Vector (25).png'),
                              ),
                                            Spacer(),
                                Text("Settings".tr(),
                                          style: TextStyle(
                                         fontWeight: FontWeight.w900,
                      fontSize: 21,
                                            color: Theme.of(context).colorScheme.primary ,
                                        fontFamily: "Poppins",
                                        
                                          ),),
                                          Spacer()
                            ],
                          ),
                      ),
              
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                          onTap: (){
                            if(state is Unauthenticated){
                                                   showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                          }},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ Image.asset("assets/images/gg_profile.png",color: Theme.of(context).colorScheme.primary ,),
                                    //  Spacer(),
                                         Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                                                                 "Profile Visibility".tr(),
                                                                                 style: TextStyle(
                                                                                   color:  Theme.of(context).colorScheme.primary,
                                                                                   fontSize: 14,
                                                                                   fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                                                                 ),
                                                                               ),
                                                                              //  Spacer(),
                                                                                 Text(
                          "First name ,Last name ,Mobile number",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Cairo",
                          ),
                        ),
                                           ],
                                         ),
                                         Image.asset("assets/images/shape.png")
                                        ],
                                      ),
                        ),
                   buildDivider(),
                    // const SizedBox(
                    //   height: 28,
                    // ),
                       InkWell(
                          onTap: (){
                            if(state is Unauthenticated){
                                                   showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                          }},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ Image.asset("assets/images/carbon_notification-new.png",color: Theme.of(context).colorScheme.primary ,),
                                     
                                         Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          
                                           children: [
                                             Text(
                                                                                 "Notification".tr(),
                                                                                 style: TextStyle(
                                                                                   color:  Theme.of(context).colorScheme.primary,
                                                                                   fontSize: 14,
                                                                                   fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                                                                 ),
                                                                               ),
                                                                                 Text(
                          "Maybe you have new notification        ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Cairo",
                          ),
                        ),
                                           ],
                                         ),
                                         Image.asset("assets/images/shape.png")
                                        ],
                                      ),
                        ),

    buildDivider(),
     
             
              InkWell(
                          onTap: (){
                            if(state is Unauthenticated){
                                                   showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                          }},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ Image.asset("assets/images/Vector (20).png",color: Theme.of(context).colorScheme.primary ,),
                                     
                                         Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Text(
                                                                                 "Change Password".tr(),
                                                                                 style: TextStyle(
                                                                                   color:  Theme.of(context).colorScheme.primary,
                                                                                   fontSize: 14,
                                                                                   fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                                                                 ),
                                                                               ),
                                                                            
                                                                                 Text(
                          "             Manage Your account                 ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Cairo",
                          ),
                        ),
                                           ],
                                         ),
                                         Image.asset("assets/images/shape.png")
                                        ],
                                      ),
                        ),
                            buildDivider(),
                               InkWell(
                          onTap: (){
                            if(state is Unauthenticated){
                                                   showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                          }},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ Image.asset("assets/images/Vector (21).png",color: Theme.of(context).colorScheme.primary ,),
                                     
                                         Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                       
                                           children: [
                                             Text(
                                                                                 "Language".tr(),
                                                                                 style: TextStyle(
                                                                                   color:  Theme.of(context).colorScheme.primary,
                                                                                   fontSize: 14,
                                                                                   fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                                                                 ),
                                                                               ),
                                                                                 Text(
                          "                     Arabic/English                       ",
                          style: TextStyle( 
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Cairo",
                          ),
                        ),
                                           ],
                                         ),
                                         Image.asset("assets/images/shape.png")
                                        ],
                                      ),
                        ),
                            buildDivider(),
                InkWell(
                          onTap: (){
                            if(state is Unauthenticated){
                                                   showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('تسجيل الدخول مطلوب'),
                                content: Text('يرجى تسجيل الدخول للقيام بهذه العملية.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('موافق'),
                                  ),
                                ],
                              );
                            },
                          );
                         
                          }},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [ Image.asset("assets/images/Vector (22).png",color: Theme.of(context).colorScheme.primary ,),
                               
                                         Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                         
                                           children: [
                                             Text(
                                                                                 "Theme".tr(),
                                                                                 style: TextStyle(
                                                                                   color:  Theme.of(context).colorScheme.primary,
                                                                                   fontSize: 14,
                                                                                   fontWeight: FontWeight.w600,
                                              fontFamily: "Poppins",
                                                                                 ),
                                                                               ),
                                                                                 Text(
                          "                        Light/Dark                           ",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontFamily: "Cairo",
                          ),
                        ),
                                           ],
                                         ),
                               
                                         Image.asset("assets/images/shape.png")
                                        ],
                                      ),
                        ),
                            buildDivider(),
          
       
        
                    ],
                  ), ),
            ),
          );
        }
      
      )
    
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
