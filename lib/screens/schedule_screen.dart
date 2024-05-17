import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({super.key});
  static String id = 'ScheduleScreen';

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        child: Column(
          children: [
            CustomAppBar(str: '', color: black),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 148,
              width: 335,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(24),
              ),
              child: EasyDateTimeLine(
                initialDate: DateTime.now(),
                onDateChange: (selectedDate) {
                  //`selectedDate` the new date selected.
                },
                headerProps: const EasyHeaderProps(
                  monthPickerType: MonthPickerType.switcher,
                  dateFormatter: DateFormatter.custom('dd MMMM'),
                ),
                dayProps: const EasyDayProps(
                  width: 44,
                  height: 76,
                  dayStructure: DayStructure.dayStrDayNum,
                  activeDayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kMainColor),
                    dayStrStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: kMainColor),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: blue),
                  ),
                  inactiveDayStyle: DayStyle(
                    dayNumStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    dayStrStyle: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w400, color: grey),
                    decoration: BoxDecoration(),
                  ),
                ),
              ),
            ),
            Container(
              height: 500,
              width: 335,
              color: Colors.pink,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        'My Schedule',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: ListView.builder(
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              height: 100,
                              width: 335,
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/google.png',
                                    height: 81,
                                    width: 81,
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: grey,
                                          ),
                                          Text(
                                            '26 January 2022',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w400,
                                                color: grey),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 4),
                                        child: Text(
                                          'google',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: grey,
                                          ),
                                          Text(
                                            'google meet',
                                            style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                                color: grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(
                                    flex: 12,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_sharp,
                                    color: grey,
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
