
import 'package:citizenapp/Utils/app_colors.dart';
import 'package:citizenapp/Utils/app_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'authentication_view_model/RegisterViewModel.dart';
import 'model/User_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*class SignUpScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterViewModel>(
      create: (_) => RegisterViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Register'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              SizedBox(height: 16),
              Consumer<RegisterViewModel>(
                builder: (context, registerViewModel, child) {
                  return ElevatedButton(
                    onPressed: registerViewModel.isLoading
                        ? null
                        : () {
                      final username = _usernameController.text.trim();
                      final email = _emailController.text.trim();
                      final password = _passwordController.text;

                      // Call the registration function
                      Provider.of<RegisterViewModel>(context, listen: false)
                          .registerUser(username, email, password);
                    },
                    child: Text('Register'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isPasswordVisible = false;
  // instance of the RegisterViewModel
  final RegisterViewModel _registerViewModel = RegisterViewModel();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return Stack(
      children: <Widget>[
        buildBackground(),
        buildForm(),
      ],
    );
  }

  Widget buildBackground() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF73AEF5),
            Color(0xFF61A4F1),
            Color(0xFF4780E0),
            Color(0xFF398AE5),
          ],
          stops: [0.1, 0.4, 0.7, 0.9],
        ),
      ),
    );
  }

  Widget buildForm() {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildTitle(),
          SizedBox(height: 30),
          buildInputField(
            label: "Name",
            prefixIcon: Icons.person,
            hintText: "Enter your Name",
            controller: _usernameController,
          ),
          SizedBox(height: 30),
          buildInputField(
            label: "Email",
            prefixIcon: Icons.email,
            hintText: "Enter your Email",
            controller: _emailController,
          ),
          SizedBox(height: 30),
          buildInputField(
            label: "Contact no",
            prefixIcon: Icons.phone_android,
            hintText: "Enter your phoneno",
            controller: _phoneController,
          ),
          SizedBox(height: 30),
          buildPasswordInputField(),
          SizedBox(height: 30),
          buildSignUpButton(),
          SizedBox(height: 1),
          buildOrDivider(),
          SizedBox(height: 20),
          buildSocialSignInText(),
          SizedBox(height: 20),
          buildSocialSignInButtons(),
          SizedBox(height: 40),
          buildSignInLink(),
        ],
      ),
    );
  }

  Widget buildTitle() {
    return Center(
      child: Text(
        "Sign Up",
        style: AppStyles.LoginPrimaryText,
      ),
    );
  }

  Widget buildInputField({
    required String label,
    required IconData prefixIcon,
    required String hintText,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: AppStyles.LoginSecondaryText),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            controller: controller,
            style: AppStyles.secondaryText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(prefixIcon, color: Colors.black87),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.black38, fontFamily: 'OpenSans'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPasswordInputField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Password", style: AppStyles.LoginSecondaryText),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4.0,
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            obscureText: !_isPasswordVisible,
            controller: _passwordController,
            style: AppStyles.secondaryText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 15.0),
              prefixIcon: Icon(Icons.lock, color: Colors.black87),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                child: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black87,
                ),
              ),
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.black38, fontFamily: 'OpenSans'),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSignUpButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            _registerViewModel.setLoading(true); // Set loading state
          });

          final email = _emailController.text;
          final password = _passwordController.text;
          final username = _usernameController.text;
          final phoneNo = _phoneController.text;

          try {
            await _registerViewModel.register(email, password, username, phoneNo);
          } finally {
            setState(() {
              _registerViewModel.setLoading(false); // Reset loading state
            });
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 5.0,
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
        child: _registerViewModel.isLoading
            ? CircularProgressIndicator( // Show loading indicator when registering
          valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF527DAA)),
        )
            : Text(
          'SIGN UP',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget buildOrDivider() {
    return Center(
      child: Text(
        '- OR -',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSocialSignInText() {
    return Center(
      child: Text(
        'Sign up with',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildSocialSignInButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Handle Facebook sign up
          },
          child: buildSocialButton('assets/facebook.png'),
        ),
        SizedBox(width: 60.0),
        GestureDetector(
          onTap: () {
            // Handle Google sign up
          },
          child: buildSocialButton('assets/google.png'),
        ),
      ],
    );
  }

  Widget buildSocialButton(String assetImage) {
    return Container(
      height: 60.0,
      width: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
        image: DecorationImage(image: AssetImage(assetImage)),
      ),
    );
  }

  Widget buildSignInLink() {
    return GestureDetector(
      onTap: () {
        Get.offNamed('/login');
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: "Sign in",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
