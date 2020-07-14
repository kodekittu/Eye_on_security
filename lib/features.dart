import 'package:flutter/material.dart';

class FamilyTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tile(Colors.blue, "Call History"),
                  tile(Colors.tealAccent, "Contacts"),
                  tile(Colors.orangeAccent, "Apps Installed"),
                  tile(Colors.teal, "Apps Usage"),
                  tile(Colors.pinkAccent, "Call Recording"),
                  tile(Colors.yellow, "SMS"),
                  tile(Colors.pink, "Phone Gallery"),
                ],
              )
          ),
        ),
      ),
    );
  }
}

class DeviceTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tile(Colors.pink, "Location Tracking"),
                  tile(Colors.greenAccent, "Mobile Events"),
                  tile(Colors.amber, "Device"),
                  tile(Colors.redAccent, "Screen Video"),
                  tile(Colors.red, "Screenshot"),
                  tile(Colors.green, "Surround Audio"),
                ],
              )
          ),
        ),
      ),
    );
  }
}
class SocialTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Material(
              elevation: 4.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  tile(Colors.lightGreen, "Whatsapp"),
                  tile(Colors.blue, "Facebook"),
                  tile(Colors.purple, "Instagram"),
                  tile(Colors.pink, "YouTube"),
                  tile(Colors.lightBlueAccent, "Twitter"),
                  tile(Colors.yellowAccent, "Snapchat"),
                  tile(Colors.red, "Gmail"),
                ],
              )
          ),
        ),
      ),
    );
  }
}

Widget tile(Color color, String text){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Material(
          elevation: 4.0,
          child: Container(
            width: 200,
            alignment: Alignment.center,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
            ),
          )
      ),
    ),
  );
}