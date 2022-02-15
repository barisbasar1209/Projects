import 'package:flutter/material.dart';

class SecoundRouteArrow extends StatefulWidget {
  const SecoundRouteArrow({Key? key}) : super(key: key);

  @override
  State<SecoundRouteArrow> createState() => _SecoundRouteStateArrow();
}

class _SecoundRouteStateArrow extends State<SecoundRouteArrow> {
  @override
  Widget build(BuildContext context) {
    Size ratio = MediaQuery.of(context).size;
    Color bgcolor = Colors.blue;
    Color fgcolor = Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrow Page'),
        backgroundColor: fgcolor,
        foregroundColor: bgcolor,
      ),
      bottomNavigationBar: BottomAppBar(
        color: fgcolor,
        child: SizedBox(
          height: ratio.height * 0.1,
        ),
        shape: const AutomaticNotchedShape(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
      ),

      // body: Align(
      //   alignment: Alignment.bottomCenter,
      // child: ElevatedButton(
      //   style: ButtonStyle(
      //     backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      //     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      //     ),
      //   ),
      // ElevatedButton.styleFrom(
      //   primary: Colors.black,
      //   padding: EdgeInsets.all(ratio.height * 0.025),
      // ),
      // onPressed: () {
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context) => const StatefulScaffold()));
      // },
      // child: const Text(
      //   'Return to Arrow-Icon',
      //   style: TextStyle(
      //     color: Colors.blue,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      // ),
      // ),
    );
  }
}
