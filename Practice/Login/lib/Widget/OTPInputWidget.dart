import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screen/screen_OTP/OTPVerification.dart';

class OTPInputWidget extends StatelessWidget {
  const OTPInputWidget({
    super.key,
    required this.widget,
  });

  final OTPVerificationScreen widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: widget.screenHeight * 0.07,
      height: widget.screenHeight * 0.07,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: TextField(
          style: TextStyle(
            fontSize: widget.screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            //fontStyle: FontStyle.normal
          ),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xff245501),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(5),
            ),

            //border: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ),
    );
  }
}