import 'package:animations_practice/shared/screen_title.dart';
import 'package:animations_practice/shared/trip_list.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("images/bg.png"), fit: BoxFit.fitWidth, alignment: Alignment.topLeft),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 30),
            SizedBox(
              height: 160,
              child: ScreenTitle(text: 'Holiday Trips'),
            ),
            Flexible(child: TripList())
            //Sandbox(),
          ],
        ),
      ),
    );
  }
}
