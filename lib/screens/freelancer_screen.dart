import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/bottom_sheet.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';
import 'package:flutter_jobs_app/widgets/search_textfield.dart';

class FreeLancerScreen extends StatelessWidget {
  const FreeLancerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                        color: black,
                        str: 'FreeLancer',
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
                              borderColor:
                                  const Color.fromARGB(255, 71, 70, 70),
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
                        height: 20,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 30),
                                  height: 200,
                                  width: 370,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE0EBFC),
                                      border: Border.all(
                                        width: 4,
                                        color: Color(0xff00ACFF),
                                      ),
                                      borderRadius: BorderRadius.circular(30),),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Text(
                                            'Google llc',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(0, 9, 89, 1),
                                            ),
                                          ),
                                          Spacer(
                                            flex: 9,
                                          ),
                                          Text(
                                            'Full time',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(0, 9, 89, 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'UI/UX Designer',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            '\$10000-\$20000/ Month',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(),
                                          Text(
                                            'Onsite',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Color.fromRGBO(0, 9, 89, 1),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          itemCount: 10,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
