import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_bloc.dart';
import 'package:flutter_jobs_app/blocs/auth_state.dart';
import 'package:flutter_jobs_app/views/applicationAuth_page.dart';
import 'package:flutter_jobs_app/views/community_auth.dart';
import 'package:flutter_jobs_app/views/profile_auth.dart';
import 'package:flutter_jobs_app/views/visitor_page.dart';

class ApplicationPage extends StatelessWidget {
  const ApplicationPage({super.key});
static String id = 'ApplicationPage';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider.value(
      value: BlocProvider.of<AuthBloc>(context),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Scaffold(
            body: state is Authenticated ? ApplicationsAuthPage() : VisitorPage(),
          );
        },
      ),
    );
  }
}