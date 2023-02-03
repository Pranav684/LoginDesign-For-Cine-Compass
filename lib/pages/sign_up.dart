import 'package:flutter/material.dart';
import '../style/used_colors.dart';
import '../style/input_style.dart';
import '../models/api_model.dart';
import '../controller/signup_controllers.dart';
import '../style/alert_box.dart';

class SignupPage extends StatefulWidget {
  // LoginPage({Key? key}) : super(key: key);
  static const routeName = 'signup_page';
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var hidePass = true;
  var hideCnfmPass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Grey,
      body: Center(
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                          color: White,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Fill in the form to continue',
                      style: TextStyle(color: White, fontSize: 18),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputText('Name', signup_name),
                  InputText('Email', signup_email),
                  InputText('Phone Number', signup_phone),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: signup_pass,
                        obscureText: hidePass,
                        style: TextStyle(color: OrgGrey),
                        decoration: InputDecoration(
                          // label: Text('Password'),
                          // suffixStyle: TextStyle(color: OrgGrey),
                          suffixIconColor: OrgGrey,
                          suffixIcon: IconButton(
                              color: OrgGrey,
                              onPressed: () {
                                setState(() {
                                  hidePass = !hidePass;
                                });
                              },
                              icon: hidePass
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          hintStyle: TextStyle(color: White),
                          hintText: 'Password',
                          labelText: "Password",
                          labelStyle: TextStyle(color: OrgGrey),
                          filled: true,
                          fillColor: Black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SizedBox(
                      width: 300,
                      child: TextFormField(
                        controller: signup_cnfm_pass,
                        obscureText: hideCnfmPass,
                        style: TextStyle(color: OrgGrey),
                        decoration: InputDecoration(
                          // label: Text('Password'),
                          // suffixStyle: TextStyle(color: OrgGrey),
                          suffixIconColor: OrgGrey,
                          suffixIcon: IconButton(
                              color: OrgGrey,
                              onPressed: () {
                                setState(() {
                                  hideCnfmPass = !hideCnfmPass;
                                });
                              },
                              icon: hideCnfmPass
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility)),
                          hintStyle: TextStyle(color: White),
                          hintText: 'Confirm Password',
                          labelText: "Confirm Password",
                          labelStyle: TextStyle(color: OrgGrey),
                          filled: true,
                          fillColor: Black,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Black,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: SizedBox(
                      height: 50,
                      width: 250,
                      child: ElevatedButton(
                        onPressed: () async {
                          dynamic result = await register_user();
                          if (result == true) {
                            Navigator.pushNamed(context, 'verifyOtp_page');
                          } else if (result == false) {
                            showMyDialog(
                              context,
                              signup_msg.toString(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Red),
                        child: const Text(
                          'Signup',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'Already have an account ?',
                          style: TextStyle(color: OrgGrey, fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'login_page');
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(color: Red, fontSize: 15),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
