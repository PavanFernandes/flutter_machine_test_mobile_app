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
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {},
                child: const Text("Phone")
            ),
            const SizedBox(height: 30,),
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
              padding: const EdgeInsets.symmetric(horizontal: 55),
              child: TextField(
                controller: inputController,
                decoration: const InputDecoration(
                    hintText: "Phone",
                )
              ),
            ),
            const SizedBox(height: 30,),
            ElevatedButton(
                onPressed: (){Navigator.pushNamed(context, '/otp-verification');},
                child: const Text("SEND CODE"))
          ],
        ),
      )
    );
  }

}