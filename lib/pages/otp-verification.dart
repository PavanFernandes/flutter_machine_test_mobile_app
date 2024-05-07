import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

class OTPVerification extends StatefulWidget {
  @override
  _OTPVerificationState createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  late Timer _timer;
  int _start = 120;

  int otpLength = 4;

  late List<TextEditingController> controllers;
  late FocusNode _lastNode;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(5, (index) => TextEditingController());
    _lastNode = FocusNode();
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      if (_start == 0) {
        _timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String getTimerString() {
    int minutes = _start ~/ 60;
    int seconds = _start % 60;
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');
    return '$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _timer.cancel();
    for (var controller in controllers) {
      controller.dispose();
    }
    _lastNode.dispose();
    super.dispose();
  }

  String getEnteredOTP() {
    String otp = '';
    for (TextEditingController controller in controllers) {
      otp += controller.text;
    }
    return otp;
  }

  void _validateOTP() {
    String otp = getEnteredOTP();
    if (otp == '1234') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
                height: 140,
                width: 70,
                child: Image(image: AssetImage("assets/images/otp_icon.png"))),
            const SizedBox(height: 10,),
            const Text("OTP Verification", style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.w700),),
            const SizedBox(height: 15,),
            const Text("OTP is sent to your mobile number"),
            const SizedBox(height: 7,),
            const Text("+91-9765232817", style: TextStyle(fontWeight: FontWeight.w700,)),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 7, 0, 25),
              child: Text("If you don't receive an otp, enter 1234 to proceed!", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green, fontSize: 12)),
            ),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    otpLength, (index) => SizedBox(
                  height: 48,
                  width: 45,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(10), // Add rounded corners
                    ),
                    child: TextField(
                      controller: controllers[index],
                      style: const TextStyle(fontSize: 15),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.center,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        if (value.isNotEmpty && index < 4){
                          FocusScope.of(context).nextFocus();
                        }
                        if (value.isEmpty && index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                        if (index == otpLength-1 && value.isNotEmpty) {
                          _validateOTP();
                        }
                      },
                      focusNode: index == otpLength-1 ? _lastNode : null,
                    ),
                  ),
                )
                ),
              ),
            ),
            const SizedBox(height: 12,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getTimerString(),
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Colors.black87),
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text("SEND AGAIN",
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
