import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/Model/login_model.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_event.dart';
import 'package:flutter_jobs_app/blocs/login_bloc.dart';
import 'package:flutter_jobs_app/views/profile_auth.dart';
import 'package:flutter_jobs_app/views/register_page.dart';
import 'package:flutter_jobs_app/widgets/custom%20text.dart';
import 'package:flutter_jobs_app/widgets/custom_buttom.dart';
import 'package:flutter_jobs_app/widgets/custom_textField.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});
  static String id = 'login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
bool isPasswordVisible =false;
  bool isConfirmPasswordVisible = false ;
  String selectedValue = "English";
  late bool isDarkMode;

  // تعيين القيمة الافتراضية
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
            BlocProvider(
          create: (context) => LoginBloc(),
    
        ),
            BlocProvider(
                create: (context) => AuthBloc(),
            ),
        ],
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
                  padding: const EdgeInsets.only(left: 16, right: 16,top:15),
                  child: Column(
                                        children:[Row(
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
                                            child: Text("English".tr(),  style: TextStyle(
                      // غيرت
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: "Cairo",
                      ),), value: "English",onTap: 
                                            (){              context.setLocale(Locale('en'));},),
                                        DropdownMenuItem(
                                            child: Text("Arabic".tr(),  style: TextStyle(
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
                    
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          "LOGIN".tr(),
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
                        label: "email".tr(),
                        prefix: Icons.email_sharp,
                        isPassword: false,
                        onSubmit: (value) {},
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      // CustomTextFeild(
                      //   controller: passwordController,
                      //   type: TextInputType.visiblePassword,
                      
                      //   //  suffix: LoginCubit.get(context).suffix,
                      //   onSubmit: (value) {},
                      //   isPassword: false,
                      //   //  suffixPressed: (){
                      //   //    LoginCubit.get(context).changePasswordVisibility();
                      //   //  },
                      //   validate: (String? value) {
                      //     if (value == null || value.isEmpty) {
                      //       return "passwordline";
                      //     }
                      //   },
                      //   label: "password".tr(),
                      
                      //   prefix: Icons.remove_red_eye,
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
                  SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "forget password ?".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.primary,
                              fontFamily: "Cairo",
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 12, bottom: 4, 
                            // left: 16, right: 16
                            ),
                        child: BlocListener<LoginBloc, LoginState>(
                          listener: (context, state) {
                          if(state is LoginInitial){
                        print("initiall");
                       
                      }
                      else if(state is Success){
                        print("successl");
                          context.read<AuthBloc>().add(LoginAuth());
                          
                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return  ProfileAuth();
                                }        
                                
                                ));
                      }
                      else if(state is Loading){
                        print("loading");
                      }
                      else if (state is Error){

                        print("Error");
                          ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                             backgroundColor:Theme.of(context).colorScheme.primary ,
                            content: Text("an  error occurred".tr(), style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Theme.of(context).colorScheme.onBackground,
                              fontFamily: "Cairo",
                            ),),
                          ));
                         
                      }
                      else{
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
                      }  },
                          child: CustomButton(
                            text: "LOGIN".tr(),
                            colorText: Theme.of(context).colorScheme.onSecondary,
                            press: () {
                               print("Email: //${emailController.text}");
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
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "dont".tr(),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xff969AA0),
                              fontFamily: "Cairo",
                            ),
                          ),
                          InkWell(
                            onTap: (){
                        Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return RegisterPage();
                                    }));
                                    },
                            child: Text(
                              "Create".tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Theme.of(context).colorScheme.primary,
                                fontFamily: "Cairo",
                              ),
                            ),
                          ),
                        ],
                      ),] 
                  
                        ),
                ),
              
             
                ),
              
            );
          }),
    );
  }
}
