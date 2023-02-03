import 'package:flutter/material.dart';
import '../style/used_colors.dart';
import '../style/used_images.dart';

class First_Page extends StatelessWidget {
  const First_Page({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(children: [
        Container(
          width: double.infinity,
          child: Image.asset(
            opacity: const AlwaysStoppedAnimation(0.4),
            first_back,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Image.asset('assets/images/logo.png')
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'YOUR ONE STOP SOLUTION TO',
                      style: TextStyle(color: White),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        'Rent Pre-Production Equipments Easily',
                        style: TextStyle(color: White),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login_page');
                          },
                          style: ElevatedButton.styleFrom(primary: Red),
                          child: const Text(
                            'Get Started',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'montserrat',
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
