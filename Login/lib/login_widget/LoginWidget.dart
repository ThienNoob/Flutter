import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool _isPasswordVisible = false;
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: widget.screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Please log in to continue',
                  style: TextStyle(
                    fontSize: widget.screenWidth * 0.04,
                  ),
                ),
                SizedBox(height: widget.screenHeight * 0.04),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Email Address',
                    style: TextStyle(
                      fontSize: widget.screenWidth * 0.035,
                    ),
                  ),
                ),
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
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: widget.screenWidth * 0.035,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: widget.screenWidth - widget.screenWidth * 0.08,
                  height: widget.screenHeight * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    obscureText: !_isPasswordVisible, // Toggle password visibility
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                right: widget.screenWidth * 0.02),
                            height: widget.screenHeight * 0.03,
                            width: widget.screenHeight * 0.03,
                            child: Checkbox(
                              checkColor: Colors.white,
                              activeColor: const Color(0xff245501),
                              value: _isRememberMe, // Thay đổi giá trị của Checkbox
                              onChanged: (value) {
                                setState(() {
                                  _isRememberMe = value!;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontSize: widget.screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.035,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: widget.screenHeight * 0.02),
                SizedBox(
                  width: widget.screenWidth - widget.screenWidth * 0.08,
                  height: widget.screenHeight * 0.08,
                  child: ElevatedButton(
                    onPressed: () {
                      print('Login');
                    },
                    child: Text(
                      'Log In',
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
                SizedBox(height: widget.screenHeight * 0.02),
                Text(
                  'No account yet? Sign Up',
                  style: TextStyle(
                    fontSize: widget.screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
