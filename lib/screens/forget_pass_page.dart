// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_jobs_app/blocs/forget_bloc/forget_password_bloc.dart';
import 'package:flutter_jobs_app/screens/check_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgetPassPage extends StatefulWidget {
  ForgetPassPage({super.key});
  final String id = 'ForgetPassPage';
  @override
  State<ForgetPassPage> createState() => _ForgetPassPageState();
}

class _ForgetPassPageState extends State<ForgetPassPage> {
  final TextEditingController emailController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: Theme.of(context).brightness == Brightness.light
          //         ? AssetImage('assets/images/light.bg.png')
          //         : AssetImage('assets/images/dark_bg.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, top: 19),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Center(
                  child: Text(
                    "نسيت كلمة المرور",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32, // غيرت
                      color: Theme.of(context).colorScheme.secondary,
                      fontFamily: "Cairo",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 32, left: 40),
                child: Text(
                  "قم بادخال رقم الهاتف الذي قمت بالتسجيل به حتى\n      نتمكن من استعادة كلمة المرور الخاصه بك",
                  style: TextStyle(
                      color: Color(0xff969AA0),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 20, left: 20),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required Field";
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                          .hasMatch(value)) {
                        return "Enter correct email";
                      } else {
                        return null;
                      }
                    },
                    onFieldSubmitted: (value) {
                      emailController.text = value;
                    },
                    controller: emailController,
                    cursorColor: Color.fromRGBO(53, 104, 153, 1),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                      filled: false,
                      // fillColor: kMainColor,
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        size: 28,
                        color: Color(0xff969AA0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6),
                          borderSide: BorderSide(
                            color: Color(0xff969AA0),
                          )),
                      hintText: 'ادخل الايميل',
                      hintStyle: TextStyle(color: Color(0xff969AA0)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 12, bottom: 4, left: 19, right: 19),
                child: CustomButton(
                    emailController: emailController, formkey: formkey),
              ),
              BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                listener: (context, state) async {
                  if (state is CorrectEmail) {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString('vcode', state.vCode);
                    prefs.setString('email', emailController.text);
                    Navigator.of(context).pushReplacementNamed(
                      CheckScreen.id,
                    );
                  } else if (state is WrongEmail) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Your email is Wrong')));
                  }
                },
                builder: (context, state) {
                  if (state is LoaderState) {
                    return CircularProgressIndicator();
                  } else {
                    return Container();
                    // return Padding(
                    //   padding: const EdgeInsets.only(
                    //       top: 12, bottom: 4, left: 19, right: 19),
                    //   child: CustomButton(
                    //       emailController: emailController, formkey: formkey),
                    // );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.emailController,
    required this.formkey,
  }) : super(key: key);

  final TextEditingController emailController;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (formkey.currentState!.validate()) {
          BlocProvider.of<ForgetPasswordBloc>(context)
              .add(RestorePasswordEvent(email: emailController.text));
          print('====================Add Event');
        }
      },
      child: Container(
        width: 400,
        height: 48,
        decoration: BoxDecoration(
            color: Color(0xff151E48), borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            "استعادة كلمة المرور",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
