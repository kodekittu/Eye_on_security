
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:new_app/features.dart';

class HomePage extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/intro6.dart";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Social Tracker",
    "Device Tracker",
    "Family Tracker",
  ];
  final List<String> subtitles = [
    "A smart way to track the social activity of your kids & family members to maintain high security.",
    "With the built-in location tracking, know the whereabouts of your family members in a click.",
    "This feature can be set to record audios or sounds around the phone, which may help you identify the location of the device and that of your family members."
  ];

  final List<Widget> features = [
    SocialTracker(),
    DeviceTracker(),
    FamilyTracker(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: Colors.black87,
                feature: features[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex != 2) _controller.next();
                else Navigator.pushNamed(context, '/page');
              },
            ),
          )
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color bg;
  final Widget feature;

  const IntroItem(
      {Key key, @required this.title, this.subtitle, this.bg, this.feature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 10.0),
                Text(
                  subtitle,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height:20.0),
              Expanded(
                child: feature
              )
            ],
          ),
        ),
      ),
    );
  }
}

/*
Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Material(
                        elevation: 4.0,
                          child: Image.asset("assets/images/logo.png", height: 100, width: 100,)
                      ),
                  ),
                ),
 */