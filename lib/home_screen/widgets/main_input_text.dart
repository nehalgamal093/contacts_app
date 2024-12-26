import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';

class MainInputText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType type;
  const MainInputText(
      {required this.hintText,
      required this.type,
      required this.controller,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      controller: controller,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: MyTheme.secondaryColor,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        hintStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
