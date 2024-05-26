// Class CustomTextFeild {

// }
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
   CustomTextFeild({super.key,  required  this.controller,
    required  this.type,
   this.validate, required  this.label, this.prefix,  this.suffix, this.suffixPressed, required this.isPassword, required this.onSubmit,
  });
TextEditingController controller;
TextInputType type;
 String? Function(String?)? validate;
  String label;
   IconData? prefix;
    IconData? suffix;
     Null Function()? suffixPressed;
      bool isPassword;
     Null Function(dynamic value) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        validator: validate,
     textAlign: TextAlign.start,
        onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
         border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Color(0xff969AA0),
          ),
         ),
        labelText: label,
        
        alignLabelWithHint: true,
        labelStyle: TextStyle(
          color: Color(0xff969AA0),
          fontWeight: FontWeight.w400,
          fontSize: 16,
          fontFamily: "Cairo",
          
        ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: () {
                  // Handle suffix button press
                },
              )
            : null,
      ),
        // Add other TextFormField properties as needed
      ),
    );
  }
}