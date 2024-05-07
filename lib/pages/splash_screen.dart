import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen>{

  final Map<String, dynamic> data = {
    "deviceType": "",
    "deviceId": "",
    "deviceName": "",
    "deviceOSVersion": "",
    "deviceIPAddress": "",
    "lat": 0,
    "long": 0,
    "buyer_gcmid": "",
    "buyer_pemid": "",
    "app": {
      "version": "",
      "installTimeStamp": DateTime.now().toString(),
      "uninstallTimeStamp": DateTime.now().toString(),
      "downloadTimeStamp": DateTime.now().toString()
    }
  };

  @override
  void initState(){
    super.initState();
    initData();
    Timer(
      const Duration(seconds: 5),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  const Login(), // Update with your main widget
        ),
      ),
    );
  }

  Future<void> initData() async {
    await retrieveDeviceInfo();
    await retrieveIPAddress();
    await getAppInfo();
    await getCurrentLocation();
    print(data);
    postData();
  }

  Future<void> postData() async {

    final Uri url = Uri.parse('http://devapiv3.dealsdray.com/api/v2/user/otp');

    try {
      final response = await http.post(
        url,
        body: json.encode(data),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        print('POST request successful');
      }else{
        print("Failed to send Post request : " + '${response.statusCode}');
      }
    } catch (e) {
      print('POST request failed: $e');
    }
  }

  Future<void> retrieveDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      setState(() {
        data["deviceType"] = "android";
        data["deviceId"] = androidInfo.id;
        data["deviceName"] = androidInfo.model;
        data["deviceOSVersion"] = androidInfo.version.release;
      });
    }if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      setState(() {
        data["deviceType"] = "ios";
        data["deviceId"] = iosInfo.identifierForVendor;
        data["deviceName"] = iosInfo.model;
        data["deviceOSVersion"] = iosInfo.utsname.release;
      });
    }
  }


  Future<void> retrieveIPAddress() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);
      setState(() {
        data["deviceIPAddress"] = response.body;
      });
    } catch (e) {
      print('Failed to get ip: $e');
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        data["lat"] = position.latitude;
        data["long"] = position.longitude;
      });
    } catch (e) {
      print('Failed to get location: $e');
    }
  }

  Future<void> getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      data["app"]['version'] = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: ([Colors.blue, Colors.purple]),
              begin : Alignment.topRight,
              end : Alignment.bottomLeft
        ),
      ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 350,),
            CircularProgressIndicator(),
            Spacer(),
            SizedBox(
                height: 100,
                width: 100,
                child: Image(image: AssetImage("assets/images/deals-dray-logo.png"))),
            SizedBox(height: 5),
            Text("Deals Dray", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white70),),
            SizedBox(height: 40,),
          ],
        ),
      )
    );
  }
}