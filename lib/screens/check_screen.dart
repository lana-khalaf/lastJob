import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/forget_bloc/forget_password_bloc.dart';
import 'package:flutter_jobs_app/contents.dart';
import 'package:flutter_jobs_app/screens/change_password_screen.dart';
import 'package:flutter_jobs_app/screens/home_screen.dart';
import 'package:flutter_jobs_app/widgets/buildFieldss.dart';

class CheckScreen extends StatefulWidget {
  const CheckScreen({super.key});
  static String id = 'CheckScreen';
  @override
  State<CheckScreen> createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );
  final formkey = GlobalKey<FormState>();
  int _seconds = 59;
  Timer? _timer;
  String inputVCode = '';
  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final String vCode = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      body: Form(
        key: formkey,
        child: Stack(
          children: [
            Image.asset(
              'images/Rectangle 4307.png',
              fit: BoxFit.fill,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.arrow_forward_ios,
                              color: kMainColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "ادخل رمز التحقق ",
                        style: TextStyle(
                            color: kMainColor,
                            fontSize: 26,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 50),
                        child: Image.asset(
                          'images/Frame.png',
                        ),
                      ),
                      // Text(
                      //   "       ادخل رمز التحقق الذي وصلك على الرقم المسجل لدينا",
                      //   style: TextStyle(fontSize: 18, color: kMainColor),
                      //   textAlign: TextAlign.center,
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 5, bottom: 30),
                      //   alignment: Alignment.centerRight,
                      //   child: Text(
                      //     "01202772849 ",
                      //     style: TextStyle(color: kMainColor),
                      //   ),
                      // ),
                      buildFields(
                          controllers: _controllers, focusNodes: _focusNodes),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              if (_seconds == 0) {
                                _seconds = 59;
                                startTimer();
                              }
                            },
                            child: Text(
                              "اعادة الارسال ",
                              style: TextStyle(color: kMainColor),
                            ),
                          ),
                          Text(
                            " اعادة ارسال الرسالة بعد ${_seconds} ثانية  ",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      BlocListener<ForgetPasswordBloc, ForgetPasswordState>(
                        listener: (context, state) {
                          if (state is CorrectVCode) {
                            Navigator.of(context).pushReplacementNamed(
                              ChangePasswordScreen.id,
                            );
                          } else if (state is WrongVCode) {
                            inputVCode = '';
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Your code is Wrong')));
                          }
                        },
                        child: Container(),
                      ),
                      InkWell(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            startTimer();

                            for (var controller in _controllers) {
                              inputVCode += controller.text;
                            }

                            BlocProvider.of<ForgetPasswordBloc>(context)
                                .add(CheckVCodeEvent(vCode: inputVCode));
                            print('====================Add Event');
                          }
                        },
                        child: Container(
                          height: 60,
                          child: Center(
                            child: Text(
                              "تأكيد",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: kMainColor,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_seconds == 0) {
            timer.cancel();
          } else {
            _seconds--;
          }
        });
      },
    );
  }
}
