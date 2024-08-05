import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/rigester_model.dart';
import 'package:flutter_jobs_app/blocs/register_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/screens/check_screen.dart';
import 'package:flutter_jobs_app/views/login_page.dart';
import 'package:flutter_jobs_app/views/profile_auth.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:flutter_jobs_app/widgets/custom_textField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'RegisterScreen';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  bool isChecked = false;
  String selectedValue = "English";
  bool isPasswordVisible =false;
  bool isConfirmPasswordVisible = false ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Theme.of(context).brightness == Brightness.light
                    ? AssetImage('assets/images/light.bg.png')
                    : AssetImage('assets/images/dark_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 16,left: 16,top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              
                     Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .secondaryContainer, // لون الحدود
                          width: 2, // عرض الحدود
                        ),
                      ),
                      width: 136,
                      height: 44,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // selectedValue == "English" ? Image.asset("assets/images/Group.png") : Image.asset("aassets/images/Group.png"),
                            Image.asset("assets/images/Group.png"),
                            DropdownButton(
                              dropdownColor: Theme.of(context)
                                  .colorScheme
                                  .onPrimary, //بدها تعديل
                              items: [
                                DropdownMenuItem(
                                    child: Text("English".tr(), 
                                    style: TextStyle(
                      // غيرت
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                      ),), value: "English",onTap: 
                                            (){              context.setLocale(Locale('en'));},),
                                DropdownMenuItem(
                                    child: Text("Arabic".tr() ,
                                      style: TextStyle(
                      // غيرت
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                      ),), value: "Arabic",onTap: (){  context.setLocale(Locale('ar'));},),
                              ],
                              underline: Container(),
                              onChanged: (newValue) {
                                // تعيين onChanged
                                setState(() {
                                  // يُستخدم setState لتحديث الواجهة في Flutter
                                  selectedValue = newValue
                                      .toString(); // تعيين القيمة المحددة إلى المتغير selectedValue
                                });
                              },
                              value: selectedValue, // تعيين القيمة المحددة
                            ),
                          ],
                        ),
                      ),
                    ),
                
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      "Create New Account".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 36, // غيرت
                        color: Theme.of(context).colorScheme.secondary,
                        fontFamily: "Cairo",
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Hello".tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontFamily: "Cairo",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  CustomTextFeild(
                    controller: firstNameController,
                    type: TextInputType.text,
                    onSubmit: (value) {},
                    isPassword: true,
                    suffixPressed: () {},
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "userline";
                      }
                    },
                    label: "First name".tr(),
                    prefix: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  CustomTextFeild(
                    controller: lastNameController,
                    type: TextInputType.visiblePassword,
                    onSubmit: (value) {},
                    isPassword: true,
                    suffixPressed: () {},
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "userline";
                      }
                    },
                    label: "Last name".tr(),
                    prefix: Icons.person_outline,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                   CustomTextFeild(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    onSubmit: (value) {},
                    isPassword: false,
                    suffixPressed: () {},
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "userline";
                      }
                    },
                    
                    label: "Email".tr(),
                    prefix: Icons.email_sharp,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                 
              //                 CustomTextFeild(
              //   controller: passwordController,
              //   type: TextInputType.visiblePassword,
              //   label: "Password".tr(),
              //   isPassword: true,
              //   prefix: Icons.lock,
              //   validate: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return "passwordline";
              //     }
              //   },
              //   onSubmit: (value) {},
              // ),
                 CustomTextFeild(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    label: "Password".tr(),
                    isPassword: !isPasswordVisible,
                    isPasswordField: true,
                    prefix: Icons.lock,
                    suffix: isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "passwordline";
                      }
                    },
                    onSubmit: (value) {},
                  ),
                  SizedBox(
                    height: 24,
                  ),
                 
                      CustomTextFeild(
                    controller: confirmPasswordController,
                    type: TextInputType.visiblePassword,
                    label: "Confirm password".tr(),
                    isPassword: !isConfirmPasswordVisible,
                    isPasswordField: true,
                    prefix: Icons.lock,
                    suffix: isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    suffixPressed: () {
                      setState(() {
                        isConfirmPasswordVisible = !isConfirmPasswordVisible;
                      });
                    },
                    validate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "passwordline";
                      }
                    },
                    onSubmit: (value) {},
                  ),
           
              SizedBox(height: 30,),
                  Center(
                    child: BlocListener<RegisterBloc, RegisterState>(
                      listener: (context, state) {
                        if (state is RegisterInitial) {
                          print("initial page");
                        } else if (state is Success) {
                          print("success page");
              
                          Navigator.of(context)
                              .pushReplacementNamed(CheckScreen.id);
                        } else if (state is Loading) {
                          print("loading");
                        } else if (state is Error) {
                          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                             backgroundColor:Theme.of(context).colorScheme.primary ,
                            content: Text("an  error occurred".tr(), style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontFamily: "Cairo",
                            ),),
                          ));
                        } else {
                           ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            backgroundColor:Theme.of(context).colorScheme.primary ,
                            content: Text("an  error occurred".tr(), style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontFamily: "Cairo",
                            ),),
                          ));
                          print("else");
                        }
                      },
                      child: CustomButton(
                        text: "LOGIN".tr(),
                        colorText: Theme.of(context).colorScheme.onSecondary,
                        press: () {
                          context.read<RegisterBloc>().add(Register(
                              usermodel: RegisterModel(
                                  FirstName: firstNameController.text,
                                  LastName: lastNameController.text,
                                  Email: emailController.text,
                                  Password: passwordController.text,
                                  ConfirmPassword:
                                      confirmPasswordController.text)));
                        },
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "already".tr(),
                       
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xff969AA0),
                          fontFamily: "Cairo",
                        ),
                      ),
                      InkWell(
                        onTap: (){ Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return LoginPage();
                                    }));},
                        child: Text(
                           "LOGIN".tr(),
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.primary,
                            fontFamily: "Cairo",
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
