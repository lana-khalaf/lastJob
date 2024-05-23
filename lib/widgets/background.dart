import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: -140,
            top: -250,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(216, 241, 254, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(216, 241, 254, 1),
                      blurRadius: 213,
                      spreadRadius: 20,
                      offset: Offset(50, 60),
                    ),
                  ]),
            ),
          ),
          Positioned(
            right: -140,
            bottom: -300,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromRGBO(216, 241, 254, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(216, 241, 254, 1),
                      blurRadius: 213,
                      spreadRadius: 20,
                      offset: Offset(50, 60),
                    ),
                  ]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration:
                BoxDecoration(color: Colors.white.withOpacity(0.7), boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color.fromRGBO(216, 241, 254, 1),
                blurStyle: BlurStyle.outer,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
