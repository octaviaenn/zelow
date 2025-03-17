import 'package:flutter/material.dart';
import 'package:zelow/components/constant.dart';

class VerifPwpage extends StatefulWidget {
  const VerifPwpage({super.key});

  @override
  _VerifPwpageState createState() => _VerifPwpageState();
}

class _VerifPwpageState extends State<VerifPwpage> {
  final int _otpLength = 5;
  late List<TextEditingController> _otpControllers;

  @override
  void initState() {
    super.initState();
    _otpControllers = List.generate(_otpLength, (index) => TextEditingController());
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: blackTextStyle.copyWith(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: blackTextStyle.copyWith(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: blackTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  const TextSpan(text: 'We’ve sent an Email with an activation code to '),
                  TextSpan(
                    text: 'your-email@example.com', // Email dibuat statis
                    style: blackTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_otpLength, (index) {
                return Container(
                  width: 50,
                  height: 60,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey, // Tidak ada error state
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: _otpControllers[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    cursorColor: const Color(0xff06C474),
                    style: blackTextStyle.copyWith(
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < _otpLength - 1) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && index > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 249),
            GestureDetector(
              onTap: () {
                // Simulasi resend code
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code resent successfully')),
                );
              },
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: blackTextStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                  children: [
                    const TextSpan(text: 'Didn’t receive a code? '),
                    TextSpan(
                      text: 'Resend',
                      style: blackTextStyle.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simulasi verifikasi sukses
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Code verified successfully')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: zelow,
                minimumSize: const Size(double.infinity, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: Text(
                'Submit',
                style: whiteTextStyle.copyWith(
                  fontSize: MediaQuery.of(context).size.width * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
