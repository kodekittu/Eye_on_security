import 'package:flutter/material.dart';

import 'package:device_info/device_info.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Device INFO"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Text(
              "YOUR DEVICE INFORMATION",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.lightBlueAccent),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Board   : $board",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Brand   : $brand",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Device   : $device",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hardware  :  $hardware ",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Host  : $host",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "ID   : $id",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Manufacture  : $manufacture",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Model  : $model",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Product  :  $product",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Type   : $type",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Is Physical Device : $isphysicaldevice",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              " Android ID: $androidid ",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}