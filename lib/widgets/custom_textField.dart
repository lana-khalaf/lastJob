// // Class CustomTextFeild {

// // }
// import 'package:flutter/material.dart';

// class CustomTextFeild extends StatelessWidget {
//    CustomTextFeild({super.key,  required  this.controller,
//     required  this.type,
//    this.validate, required  this.label, this.prefix,  this.suffix, this.suffixPressed, required this.isPassword, required this.onSubmit,
//   });
// TextEditingController controller;
// TextInputType type;
//  String? Function(String?)? validate;
//   String label;
//    IconData? prefix;
//     IconData? suffix;
//      Null Function()? suffixPressed;
//       bool isPassword;
//      Null Function(dynamic value) onSubmit;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: TextFormField(
//         controller: controller,
//         keyboardType: type,
//         validator: validate,
//      textAlign: TextAlign.start,
//         onFieldSubmitted: onSubmit,
//       decoration: InputDecoration(
//          border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(8),
//           borderSide: BorderSide(color: Color(0xff969AA0),
//           ),
//          ),
//         labelText: label,
        
//         alignLabelWithHint: true,
//         labelStyle: TextStyle(
//           color: Color(0xff969AA0),
//           fontWeight: FontWeight.w400,
//           fontSize: 16,
//           fontFamily: "Cairo",
          
//         ),
//           floatingLabelAlignment: FloatingLabelAlignment.start,
//         prefixIcon: prefix != null ? Icon(prefix) : null,
//         suffixIcon: suffix != null
//             ? IconButton(
//                 icon: Icon(suffix),
//                 onPressed: () {
//                   // Handle suffix button press
//                 },
//               )
//             : null,
//       ),
//         // Add other TextFormField properties as needed
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// class CustomTextFeild extends StatefulWidget {
//   final TextEditingController controller;
//   final TextInputType type;
//   final String? Function(String?)? validate;
//   final String label;
//   final IconData? prefix;
//   final IconData? suffix;
//   final VoidCallback? suffixPressed;
//   final bool isPassword;
//   final ValueChanged<String> onSubmit;

//   CustomTextFeild({
//     Key? key,
//     required this.controller,
//     required this.type,
//     this.validate,
//     required this.label,
//     this.prefix,
//     this.suffix,
//     this.suffixPressed,
//     required this.isPassword,
//     required this.onSubmit,
//   }) : super(key: key);

//   @override
//   _CustomTextFeildState createState() => _CustomTextFeildState();
// }

// class _CustomTextFeildState extends State<CustomTextFeild> {
//   bool _isPasswordVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: TextFormField(
//         controller: widget.controller,
//         keyboardType: widget.type,
//         obscureText: widget.isPassword && !_isPasswordVisible,
//         validator: widget.validate,
//         textAlign: TextAlign.start,
//         onFieldSubmitted: widget.onSubmit,
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//             borderSide: BorderSide(color: Color(0xff969AA0)),
//           ),
//           labelText: widget.label,
//           alignLabelWithHint: true,
//           labelStyle: TextStyle(
//             color: Color(0xff969AA0),
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontFamily: "Cairo",
//           ),
//           floatingLabelAlignment: FloatingLabelAlignment.start,
//           prefixIcon: widget.prefix != null ? Icon(widget.prefix) : null,
//           suffixIcon: widget.isPassword
//               ? IconButton(
//                   icon: Icon(
//                     _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
//                     color: Color(0xff969AA0),
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isPasswordVisible = !_isPasswordVisible;
//                     });
//                     if (widget.suffixPressed != null) {
//                       widget.suffixPressed!();
//                     }
//                   },
//                 )
//               : null,
//         ),
//         // Add other TextFormField properties as needed
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({
    super.key,
    required this.controller,
    required this.type,
    this.validate,
    required this.label,
    this.prefix,
    this.suffix,
    this.suffixPressed,
    required this.isPassword,
    required this.onSubmit,
    this.isPasswordField = false,
    
  });

  final TextEditingController controller;
  final TextInputType type;
  final String? Function(String?)? validate;
  final String label;
  final IconData? prefix;
  final IconData? suffix;
  final VoidCallback? suffixPressed;
  final bool isPassword;
  final void Function(String) onSubmit;
  final bool isPasswordField;
     late final Color textColor;

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
        obscureText: isPasswordField ? isPassword : false,
         style: TextStyle(color: textColor= Theme.of(context).colorScheme.primary,),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Color(0xff969AA0),
            ),
          ),
          labelText: label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(
            color:
            Theme.of(context).colorScheme.primary,
            //  Color(0xff969AA0),
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Cairo",
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          prefixIcon: prefix != null ? Icon(prefix) : null,
          suffixIcon: isPasswordField && suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                )
              : null,
        ),
      ),
    );
  }
}
