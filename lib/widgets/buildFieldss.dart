import 'package:flutter/material.dart';
import 'package:flutter_jobs_app/contents.dart';

class buildFields extends StatelessWidget {
  const buildFields({
    super.key,
    required List<TextEditingController> controllers,
    required List<FocusNode> focusNodes,
  })  : _controllers = controllers,
        _focusNodes = focusNodes;

  final List<TextEditingController> _controllers;
  final List<FocusNode> _focusNodes;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(6, (index) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "هذا الحقل مطلوب ";
                } else {
                  return null;
                }
              },
              controller: _controllers[index],
              focusNode: _focusNodes[index],
              onChanged: (value) {
                if (value.length == 1 && index != 5) {
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                }
              },
              showCursor: false,
              enableInteractiveSelection: false,
              keyboardType: TextInputType.number,
              cursorColor: kMainColor,
              style: TextStyle(
                color: kMainColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              decoration: const InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 2.0,
                      color: kMainColor,
                    )),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: kMainColor,
                    )),
              ),
            ),
          ),
        );
      }),
    );
  }
}
