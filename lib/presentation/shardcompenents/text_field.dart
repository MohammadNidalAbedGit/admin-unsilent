import 'package:flutter/material.dart';

import '../resources/color_manager.dart';
import '../resources/constants_manager.dart';

class Field extends StatelessWidget {
  final String hint;
  final Color iconColor;
  final Color bgColor;
  final Icon icon;
  final TextEditingController controller;

  const Field(
      {Key? key,
        required this.hint,
        required this.iconColor,
        required this.icon, required this.controller,
        required this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color:ColorManager.whiteGrey.withOpacity(0.2)),
          fillColor: bgColor,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          prefixIcon: InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(defaultPadding * 0.75),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: icon),
          ),
        ),
      ),
    );
  }
}
