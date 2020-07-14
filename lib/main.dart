import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:new_app/homePage.dart';
import 'package:new_app/page.dart';
import 'package:new_app/signinPage.dart';
import 'package:new_app/signupPage.dart';

import 'devicesInfo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin(); // instantiate device info plugin
  AndroidDeviceInfo androidDeviceInfo;

  String board, brand, device, hardware, host, id, manufacture, model, product, type, androidid;
  bool isphysicaldevice;

  @override
  void initState() {
    super.initState();
    getDeviceinfo();
  }
  void getDeviceinfo() async {
    androidDeviceInfo = await deviceInfo
        .androidInfo; // instantiate Android Device Infoformation

    setState(() {
      board = androidDeviceInfo.board;
      brand = androidDeviceInfo.brand;
      device = androidDeviceInfo.device;

      hardware = androidDeviceInfo.hardware;
      host = androidDeviceInfo.host;
      id = androidDeviceInfo.id;
      manufacture = androidDeviceInfo.manufacturer;
      model = androidDeviceInfo.model;
      product = androidDeviceInfo.product;

      type = androidDeviceInfo.type;
      isphysicaldevice = androidDeviceInfo.isPhysicalDevice;
      androidid = androidDeviceInfo.androidId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/signin',
      routes: {
        '/signin' : (context) => SigninPage(),
        '/home' : (context) => HomePage(),
        '/signup' : (context) => SignupPage(brand: brand, devices: device,),
        '/page' : (context) => DemoPage(),
        '/info' : (context) => MyHomePage(),
      },
    );
  }
}

showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0);
}