// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';
import 'package:flutter_jobs_app/widgets/custom_floating_button.dart';

class BlogScreen extends StatelessWidget {
  BlogScreen({super.key});
  static String id = 'BlogScreen';
  String selectedSection = 'Blog';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Spacer(
                        flex: 1,
                      ),
                      Icon(Icons.arrow_back_ios_new_rounded),
                      Spacer(
                        flex: 3,
                      ),
                      Text(
                        'Community',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(
                        flex: 6,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      customContainer(
                        section: 'Blog',
                        selectedSection: selectedSection,
                      ),
                      customContainer(
                        section: 'Questions',
                        selectedSection: selectedSection,
                      ),
                      customContainer(
                        section: 'Archives',
                        selectedSection: selectedSection,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        height: MediaQuery.of(context).size.height * 0.8,
                        color: Colors.amber,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                children: [
                                  Image.asset(
                                    'images/photo.png',
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Yuna',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              isThreeLine: true,
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.only(top: 8.0, left: 6),
                                child: Column(
                                  children: [
                                    Text(
                                      'Sleep in Sunday is the best day of the week! #sunspot',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.favorite_border_rounded,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.chat_bubble_outline,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.bookmark_border,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              dense: false,
                            );
                          },
                          itemCount: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.62,
                            right: 24),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: CustomFloatingButton(
                            icon: Icons.add,
                            function: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customContainer(
      {required String section, required String selectedSection}) {
    return InkWell(
      onTap: () {
        selectedSection == section;
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selectedSection == section
              ? Color(0xff356899)
              : Color(0xff9FA2A9),
          borderRadius: BorderRadius.circular(97),
        ),
        child: Center(
          child: Text(
            section,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
