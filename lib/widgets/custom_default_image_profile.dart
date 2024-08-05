import 'package:flutter/material.dart';

class defaultImageContainer extends StatelessWidget {
  const defaultImageContainer(BuildContext context, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
    width: 150, // قطر الدائرة
    height: 150, // قطر الدائرة
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Theme.of(context).colorScheme.onErrorContainer, // لون حد الدائرة
        width: 1, // سمك حدود الدائرة
      ),
      image: DecorationImage(
        image: AssetImage("assets/images/Default_pfp.jpg"),
        fit: BoxFit.fill,
      ),
    ),
  );
  }
}