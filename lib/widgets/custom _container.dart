import 'package:flutter/material.dart';

class customContainer extends StatelessWidget {
  const customContainer({
    Key? key,
    required this.str,
  }) : super(key: key);
  final String str;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 6,
        horizontal: 8,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 230, 242, 1),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Text(
            str,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Icon(
            Icons.close,
            color: Colors.indigo,
            weight: 30,
            size: 20,
          )
        ],
      ),
    );
  }
}
