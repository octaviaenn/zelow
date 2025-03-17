import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';
import 'package:zelow/pages/auth/verif_forgot_pw_page.dart';
import 'package:zelow/services/auth_service.dart';

class ForgotPWPage extends StatefulWidget {
  const ForgotPWPage({super.key});

  @override
  State<ForgotPWPage> createState() => _ForgotPWPageState();
}

class _ForgotPWPageState extends State<ForgotPWPage> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _sendResetOTP() async {
    setState(() => _isLoading = true);

    await _authService.sendPasswordResetOTP(
      _emailController.text.trim(),
      (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error), backgroundColor: Colors.red),
        );
        setState(() => _isLoading = false);
      },
      (loading) => setState(() => _isLoading = loading),
    );

    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => VerifPwPage(email: _emailController.text.trim()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 28),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
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
            Text(
              'Don’t worry! Enter your email to reset password.',
              style: greenTextStyle.copyWith(
                fontSize: MediaQuery.of(context).size.width * 0.035,
              ),
            ),
            const SizedBox(height: 73),
            Text(
              'Email address',
              style: blackTextStyle.copyWith(
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 297),
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _sendResetOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: zelow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child:
                    _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                          'Send code',
                          style: whiteTextStyle.copyWith(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
