// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_jobs_app/blocs/community_bloc.dart';
// import 'package:flutter_jobs_app/config.dart';
// import 'package:flutter_jobs_app/service/communityPageApi.dart';
// import 'package:flutter_jobs_app/widgets/custom_community.dart';
// import 'package:flutter_jobs_app/widgets/custom_searchFeild.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class CommunityPage extends StatelessWidget {
//    CommunityPage({super.key});
//   static String id = 'CommunityPage';
//    String? userTokenn = config.get<SharedPreferences>().getString("Token");
//   @override
  
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => CommunityBloc()..add(GetCommunity()),
//       child: Builder(builder: (context) {
//         return Scaffold(
//           body: Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: Theme.of(context).brightness == Brightness.light
//                     ? AssetImage('assets/images/light.bg.png')
//                     : AssetImage('assets/images/dark_bg.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 26, right: 26),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Padding(
//                           padding: const EdgeInsets.only(top: 19),
//                           child: Image.asset("assets/images/back.png")),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 19, left: 140),
//                         child: Text(
//                           "Community",
//                           style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 16,
//                             color: Theme.of(context).colorScheme.onTertiary,
//                             fontFamily: "Poppins",
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 35),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         CustomSearchTextField(
//                             color: Color(0x9B3B4758),
//                             hintText: "Search for Community "),
//                         Container(
//                           height: 49,
//                           width: 56,
//                           decoration: BoxDecoration(
//                               color: Theme.of(context)
//                                   .colorScheme
//                                   .onPrimaryContainer,
//                               boxShadow: [
//                                 BoxShadow(
//                                   color: Colors.black
//                                       .withOpacity(0.25), // 25% opacity
//                                   offset: Offset(0, 5), // X: 0, Y: 4
//                                   blurRadius: 4, // Blur: 4
//                                   spreadRadius: 0, // Spread: 0
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(14)),
//                           child: Image.asset(
//                             'assets/images/Slider.png',
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   BlocBuilder<CommunityBloc, CommunityState>(
//                     builder: (context, state) {
//                   if (state is Success) {
//                         return Expanded(
//                           child: ListView.builder(
//                             itemBuilder: (context, index) => Customcommunity(
//                               imageCommunity: 'assets/images/FB.png',
//                               nameCommunity: state.communaties[index].name,
//                                idCommunity: state.communaties[index].id,
//                                 token: userTokenn ?? "",
//                             ),
//                             itemCount: state.communaties.length,
//                           ),
//                         );

//                     }
//                     else if (state is Loading) {
//                         return Center(child: CircularProgressIndicator());
//                       } else if (state is Error) {
//                         return Center(child: Text('Error loading communities'));
//                       } else {
//                         return Center(child: Text('No communities available'));
//                       }
//                     }
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/community_bloc.dart';
import 'package:flutter_jobs_app/blocs/community_event.dart';
import 'package:flutter_jobs_app/blocs/community_state.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/service/communityPageApi.dart';
import 'package:flutter_jobs_app/widgets/custom_community.dart';
import 'package:flutter_jobs_app/widgets/custom_searchFeild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommunityAuthPage extends StatelessWidget {
  CommunityAuthPage({super.key});
  static String id = 'CommunityPage';
  String? userTokenn = config.get<SharedPreferences>().getString("Token");
    String? userid = config.get<SharedPreferences>().getString("id");

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CommunityBloc()..add(GetCommunity()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                   ? AssetImage('assets/images/Mask Group (3).png')
                    : AssetImage('assets/images/Home (3).jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 26, right: 26),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child:  InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child:Theme.of(context).brightness == Brightness.light
                                               ? Image.asset('assets/images/back.png')
                                                : Image.asset('assets/images/Vector (25).png'), 
                            ),
                    ),
                          Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 19, ),
                        child: Text(
                          "Communities".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomSearchTextField(
                          
                          color: Color(0x9B3B4758),
                          hintText: "Search for Community".tr(),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              context.read<CommunityBloc>().add(SearchCommunity(value));
                            } else {
                              context.read<CommunityBloc>().add(GetCommunity());
                            }
                          },
                        ),
                     
                      ],

                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<CommunityBloc, CommunityState>(
                    builder: (context, state) {
                      if (state is CommunitySuccess) {
                        return Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => Customcommunity(
                              imageCommunity: 'assets/images/FB.png',
                              nameCommunity: state.communities[index].name,
                              idCommunity: state.communities[index].id,
                              token: userTokenn ?? "", 
                              iduser: userid ?? "",
                            ),
                            itemCount: state.communities.length,
                          ),
                        );
                      } else if (state is CommunityLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is CommunityError) {
                        return Center(child: Text('Error loading communities'));
                      } else {
                        return Center(child: Text('No communities available'));
                      }
                    }
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
