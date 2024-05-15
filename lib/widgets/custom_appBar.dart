import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.str,
    required this.color,
  }) : super(key: key);

  final String str;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (ctx) {
          return IconButton(
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: color,
                size: 50,
              ));
        }),
        Text(
          str,
          style: TextStyle(
              fontSize: 26, color: color, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'images/photo.png',
          ),
        ),
      ],
    );
  }
}
