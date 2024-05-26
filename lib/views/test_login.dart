// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mashrou3/Model/login_model.dart';
// import 'package:mashrou3/bloc/login_bloc.dart';
// import 'package:mashrou3/service/register.dart';
// import 'package:mashrou3/views/profile.dart';
// import 'package:mashrou3/widgets/custom%20text.dart';
// import 'package:mashrou3/widgets/custom_buttom.dart';
// import 'package:mashrou3/widgets/custom_textField.dart';

// class TestLoginPage extends StatefulWidget {
//   TestLoginPage({super.key});

//   @override
//   State<TestLoginPage> createState() => _TestLoginPageState();
// }

// class _TestLoginPageState extends State<TestLoginPage> {
//   final TextEditingController emailController = TextEditingController();
// ValueNotifier<String> temp_Token = ValueNotifier('');
//   final TextEditingController passwordController = TextEditingController();

//   String selectedValue = "English";
//   late bool isDarkMode;

//   // تعيين القيمة الافتراضية
//   @override
//   Widget build(BuildContext context) {
    
//       return Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: Theme.of(context).brightness == Brightness.light
//                   ? AssetImage('assets/images/light.bg.png')
//                   : AssetImage('assets/images/dark_bg.png'),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                           color: Theme.of(context)
//                               .colorScheme
//                               .secondaryContainer, // لون الحدود
//                           width: 2, // عرض الحدود
//                         ),
//                       ),
//                       width: 136,
//                       height: 44,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             // selectedValue == "English" ? Image.asset("assets/images/Group.png") : Image.asset("aassets/images/Group.png"),
//                             Image.asset("assets/images/Group.png"),
//                             DropdownButton(
//                               dropdownColor: Theme.of(context)
//                                   .colorScheme
//                                   .onPrimary, //بدها تعديل
//                               items: [
//                                 DropdownMenuItem(
//                                     child: Text("English"), value: "English"),
//                                 DropdownMenuItem(
//                                     child: Text("Arabic"), value: "Arabic"),
//                               ],
//                               underline: Container(),
//                               onChanged: (newValue) {
//                                 // تعيين onChanged
//                                 setState(() {
//                                   // يُستخدم setState لتحديث الواجهة في Flutter
//                                   selectedValue = newValue
//                                       .toString(); // تعيين القيمة المحددة إلى المتغير selectedValue
//                                 });
//                               },
//                               value: selectedValue, // تعيين القيمة المحددة
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     //    Switch(
//                     //   value:  isDarkMode =Theme.of(context).brightness == Brightness.light ? false :true ,
//                     //   onChanged: (value) {
//                     //     setState(() {
//                     //       isDarkMode = value; // تغيير حالة الثيم
//                     //     });
//                     //   },
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 100,
//               ),
//               Center(
//                 child: Text(
//                   "تسجيل الدخول",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 36, // غيرت
//                     color: Theme.of(context).colorScheme.primary,
//                     fontFamily: "Cairo",
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   " ....مرحباً بعودتكم الى ",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w400,
//                     fontSize: 16,
//                     color: Theme.of(context).colorScheme.onPrimary,
//                     fontFamily: "Cairo",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 70,
//               ),
//               CustomTextFeild(
//                 controller: emailController,
//                 type: TextInputType.phone,
//                 validate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "phoneline";
//                   }
//                 },
//                 label: "  الايميل",
//                 prefix: Icons.phone_outlined,
//                 isPassword: false,
//                 onSubmit: (value) {},
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               CustomTextFeild(
//                 controller: passwordController,
//                 type: TextInputType.visiblePassword,

//                 //  suffix: LoginCubit.get(context).suffix,
//                 onSubmit: (value) {},
//                 isPassword: false,
//                 //  suffixPressed: (){
//                 //    LoginCubit.get(context).changePasswordVisibility();
//                 //  },
//                 validate: (String? value) {
//                   if (value == null || value.isEmpty) {
//                     return "passwordline";
//                   }
//                 },
//                 label: " كلمة السر ",

//                 prefix: Icons.remove_red_eye,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 240, bottom: 34, top: 10),
//                 child: Text(
//                   "هل نسيت كلمة المرور؟",
//                   style: TextStyle(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                     color: Theme.of(context).colorScheme.primary,
//                     fontFamily: "Cairo",
//                   ),
//                 ),
//               ),
//                 ValueListenableBuilder(
//             valueListenable: temp_Token,
//             builder: (context, value, child) {
//               return Text(value);
//             },
//           ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                     top: 12, bottom: 4, left: 16, right: 16),
              
//                   child: CustomButton(
//                     text: "تسجيل الدخول",
//                     colorText: Theme.of(context).colorScheme.onSecondary,
//                     press: ()async {
//                        print("Email: ${emailController.text}");
//                     print("Password: ${passwordController.text}");
//                      String token = await login(LoginModel(Email:emailController.text,Password:passwordController.text));

//               temp_Token.value = token;
//                     },
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
              
              
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "إنشاء حساب جديد",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       color: Theme.of(context).colorScheme.primary,
//                       fontFamily: "Cairo",
//                     ),
//                   ),
//                   Text(
//                     " ليس لديك حساب ؟",
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                       fontSize: 16,
//                       color: Color(0xff969AA0),
//                       fontFamily: "Cairo",
//                     ),
//                   ),
//                 ],
//               ),
        
//             ],
//           ),
//         )   
//       );
    
//   }
// }
