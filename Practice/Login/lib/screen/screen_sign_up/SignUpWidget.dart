import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../screen_login/LoginWidget.dart';

class SignUpWidget extends StatefulWidget {
  const SignUpWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SignUpWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/image/back_ground.jpg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child: Container(
              width: widget.screenWidth * 0.9,
              height: widget.screenHeight * 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('lib/image/img.png'),
                  SizedBox(height: widget.screenHeight * 0.02),

                  // Text sign up
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: widget.screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.02),

                  // First name and last name
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //First name
                      Container(
                        width: widget.screenWidth * 0.4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'First Name',
                                  style: TextStyle(
                                    fontSize: widget.screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              Container(
                                width: (widget.screenWidth -
                                        widget.screenWidth * 0.08) /
                                    2,
                                height: widget.screenHeight * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff245501),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: 'Input first name',
                                    hintStyle: TextStyle(
                                      fontSize: widget.screenWidth * 0.04,
                                    ),
                                    //border: Colors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      ),

                      //Last name
                      Container(
                        width: widget.screenWidth * 0.4,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Last Name',
                                  style: TextStyle(
                                    fontSize: widget.screenWidth * 0.035,
                                  ),
                                ),
                              ),
                              Container(
                                width: (widget.screenWidth -
                                        widget.screenWidth * 0.08) /
                                    2,
                                height: widget.screenHeight * 0.07,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0xff245501),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    hintText: 'Input last name',
                                    hintStyle: TextStyle(
                                      fontSize: widget.screenWidth * 0.04,
                                    ),
                                    //border: Colors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                      )
                    ],
                  ),
                  SizedBox(
                    height: widget.screenHeight * 0.02,
                  ),

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
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff245501),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Input your email address',
                        hintStyle: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                        ),
                        //border: Colors.black,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.02),

                  //Text pass
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.035,
                      ),
                    ),
                  ),

                  //Text field input pass
                  Container(
                    alignment: Alignment.centerLeft,
                    width: widget.screenWidth - widget.screenWidth * 0.08,
                    height: widget.screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      obscureText: !_isPasswordVisible,
                      // Toggle password visibility
                      decoration: InputDecoration(
                        hintText: 'Input your password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff245501),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintStyle: TextStyle(
                          fontSize: widget.screenWidth * 0.04,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.02),

                  //Button sign up
                  SizedBox(
                    width: widget.screenWidth - widget.screenWidth * 0.08,
                    height: widget.screenHeight * 0.08,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
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

                  // Back to login screen
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginWidget(
                                  screenWidth: widget.screenWidth,
                                  screenHeight: widget.screenHeight)));
                    },
                    child: Text(
                      'Already have an account?',
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
