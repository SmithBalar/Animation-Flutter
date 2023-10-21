import 'package:animations_practice/models/trip.dart';
import 'package:animations_practice/shared/heart.dart';
import 'package:flutter/material.dart';

import 'package:ipsum/ipsum.dart';

class Details extends StatefulWidget {
  final Trip trip;
  const Details({super.key, required this.trip});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Ipsum ip = Ipsum();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              child: Hero(
                tag: 'location-img-${widget.trip.img}',
                child: Image.asset(
                  'images/${widget.trip.img}',
                  height: 360,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(widget.trip.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.grey[800])),
              subtitle: Text('${widget.trip.nights} night stay for only \$${widget.trip.price}', style: const TextStyle(letterSpacing: 1)),
              trailing: const Heart(),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Text(ip.sentences(3), style: TextStyle(color: Colors.grey[600], height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }
}
