
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_state.dart';
import 'package:flutter_jobs_app/views/profile_auth.dart';
import 'package:flutter_jobs_app/views/visitor_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String id = 'ProfilePage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: state is Authenticated ? ProfileAuth() : VisitorPage(),
          );
        },
      ),
    );
  }
}


