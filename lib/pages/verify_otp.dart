import 'package:flutter/material.dart';
import 'package:yuktidea_assignment/controller/otp_controller.dart';
import 'package:yuktidea_assignment/style/alert_box.dart';
import '../style/used_colors.dart';
import '../style/input_style.dart';
import 'dart:async';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../models/api_model.dart';

class VerifyOtpPage extends StatefulWidget {
  // LoginPage({Key? key}) : super(key: key);
  static const routeName = 'verifyOtp_page';
  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late Timer _timer;
  var start = 10;
  // void tim=startTimer();
  @override
  void initState() {
    // TODO: implement initState
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Verify Your Number',
                    style: TextStyle(
                        color: White,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enter the OTP received on your number',
                    style: TextStyle(color: White, fontSize: 18),
                  ),
                )
              ],
            ),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 350,
                  child: PinCodeTextField(
                    controller: signup_otp,
                    textStyle: TextStyle(color: White),
                    appContext: context,
                    pastedTextStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    length: 4,
                    obscureText: false,
                    obscuringCharacter: '*',
                    obscuringWidget: null,
                    blinkWhenObscuring: true,
                    animationType: AnimationType.fade,
                    enablePinAutofill: true,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12),
                        fieldHeight: 80,
                        fieldWidth: 80,
                        borderWidth: 1,
                        activeFillColor: Black,
                        inactiveColor: Black,
                        inactiveFillColor: Black,
                        errorBorderColor: Black,
                        activeColor: Black,
                        selectedColor: Black,
                        selectedFillColor: Black),
                    cursorColor: White,
                    animationDuration: Duration(milliseconds: 300),
                    enableActiveFill: true,
                    keyboardType: TextInputType.number,
                    boxShadows: [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Grey,
                        blurRadius: 2,
                      )
                    ],
                    // controller: user_otp,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                    },
                    beforeTextPaste: (text) {
                      print("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  ),
                ),
                start != 0
                    ? Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Resend OTP in',
                              style: TextStyle(color: OrgGrey),
                            ),
                            Text(
                              '$start seconds',
                              style: TextStyle(color: Red),
                            ),
                          ],
                        ),
                      )
                    : TextButton(
                        onPressed: () {
                          setState(() {
                            start = 10;
                            startTimer();
                          });
                        },
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(color: Red),
                        ),
                      ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: SizedBox(
                    height: 50,
                    width: 250,
                    child: ElevatedButton(
                      onPressed: () async {
                        dynamic result = await verify_otp();
                        if (result == true) {
                          Navigator.pushNamed(context, 'home_page');
                        } else {
                          showMyDialog(context, "Wrong OTP/nPlease try again ");
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: Red),
                      child:
                          const Text('Verify', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }
}
