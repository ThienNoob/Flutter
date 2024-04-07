import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/screen/screen_forgot_password/ForgotPasswordScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screen_sign_up/SignUpWidget.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final errorEmail = 'Invalid email address';
  final errorPassword = 'Invalid password';
  bool emailInvalid = false;
  bool passwordInvalid = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

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
                      // Textfield input email address
                      controller: _emailController,
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.03,
                      ),
                      decoration: InputDecoration(
                        errorText: emailInvalid ? errorEmail : null,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff245501),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Input your email address',
                        hintStyle: TextStyle(
                          fontSize: widget.screenWidth * 0.03,
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
                      controller: _passwordController,
                      obscureText: !_isPasswordVisible,
                      style: TextStyle(
                        fontSize: widget.screenWidth * 0.03,
                      ),
                      // Toggle password visibility
                      decoration: InputDecoration(
                        errorText: passwordInvalid ? errorPassword : null,
                        hintText: 'Input your password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xff245501),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintStyle: TextStyle(
                          fontSize: widget.screenWidth * 0.03,
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
                                value: _isRememberMe,
                                // Thay đổi giá trị của Checkbox
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
                      GestureDetector(
                        onTap: () {
                          onTapForgotPassword();
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: widget.screenWidth * 0.035,
                          ),
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
                        onPressedLoginButton();
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpWidget(
                                  screenWidth: widget.screenWidth,
                                  screenHeight: widget.screenHeight)));
                    },
                    child: Text(
                      'No account yet? Sign Up',
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

  void onTapForgotPassword() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ForgotPasswordScreen(
                screenWidth: widget.screenWidth,
                screenHeight: widget.screenHeight)));
  }

  void onPressedLoginButton() {
    setState(() {
      emailInvalid = !isValidEmail(_emailController.text) ? true : false;
      passwordInvalid =
          !isValidPassword(_passwordController.text) ? true : false;
      if (!emailInvalid && !passwordInvalid) {
        logIn();
      }
      ;
    });
  }

  bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email ?? '');
  }

  bool isValidPassword(String password) {
    // Kiểm tra xem password có null không và có ít nhất 8 ký tự không
    return password != null && password.length >= 8;
  }

  void logIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("///////////////////");
    print('Email: ${_emailController.text}');
    print('Password: ${_passwordController.text}');
    if (_emailController.text == 'chucthien2@gmail.com' &&
        _passwordController.text == '12345678') {
      print('Login success');
      if(_isRememberMe){
        await prefs.setString('email', _emailController.text);
        await prefs.setString('password', _passwordController.text);
        print('Save email and password');
      }
    } else {
      print('Login failed');
    }
  }


  //Lấy thông tin đăng nhập từ SharedPreferences
  _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _isRememberMe = _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;
    });
  }
}
