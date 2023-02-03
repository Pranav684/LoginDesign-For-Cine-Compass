import 'package:flutter/material.dart';
import '../controller/login_controllers.dart';
import '../controller/otp_controller.dart';
import '../controller/signup_controllers.dart';
import '../style/used_colors.dart';

Future<void> showMyDialog(
  context,
  msg,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Grey,
        title: Text(
          'Alert',
          style: TextStyle(color: White),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                msg,
                style: TextStyle(color: White),
              ),
              Text(
                'Please recheck entered data!',
                style: TextStyle(color: White),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Ok'),
            onPressed: () {
              // reset_signup_controller();
              // reset_loginin_controller();
              // reset_otp_controller();
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
