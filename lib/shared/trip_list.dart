import 'package:animations_practice/models/trip.dart';
import 'package:flutter/material.dart';

import '../screens/details.dart';

class TripList extends StatefulWidget {
  const TripList({super.key});

  @override
  TripListState createState() => TripListState();
}

class TripListState extends State<TripList> {
  List<Widget> tripTiles = [];
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _addTrips();
    });
  }

  void _addTrips() {
    List<Trip> trips = [
      Trip(title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '400', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '750', nights: '2', img: 'ski.png'),
      Trip(title: 'Space Blast', price: '600', nights: '4', img: 'space.png'),
    ];
    Future ft = Future(() {});
    for (var trip in trips) {
      ft = ft.then((value) {
        return Future.delayed(const Duration(milliseconds: 100), () {
          tripTiles.add(_buildTile(trip));
          _listKey.currentState?.insertItem(tripTiles.length - 1);
        });
      });
    }
  }

  Widget _buildTile(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Details(trip: trip)));
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${trip.nights} nights', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blue[300])),
          Text(trip.title, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}'),
    );
  }

  final Tween<Offset> _offset = Tween(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      initialItemCount: tripTiles.length,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(_offset),
          child: tripTiles[index],
        );
      },
    );
  }
}
