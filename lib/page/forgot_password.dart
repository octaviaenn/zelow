import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';
import 'package:zelow/page/login_page.dart';
import 'package:zelow/page/verif_forgot_pw.dart';

class ForgotPWPage extends StatefulWidget {
  const ForgotPWPage({super.key});

  @override
  State<ForgotPWPage> createState() => _ForgotPWPageState();
}

class _ForgotPWPageState extends State<ForgotPWPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 28),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 15),
              Text(
                'Forgot password?',
                style: blackTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 300,
                child: Text(
                  'Don’t worry! It happens.\nPlease enter the email associated with your account.',
                  style: greenTextStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.035,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              const SizedBox(height: 73),
              Text(
                'Email address',
                style: blackTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.normal,
                )
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xffEFEFEF),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your email address',
                    hintStyle: greyTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.03,
                      fontWeight: FontWeight.normal,
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
              const SizedBox(height: 297),
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: zelow,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => VerifPwpage()));
                  },
                  child: Text(
                    'Send code',
                    style: whiteTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Remember password?',
                    style: greenTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.normal,
                        ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                    child: Text(
                      'Log in',
                      style: greenTextStyle.copyWith(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}