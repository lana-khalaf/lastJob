import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/bloc/log_out_bloc.dart';
import 'package:flutter_jobs_app/service/logout.dart';
import 'package:flutter_jobs_app/views/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogOutBloc(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          drawer: Drawer(
            backgroundColor: const Color(0xffffffff),
            child: SizedBox(
              width: 400, // تحديد عرض القائمة الجانبية
              child: Column(
                children: [
                  Container(
                    height: 250,
                    padding: const EdgeInsets.only(top: 25),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 52,
                              child: Image.asset(
                                  "assets/images/photo_٢٠٢٢-٠٥-٢٠_١١-٢٤-٠٩ 1.png")),
                          Padding(
                            padding: const EdgeInsets.only(top: 12, bottom: 4),
                            child: Text(
                              "Hussam Zina",
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onTertiary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "UX Designer ",
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                                Image.asset("assets/images/Vector (10).png"),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "View Profile",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Group 187.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Personal Info ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Vector (11).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Applications ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Group (1).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Proposals ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Group 186.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Resumes ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Group 188.png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Protofolio ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Vector (12).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Cover Letters ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 17),
                          child: Image.asset("assets/images/Vector (13).png"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          " Settings ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BlocListener<LogOutBloc, LogOutState>(
                    listener: (context, state) {
                      if (state is LogOutInitial) {
                        print("initiall");
                      } else if (state is Success) {
                        print("successl");
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      } else if (state is Loading) {
                        print("loading");
                      } else if (state is Error) {
                        print("Error");
                      } else {
                        print("else");
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        context.read<LogOutBloc>().add(LogoutEvent());
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 17),
                            child: Image.asset("assets/images/Group 191.png"),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            " Logout ",
                            style: TextStyle(
                              color: Color(0xffE30000),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 56),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 193,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Theme.of(context).colorScheme.primaryContainer,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/Vector (15).png"),
                            Text(
                              "   Go Premium ",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
