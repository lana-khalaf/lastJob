// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_jobs_app/contents.dart';

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({
    Key? key,
    required this.icon,
    required this.function,
  }) : super(key: key);
  final IconData icon;
  final void Function()? function;

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.0,
      height: 64.0,
      decoration: BoxDecoration(
        color: blue,
        shape: BoxShape.circle,
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: Icon(
          widget.icon,
          color: kMainColor,
          size: 40,
          weight: 20,
        ),
        onPressed: widget.function,
      ),
    );
  }
}
