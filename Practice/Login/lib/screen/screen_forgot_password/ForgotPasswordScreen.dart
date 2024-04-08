import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/screen/screen_OTP/OTPVerification.dart';
import '../screen_login/LoginWidget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<ForgotPasswordScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: widget.screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/image/back_ground.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: widget.screenWidth * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/image/img.png'),

                  // Text Forgotten
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Forgotten your password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'There is nothing to worry about, we will send you a message to help you reset your password.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.04),


                  //Text Email address
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.035,
                      ),
                    ),
                  ),

                  //Textfield input email address
                  Container(
                    alignment: Alignment.centerLeft,
                    width: widget.screenWidth - widget.screenWidth * 0.08,
                    height: widget.screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(

                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.04,
                      ),
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff245501),
                            //width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Input your email address',
                        hintStyle: TextStyle(
                          fontSize: widget.screenWidth * 0.035,
                        ),
                        //border: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.02),

                  //Button send otp
                  SizedBox(
                    width: widget.screenWidth - widget.screenWidth * 0.08,
                    height: widget.screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                OTPVerificationScreen(
                                    screenWidth: widget.screenWidth,
                                    screenHeight: widget.screenHeight)));
                      },
                      child: Text(
                        'Send OTP',
                        style: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff245501),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
