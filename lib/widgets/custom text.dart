import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
   CustomText({super.key, required this.family, required this.color, required this.size, required this.text, required this.weight});
 String text ;
 Color color ;
 double size;
 FontWeight weight;
 String family;
  @override
  Widget build(BuildContext context) {
    return   Text(
                           text,
                            style: TextStyle(
                              color:  color,
                              fontSize: size,
                              fontWeight: weight,
                                  fontFamily: family,
                            ),
                          ) ;
  }
}