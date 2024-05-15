// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/widgets/custom%20_container.dart';
import 'package:flutter_jobs_app/widgets/search_textfield.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  RangeValues _rangeValues = RangeValues(72000.0, 120000.0);
  bool isEditing1 = false;
  bool isEditing2 = false;

  TextEditingController textEditingController1 = TextEditingController();
  String text1 = 'Text to edit';
  TextEditingController textEditingController2 = TextEditingController();
  String text2 = 'Text2 to edit';
  @override
  void initState() {
    super.initState();
    textEditingController1.text = text1;
    textEditingController2.text = text2;
  }

  void _startEditing(int numberController) {
    setState(() {
      numberController == 1 ? isEditing1 = true : isEditing2 = true;
    });
  }

  void _saveText(int numberController) {
    setState(() {
      if (numberController == 1) {
        isEditing1 = false;
        text1 = textEditingController1.text;
      } else {
        isEditing2 = false;
        text2 = textEditingController2.text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 40),
      height: MediaQuery.of(context).size.height * 0.88,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 70,
              bottom: 50,
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: SearchTextField(
              hintText: 'Add a role or company or type',
              color: kMainColor,
              borderColor: Color.fromARGB(255, 145, 144, 144),
              filled: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customContainer(
                  str: 'Google',
                ),
                customContainer(
                  str: 'Meta',
                ),
                customContainer(
                  str: 'Amazon',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customContainer(
                  str: 'Apple',
                ),
                customContainer(
                  str: 'Microsoft',
                ),
                customContainer(
                  str: 'Netflix',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 10),
            child: Divider(
              color: Color.fromARGB(255, 213, 210, 210),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              bottom: 10,
            ),
            child: Text(
              'Salary range',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(149, 150, 157, 1),
              ),
            ),
          ),
          Row(
            children: [
              Text(
                'The average listing price is ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(149, 150, 157, 1),
                ),
              ),
              Text('\$84000'),
            ],
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                '\$${_rangeValues.start.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                width: 60,
              ),
              Text(
                '\$${_rangeValues.end.toStringAsFixed(0)}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          RangeSlider(
            activeColor: Color.fromRGBO(53, 104, 153, 1),
            values: _rangeValues,
            min: 50000.0,
            max: 150000.0,
            divisions: 150,
            onChanged: (RangeValues values) {
              setState(() {
                _rangeValues = values;
              });
            },
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  'Experience level',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(149, 150, 157, 1),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                isEditing1
                    ? Container(
                        width: 100,
                        child: TextField(
                          maxLength: 50,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          controller: textEditingController1,
                          autofocus: true,
                          onEditingComplete: () {
                            _saveText(1);
                          },
                        ),
                      )
                    : Container(
                        width: 100,
                        child: Text(
                          text1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _startEditing(1);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 10),
            child: Divider(
              color: Color.fromARGB(255, 213, 210, 210),
            ),
          ),
          ListTile(
            title: Row(
              children: [
                Text(
                  'Location',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(149, 150, 157, 1),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                isEditing2
                    ? Container(
                        width: 120,
                        child: TextField(
                          maxLength: 50,
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                          decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                          controller: textEditingController2,
                          autofocus: true,
                          onEditingComplete: () {
                            _saveText(2);
                          },
                        ),
                      )
                    : Container(
                        width: 120,
                        child: Text(
                          text2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                _startEditing(2);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 10),
            child: Divider(
              color: Color.fromARGB(255, 213, 210, 210),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Job Types',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(149, 150, 157, 1),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              JobTypesContainer(
                text: 'Any',
              ),
              JobTypesContainer(
                text: 'Full-Time',
              ),
              JobTypesContainer(
                text: 'Contract',
              ),
              JobTypesContainer(
                text: 'Part-Time',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobTypesContainer extends StatefulWidget {
  const JobTypesContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  State<JobTypesContainer> createState() => _JobTypesContainerState();
}

class _JobTypesContainerState extends State<JobTypesContainer> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        setState(() {
          pressed = !pressed;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 6,
          horizontal: 14,
        ),
        decoration: BoxDecoration(
          color: pressed
              ? Color.fromRGBO(53, 104, 153, 1)
              : Color.fromRGBO(228, 229, 231, 1),
          borderRadius: BorderRadius.circular(22),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: pressed ? kMainColor : Colors.black),
        ),
      ),
    );
  }
}
