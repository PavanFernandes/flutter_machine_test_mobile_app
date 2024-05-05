import 'package:flutter/material.dart';

class OTPVerification extends StatelessWidget{
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100,),
            Text("OTP Verification", style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.w700),),
            SizedBox(height: 40,),
            Text("We have sent you OTP to your mobile number +91-9765232817"),
          ],
        ),
      ),
    );
  }


}