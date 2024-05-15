// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/bottom_sheet.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';
import 'package:flutter_jobs_app/widgets/search_textfield.dart';

class HomeBodyScreen extends StatefulWidget {
  const HomeBodyScreen({super.key});
  @override
  State<HomeBodyScreen> createState() => _HomeBodyScreenState();
}

class _HomeBodyScreenState extends State<HomeBodyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: kMainColor,
      ),
      body: Stack(children: [
        Image.asset(
          'images/Rectangle 4307.png',
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: SingleChildScrollView(
                child: SafeArea(
                    child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomAppBar(
                  color: kMainColor,
                  str: 'Home',
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 2),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.74,
                      child: SearchTextField(
                        hintText: 'Search for a job',
                        color: grey,
                        borderColor: const Color.fromARGB(255, 71, 70, 70),
                        filled: true,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (context) {
                              return CustomBottomSheet();
                            });
                      },
                      child: Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width * 0.14,
                        decoration: BoxDecoration(
                            color: kMainColor,
                            borderRadius: BorderRadius.circular(14)),
                        child: Image.asset(
                          'images/Slider.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.12,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 8),
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kMainColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'images/Group 12.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "featured jobs",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kMainColor,
                        ),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 276,
                          decoration: BoxDecoration(
                              // color: Colors.amber,
                              gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Color.fromRGBO(72, 37, 153, 1),
                                    Color.fromRGBO(64, 100, 137, 1)
                                  ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 4,
                                      vertical: 2,
                                    ),
                                    child: Container(
                                      width: 85,
                                      height: 85,
                                      decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        width: 160,
                                        child: Text(
                                          "Product Designer",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color: kMainColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "google",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    BorderContainer(
                                      text: 'Design',
                                    ),
                                    Spacer(),
                                    BorderContainer(text: 'Full_time'),
                                    Spacer(),
                                    BorderContainer(text: 'junior')
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "\$1200",
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: kMainColor,
                                      ),
                                    ),
                                    Text(
                                      "Almazeh",
                                      style: TextStyle(
                                        color: kMainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "recommended jobs",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: kMainColor,
                        ),
                      ),
                      Text(
                        "see all",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 10),
                        child: Container(
                          width: 160,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromRGBO(166, 196, 255, 1),
                                    Color.fromRGBO(65, 94, 153, 1)
                                  ]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: Image.asset('images/google.png'),
                              ),
                              Text(
                                "ux designer",
                                style: TextStyle(
                                  fontSize: 21,
                                  fontWeight: FontWeight.w700,
                                  color: kMainColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "\$1200",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: kMainColor,
                                    ),
                                  ),
                                  Text(
                                    "junior",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w700,
                                      color: kMainColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )))),
      ]),
    );
  }
}


class BorderContainer extends StatelessWidget {
  const BorderContainer({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
          color: Color.fromRGBO(107, 127, 141, 0.46),
          borderRadius: BorderRadius.circular(10)),
      child: Center(
          child: Text(
        text,
        style: TextStyle(
          color: kMainColor,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      )),
    );
  }
}
