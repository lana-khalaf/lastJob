import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/custom_appBar.dart';

class StepRoadMapScreen extends StatelessWidget {
  StepRoadMapScreen({super.key});
  static String id = 'StepRoadMapScreen';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                str: '',
                color: black,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '1.PLANNING',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 252,
                width: 331,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.45,
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(
                          vertical: 20,
                        ),
                        child: Text(
                          '_Sleep in Sunday is the best day of the week! #sunspot',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.visible,
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
