import 'package:contacts_app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future <bool?> toast(){
  return  Fluttertoast.showToast(
      msg: "Please fill all the fields",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor:MyTheme.redClr,
      textColor: Colors.white,
      fontSize: 16.0
  );
}
