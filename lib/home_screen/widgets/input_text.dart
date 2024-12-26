import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class InputText extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  const InputText(
      {required this.hintText, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      enabled: false,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: MyTheme.whiteClr, width: 0),
        ),
      ),
    );
  }
}
