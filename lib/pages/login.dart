import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

}

class _LoginState extends State<Login>{

  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: Column(
            children: [
              const SizedBox(
                height: 100,
                  width: 100,
                  child: Image(image: AssetImage("assets/images/deals-dray-logo.png"))),
              const Text("DealsDray", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.grey),),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ToggleButtons(
                  isSelected: [true, false],
                  onPressed: (int index) {
                  },
                  selectedColor: Colors.white70,
                  fillColor: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1,
                  borderColor: Colors.grey,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Phone"),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text("Email"),
                    ),
                  ],
                ),
              ),

              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Glad to see you!", style: TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),),
                  SizedBox(height:10),
                  Text("please provide your phone number"),
                ],
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: TextField(
                  controller: inputController,
                  decoration: const InputDecoration(
                      hintText: "Phone",
                  )
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/otp-verification');
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue, // text color
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("SEND CODE"),
              ),
        
            ],
          ),
        ),
      )
    );
  }

}