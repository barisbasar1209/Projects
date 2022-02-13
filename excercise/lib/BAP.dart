import 'package:flutter/material.dart';

class StatefulBAP extends StatefulWidget {
  const StatefulBAP({Key? key}) : super(key: key);

  @override
  BAPState createState() => BAPState();
}

// hier kommt jetzt NUR die BAP
class BAPState extends State<StatefulBAP> {
  double addsize = 0;
  double arrowsize = 0;
  double squaresize = 0;

  void IconAdd() {
    addsize = 200;
    arrowsize = 0;
    squaresize = 0;
  }

  void IconSquare() {
    addsize = 0;
    arrowsize = 0;
    squaresize = 200;
  }

  void IconArrow() {
    addsize = 0;
    arrowsize = 200;
    squaresize = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const AutomaticNotchedShape(RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
      color: Colors.blue,
      child: SizedBox(
        // muss dynamisiert werden , sonst passt die Höhe nicht auf jedem Handy
        height: 75,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <CircleAvatar>[
            CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      IconArrow();
                    },
                  ),
                ),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.black),
            CircleAvatar(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    IconAdd();
                  },
                ),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.black),
            CircleAvatar(
                child: IconButton(
                  icon: const Icon(Icons.crop_square),
                  onPressed: () {
                    IconSquare();
                  },
                ),
                backgroundColor: Colors.blue[700],
                foregroundColor: Colors.black),
          ],
        ),
      ),
    );
  }
}
