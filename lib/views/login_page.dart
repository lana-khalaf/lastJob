import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/login_model.dart';
import 'package:flutter_jobs_app/blocs/login_bloc.dart';
import 'package:flutter_jobs_app/views/profile.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:flutter_jobs_app/widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  String selectedValue = "English";
  late bool isDarkMode;

  // تعيين القيمة الافتراضية
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
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
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      //    Switch(
                      //   value:  isDarkMode =Theme.of(context).brightness == Brightness.light ? false :true ,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       isDarkMode = value; // تغيير حالة الثيم
                      //     });
                      //   },
                      // ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 36, // غيرت
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    " ....مرحباً بعودتكم الى ",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                CustomTextFeild(
                  controller: emailController,
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "phoneline";
                    }
                  },
                  label: "  الايميل",
                  prefix: Icons.phone_outlined,
                  isPassword: false,
                  onSubmit: (value) {},
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
                  label: " كلمة السر ",

                  prefix: Icons.remove_red_eye,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 240, bottom: 34, top: 10),
                  child: Text(
                    "هل نسيت كلمة المرور؟",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 12, bottom: 4, left: 16, right: 16),
                  child: BlocListener<LoginBloc, LoginState>(
                    listener: (context, state) {
                    if(state is LoginInitial){
  print("initiall");
 
}
else if(state is Success){
  print("successl");
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
          return  Profile();
          }        
          ));
}
else if(state is Loading){
  print("loading");
}
else if (state is Error){
  print("Error");
}
else{
  print("else");
}  },
                    child: CustomButton(
                      text: "تسجيل الدخول",
                      colorText: Theme.of(context).colorScheme.onSecondary,
                      press: () {
                         print("Email: ${emailController.text}");
    print("Password: ${passwordController.text}");
                        context.read<LoginBloc>().add(Login(
                            usermodel: LoginModel(
                                email: emailController.text,
                                password: passwordController.text)
                                )
                                );
                      },
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "إنشاء حساب جديد",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                      ),
                    ),
                    Text(
                      " ليس لديك حساب ؟",
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
