import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final int _otpLength = 5;
  final List<TextEditingController> _otpControllers = List.generate(
    5,
    (index) => TextEditingController(),
  );

  int _timerSeconds = 30;
  bool _canResendCode = false;
  bool _isError = false;
  bool _isVerifying = false;
  double _bubbleSize = 50;
  String _email = "Loading...";

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
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Verification',
              style: GoogleFonts.poppins(
                fontSize: MediaQuery.of(context).size.width * 0.06,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 7),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.normal,
                ),
                children: [
                  const TextSpan(
                    text: 'We’ve sent an Email with an activation code \nto ',
                  ),
                  TextSpan(
                    text: _email,
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.normal,
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
                      color: _isError ? Colors.red : Colors.grey,
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
                    style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: MediaQuery.of(context).size.width * 0.075,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                );
              }),
            ),
            if (_isError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  'Wrong code, please try again',
                  style: GoogleFonts.poppins(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            const SizedBox(height: 249),
            if (!_canResendCode)
              Text(
                '00:${_timerSeconds.toString().padLeft(2, '0')}',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
            if (_canResendCode)
              GestureDetector(
                onTap: () {}, // Placeholder for resend function
                child: Text(
                  'Resend',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 24),
            if (_isVerifying)
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: _bubbleSize,
                height: _bubbleSize,
                decoration: BoxDecoration(
                  color: const Color(0xff06C474),
                  shape: BoxShape.circle,
                ),
              ),
            if (!_isVerifying)
              ElevatedButton(
                onPressed: () {}, // Placeholder for verify function
                child: Text(
                  'Submit',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
