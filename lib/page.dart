import 'package:flutter/material.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/logo.png", height: 150, width: 150,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlineButton(
                child: Text("DEVICES INFO"),
                onPressed: () => Navigator.pushNamed(context, '/info'),
              ),
            )
          ],
        ),
    ),
    );
  }
}
