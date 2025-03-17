import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:zelow/components/constant.dart';
import 'package:zelow/page/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: MediaQuery.of(context).size.width * 0.25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image(
                  image: AssetImage("assets/images/zelowbottom.png"),
                  height: 200,
                  width: 200,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: blackTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Email",
                      hintStyle: greyTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: Color(0xffEFEFEF),
                      filled: true,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    "Password",
                    style: blackTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Password",
                      hintStyle: greyTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.w400,
                      ),
                      fillColor: Color(0xffEFEFEF),
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  GestureDetector(
                    onTap: () {
                      print("Forgot password?");
                    },
                    child: Text(
                      'Forgot password?',
                      style: greenTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.03,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.25),
                  GestureDetector(
                    onTap: () async {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => HomePageStudent(),
                      //   ),
                      // );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.width * 0.12,
                      decoration: BoxDecoration(
                        color: const Color(0xff06C474),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          "Login",
                          style: whiteTextStyle.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(thickness: 0.5, color: Colors.black),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or login with",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        Expanded(
                          child: Divider(thickness: 0.5, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton.mini(
                        buttonSize: ButtonSize.medium,
                        buttonType: ButtonType.googleDark,
                        onPressed: () {},
                      ),
                      SizedBox(width: 20),
                      SignInButton.mini(
                        buttonSize: ButtonSize.medium,
                        buttonType: ButtonType.facebook,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "You don't have an account?",
                        style: blackTextStyle.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.03,
                          fontWeight: FontWeight.w400,  
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                           MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Text(
                          " Sign Up",
                          style: greenTextStyle.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
