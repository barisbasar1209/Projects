import 'package:flutter/material.dart';

class FourthRouteSquare extends StatefulWidget {
  const FourthRouteSquare({Key? key}) : super(key: key);

  @override
  State<FourthRouteSquare> createState() => _FourthRouteSquareState();
}

class _FourthRouteSquareState extends State<FourthRouteSquare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.blue,
        title: const Text(
          'Square Page',
        ),
      ),
    );
  }
}
