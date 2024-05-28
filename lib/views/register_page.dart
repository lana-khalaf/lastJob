import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/rigester_model.dart';
import 'package:flutter_jobs_app/blocs/register_bloc.dart';
import 'package:flutter_jobs_app/config.dart';
import 'package:flutter_jobs_app/screens/check_screen.dart';
import 'package:flutter_jobs_app/views/profile.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
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
                                  child: Text("English"), value: "English"),
                              DropdownMenuItem(
                                  child: Text("Arabic"), value: "Arabic"),
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
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    " انشاء حساب جديد",
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
                    " ....مرحباً بكم في",
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
                  type: TextInputType.visiblePassword,
                  onSubmit: (value) {},
                  isPassword: true,
                  suffixPressed: () {},
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "userline";
                    }
                  },
                  label: " الاسم الاول",
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
                  label: " الاسم الثاني",
                  prefix: Icons.person_outline,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomTextFeild(
                  controller: emailController,
                  type: TextInputType.visiblePassword,
                  onSubmit: (value) {},
                  isPassword: true,
                  suffixPressed: () {},
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "userline";
                    }
                  },
                  label: "الايميل",
                  prefix: Icons.person_outline,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomTextFeild(
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  //  suffix: LoginCubit.get(context).suffix,
                  onSubmit: (value) {},
                  isPassword: false,
                  //  suffixPressed: (){
                  //    LoginCubit.get(context).changePasswordVisibility();
                  //  },
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "passwordline";
                    }
                  },
                  label: "كلمة المرور ",

                  prefix: Icons.remove_red_eye,
                ),
                SizedBox(
                  height: 24,
                ),
                CustomTextFeild(
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  //  suffix: LoginCubit.get(context).suffix,
                  onSubmit: (value) {},
                  isPassword: false,
                  //  suffixPressed: (){
                  //    LoginCubit.get(context).changePasswordVisibility();
                  //  },
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "passwordline";
                    }
                  },
                  label: " تاكيد كلمة المرور",

                  prefix: Icons.remove_red_eye,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 3, top: 11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomText(
                          family: "Cairo",
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
                          size: 12,
                          text: "أوافق على الشروط والأحكام وسياسة الخصوصية",
                          weight: FontWeight.w400),
                      Checkbox(
                        side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                        value: isChecked,

                        checkColor:
                            Colors.blue, // تحديد لون العلامة (صح) داخل المربع
                        activeColor: Theme.of(context)
                            .colorScheme
                            .secondaryContainer, // تحديد لون المربع عندما يكون محددًا
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
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
                          content: Text(state.errorMessage),
                        ));
                      } else {
                        print("else");
                      }
                    },
                    child: CustomButton(
                      text: " انشاء حساب جديد",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " تسجيل الدخول",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                      ),
                    ),
                    Text(
                      "لديك حساب بالفعل ؟",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xff969AA0),
                        fontFamily: "Cairo",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
