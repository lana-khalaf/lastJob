// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/widgets/archives_widget.dart';
import 'package:flutter_jobs_app/widgets/blog_widget.dart';
import 'package:flutter_jobs_app/widgets/questions_widgets.dart';

class BlogScreen extends StatefulWidget {
  BlogScreen({super.key});
  static String id = 'BlogScreen';

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
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
                          onTap: () {
                            setState(() {
                              selectedSection = 'Blog';
                            });
                          }),
                      customContainer(
                          section: 'Questions',
                          onTap: () {
                            setState(() {
                              selectedSection = 'Questions';
                            });
                          }),
                      customContainer(
                          section: 'Archives',
                          onTap: () {
                            setState(() {
                              selectedSection = 'Archives';
                            });
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  selectedSection == 'Blog'
                      ? BlogWidget()
                      : selectedSection == 'Questions'
                          ? QuestionsWidget()
                          : ArchivesWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customContainer({required String section, required void onTap()}) {
    return InkWell(
      onTap: onTap,
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
