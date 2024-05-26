// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_jobs_app/contents.dart';

class buildTextField extends StatefulWidget {
  buildTextField({
    Key? key,
    required this.pass,
    required this.controller,
    required this.hintText,
  }) : super(key: key);
  String? pass;
  String? hintText;
  final TextEditingController controller;
  @override
  State<buildTextField> createState() => _buildTextFieldState();
}

class _buildTextFieldState extends State<buildTextField> {
  bool invisiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.rtl,
      obscureText: invisiblePassword,
      validator: widget.pass == null
          ? (data) {
              if (data!.isEmpty) {
                return "Required Field";
              } else if (data.length < 8) {
                return "Password Must be At Least 8 Characters";
              } else if (RegExp(r'^-?[0-9]+$').hasMatch(data)) {
                return 'Password Should Contain Numbers & Characters';
              } else if (RegExp(r'^[a-z]+$').hasMatch(data)) {
                return 'Password Should Contain Numbers & Characters';
              } else {
                widget.pass = data;
                return null;
              }
            }
          : (value) {
              if (value!.isEmpty) {
                return "Required Field";
              } else if (value.length < 8) {
                return "Password Must be At Least 8 Characters";
              } else if (RegExp(r'^-?[0-9]+$').hasMatch(value)) {
                return 'Password Should Contain Numbers & Characters';
              } else if (RegExp(r'^[a-z]+$').hasMatch(value)) {
                return 'Password Should Contain Numbers & Characters';
              } else if (value != widget.pass) {
                return "Password and Confirm password aren't the same";
              } else {
                return null;
              }
            },
      onFieldSubmitted: (value) {
        widget.controller.text = value;
      },
      showCursor: false,
      enableInteractiveSelection: false,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: kMainColor,
      style: TextStyle(
        color: kMainColor,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(color: Colors.white),
        suffixIcon: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: IconButton(
              onPressed: () {
                setState(() {
                  invisiblePassword = !invisiblePassword;
                });
              },
              icon: Icon(
                invisiblePassword
                    ? Icons.visibility_off_sharp
                    : Icons.visibility_sharp,
                color: kMainColor,
              ),
            )),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 2.0,
              color: kMainColor,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              width: 1.5,
              color: kMainColor,
            )),
      ),
    );
  }
}
