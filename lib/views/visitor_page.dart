import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/service/login.dart';
import 'package:flutter_jobs_app/views/login_page.dart';
import 'package:flutter_jobs_app/views/register_page.dart';

class VisitorPage extends StatelessWidget {
  const VisitorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ملف الزائر'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'مرحبًا، زائر!',
              
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
               Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return LoginPage();
                                  }));
              },
              child: Text('تسجيل الدخول'),
            ),
          ],
        ),
      ),
    );
  }
}
