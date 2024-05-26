import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/custom_community.dart';
import 'package:flutter_jobs_app/widgets/custom_searchFeild.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({super.key});

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
        child: Padding(padding:  const EdgeInsets.only(left: 26, right: 26),
        child: Column(
          children: [
             Row(
                 
                    children: [
                      Padding(     padding: const EdgeInsets.only( top: 19),
                      child: Image.asset("assets/images/back.png")),
                        Padding(
                             padding: const EdgeInsets.only( top: 19,left: 140),
                          child: Text("Community",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Theme.of(context).colorScheme.onTertiary ,
                                  fontFamily: "Poppins",
                                  
                                    ),),
                        ),
                    ],
                  ),
                 Padding(
                   padding: const EdgeInsets.only(top: 35),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       CustomSearchTextField(color:Color(0x9B3B4758),  hintText: "Search for Community "),
                       Container(
                                height: 49,
                                width: 56,
                               
                                decoration: BoxDecoration(
                                    color:  Theme.of(context).colorScheme.onPrimaryContainer,
                                     
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black .withOpacity(0.25), // 25% opacity
                             offset: Offset(0, 5), // X: 0, Y: 4
                             blurRadius: 4, // Blur: 4
                             spreadRadius: 0, // Spread: 0
                           ),
                         ],
                       
                                    borderRadius: BorderRadius.circular(14)),
                                child: Image.asset(
                                  'assets/images/Slider.png',
                                ),
                              ),
                            
                 
                     ],
                   ),
                 ),
                 SizedBox(height: 20,),
                 Expanded(
                   child: ListView.builder(itemBuilder:  (context, index) => 
                   Customcommunity(imageCommunity: 'assets/images/FB.png', nameCommunity: 'Product Manager',),
                   itemCount: 7,
                   ),
                 ),
          ],
        ),),
      ),
    );
  }
}