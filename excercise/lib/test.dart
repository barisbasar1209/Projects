import 'package:flutter/material.dart';
import 'main.dart';

// Neues feature: Wenn diese Box in der Mitte gedrückt wird soll sie laden und dann eine
// neue Seite zeigen wo man ein kleines spiel spielen kann oder etwas ähnliches
// Kann entweder die Tap funktion auf dem Icon schreiben oder auf der Box
// schöner wärs auf der Box aber ich versuche es jetzt mal mit dem Icon

// Ziel : Box in der Mitte, diese soll durch drücken der drei Buttons in der Bar
// das entsprechende Icon zeigen

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 250,
          width: 250,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue),
        ),
      ]),
    ]);
  }
}

// Noch leichter : Ich schreibe einen Stack mit dem Container und den Icons und schiebe
// einfach immer nur das Icon vor, welches geklickt wurde.
// Will aber eig schon dass der ganze container switched, dann am ende

// schlauer als stack ist einfach die size des Icons zu ändern
/*class Foof extends StatelessWidget {

// Sache ist grad : Es reagiert nicht auf den Knopfdruck, ich glaube es liegt daran wie ich
// die paramter in der Main in Foo übergebe

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          const Icon(Icons.add, size: addsize),
          const Icon(Icons.crop_square, size: squaresize),
          const Icon(Icons.arrow_back_ios, size: arrowsize),
          const Box(),
      ],
    );
  }
}
*/

class IconShower extends StatefulWidget {
  // variablen immer final
  // noch nicht initialisieren, weil noch gesetz werden muss
  final int iconIdx;
  final pageController;

  // required bedeuted dass der parameter übergeben werden muss
  const IconShower({
    Key? key,
    // optionaler Param der immer garantiert einen Wert hat
    this.iconIdx = 0, // ist kein Icon
    this.pageController,
  }) : super(key: key);

  // variablen immer in der Oberklasse des states übergeben
  @override
  State<IconShower> createState() => _IconShowerState();
}

class _IconShowerState extends State<IconShower> {
  var icons = [Icons.arrow_back_ios, Icons.add, Icons.crop_square];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: widget.pageController,
      // brauche hier nicht auf Null zu prüfen, weil controller, wegen dem ? in der def
      // Null akzeptiert (nullsafe)
      // itemCount: icons.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        // maybe klappt es wenn ich hier zwei stacks mit fallunterscheidung reinbaue
        return Stack(
          alignment:
              (index != 0) ? Alignment.center : AlignmentDirectional.topStart,
          // alignment: Alignment.center,
          children: [
            // widget. macht es mir möglich auf (die Variablen der) Oberklasse zuzugreifen
            const Box(),
            if (index == 0)
              Padding(
                padding: const EdgeInsets.symmetric(
                  // diese beiden Anpassungen müssten natürlich dynmaisiert werden
                  horizontal: 130.0,
                  vertical: 190.0,
                ),
                child: InkWell(
                  onLongPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecoundRouteArrow()));
                    // soll dann also eine neue Seite öffnen
                  },
                  child: Icon(
                    icons[index],
                    size: 200,
                  ),
                ),
              )
            else if (index == 1)
              InkWell(
                onLongPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ThirdRouteAdd()));
                  // soll dann also eine neue Seite öffnen
                },
                child: Icon(
                  icons[index],
                  size: 200,
                ),
              )
            else if (index == 2)
              InkWell(
                onLongPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FourthRouteSquare()));
                  // soll dann also eine neue Seite öffnen
                },
                child: Icon(
                  icons[index],
                  size: 200,
                ),
              )
          ],
        );
      },
    );
    // unteres return wird einfach ignoriert
    // return Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     // widget. macht es mir möglich auf (die Variablen der) Oberklasse zuzugreifen
    //     const Box(),
    //     if (widget.iconIdx != -1) Icon(icons[widget.iconIdx], size: 200),
    //   ],
    // );
  }
}

// strg # kommentiert alles markeirte

class Foo extends StatefulWidget {
  // variablen immer final
  final double addsize;
  final double squaresize;
  final double arrowsize;

  // required bedeuted dass der parameter übergeben werden muss
  const Foo(
      {Key? key,
      required this.addsize,
      required this.squaresize,
      required this.arrowsize})
      : super(key: key);

  // variablen immer in der Oberklasse des states übergeben
  @override
  State<Foo> createState() => _FooState();
}

class _FooState extends State<Foo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // widget. macht es mir möglich auf (die Variablen der) Oberklasse zuzugreifen
        const Box(),
        Icon(Icons.add, size: widget.addsize),
        Icon(Icons.crop_square, size: widget.squaresize),
        Icon(Icons.arrow_back_ios, size: widget.arrowsize),
      ],
    );
  }
}

/*
class StatefulIcons extends State<ThisIsStateful> {
  @override
  Widget build(BuildContext context) {
  }
  
}
*/

/*

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

double _volume = 0.0;

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          icon: const Icon(Icons.volume_up),
          tooltip: 'Increase volume by 10',
          onPressed: () {
            setState(() {
              _volume += 10;
            });
          },
        ),
        Text('Volume : $_volume')
      ],
    );
  }
}
*/

class ThisIsStateful extends StatefulWidget {
  const ThisIsStateful({Key? key}) : super(key: key);

  @override
  _myState createState() => _myState();
}

// ignore: camel_case_types
class _myState extends State<ThisIsStateful> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            title: const Center(child: Text('tEsTApP')),
            foregroundColor: Colors.black,
            backgroundColor: Colors.blue),
        // bottomNavigationBar: BottomAB(),
      ),
    );
  }
}
