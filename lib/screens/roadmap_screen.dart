import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';

class RoadMapScreen extends StatelessWidget {
  RoadMapScreen({super.key});
  static String id = "RoadMap";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/road.png',
            fit: BoxFit.fill,
            height: double.infinity,
            width: double.infinity,
          ),
          Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Container(
                  margin: EdgeInsets.all(6),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xff1B1E28).withOpacity(0.16),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
                Spacer(
                  flex: 3,
                ),
                Text(
                  'road map',
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
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.builder(
                  // itemCount: 2,
                  itemBuilder: (context, index) {
                int i2 = index % 2;
                return Padding(
                  padding: EdgeInsets.only(
                    left: i2 == 0 ? 110 : 0,
                    right: i2 == 0 ? 0 : 110,
                    bottom: 80,
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        width: 209,
                        height: 78,
                        decoration: BoxDecoration(
                          color: Color(0xff3E3E3E).withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 63,
                              width: 63,
                              decoration: BoxDecoration(
                                color: kMainColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            Spacer(
                              flex: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'PLANNING',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: kMainColor,
                                  ),
                                ),
                                Text(
                                  'read more',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff24BAEC),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(
                              flex: 1,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: i2 == 0 ? 110 : 0,
                          right: i2 == 0 ? 0 : 110,
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 2,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff3E3E3E).withOpacity(0.9),
                              ),
                            ),
                            Container(
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: Color(0xff3E3E3E).withOpacity(0.9),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(6),
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Color(0xff24BAEC),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ])
        ],
      ),
    );
  }
}
