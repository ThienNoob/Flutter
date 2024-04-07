import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../Widget/OTPInputWidget.dart';
import '../screen_login/LoginWidget.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<OTPVerificationScreen> {
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

                  // Text OTP ver
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      'OTP Verification',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Enter the code we sane to your email',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: widget.screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.04),



                  //Textfield input OTP
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OTPInputWidget(widget: widget),
                      OTPInputWidget(widget: widget),
                      OTPInputWidget(widget: widget),
                      OTPInputWidget(widget: widget),
                      OTPInputWidget(widget: widget),
                      OTPInputWidget(widget: widget),

                    ],
                  ),
                  SizedBox(height: widget.screenHeight * 0.02),

                  //Button send otp
                  SizedBox(
                    width: widget.screenWidth - widget.screenWidth * 0.08,
                    height: widget.screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {},
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
                  GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      'I didn\'t receive any code. RESEND',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.035,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


