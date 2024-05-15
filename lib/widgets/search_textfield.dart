// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_jobs_app/contents.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({
    Key? key,
    required this.filled,
    required this.color,
    required this.borderColor,
    required this.hintText,
    this.borderRadius = 14,
    this.maxLines = 1,
  }) : super(key: key);
  final bool filled;
  final Color color;
  final Color borderColor;
  final String hintText;
  final double borderRadius;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      cursorColor: Color.fromRGBO(53, 104, 153, 1),
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16),
        filled: filled,
        fillColor: kMainColor,
        prefixIcon: Icon(
          Icons.search,
          size: 28,
          color: color,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              color: borderColor,
            )),
        hintText: hintText,
        hintStyle: TextStyle(color: color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
