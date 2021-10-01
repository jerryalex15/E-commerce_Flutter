import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Chargement extends StatefulWidget {
  Chargement({Key? key}) : super(key: key);

  @override
  _ChargementState createState() => _ChargementState();
}

class _ChargementState extends State<Chargement> {

  final spinkit = SpinKitDancingSquare(
    color: Colors.greenAccent,
    size: 80.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Column(
          children: [
            spinkit
          ],
        ),
      ),
    );
  }
}