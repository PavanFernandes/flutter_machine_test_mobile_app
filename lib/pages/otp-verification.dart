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
    if (otp == '12345') {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      Navigator.pushReplacementNamed(context, '/register');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(50, 45, 50, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 70,),
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
            const SizedBox(height: 7,),
            const Text("enter otp as 12345 to proceed!", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.green, fontSize: 16)),
            const SizedBox(height: 20,),
            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    5, (index) => SizedBox(
                  height: 45,
                  width: 40,
                  child: TextField(
                    controller: controllers[index],
                    style: Theme.of(context).textTheme.headlineSmall,
                    keyboardType: TextInputType.number,
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
                      if (index == 4 && value.isNotEmpty) {
                        _validateOTP();
                      }
                    },
                    focusNode: index == 4 ? _lastNode : null,
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
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black87),
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text("SEND AGAIN",
                    style: TextStyle(decoration: TextDecoration.underline, fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
