
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({
    Key? key,
    required this.color,
    required this.hintText,
    this.borderRadius = 14,
    this.maxLines = 1,
  }) : super(key: key);

  final Color color;
  final String hintText;
  final double borderRadius;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 336,
      height:48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black .withOpacity(0.25), // 25% opacity
            offset: Offset(0, 4), // X: 0, Y: 4
            blurRadius: 4, // Blur: 4
            spreadRadius: 0, // Spread: 0
          ),
        ],
      ),
      child: TextField(
        
        maxLines: maxLines,
        cursorColor: Color.fromRGBO(53, 104, 153, 1),
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          
          filled: true,
          fillColor: Color(0xffFFFFFF),
          prefixIcon: Image.asset("assets/images/Search2.png"),
          hintText: hintText,
          hintStyle: TextStyle(    color:  color,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Tajawal"
                                  ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
