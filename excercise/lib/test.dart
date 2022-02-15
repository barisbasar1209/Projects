import 'package:flutter/material.dart';
import 'main.dart';
import 'routes/SecondRouteArrow.dart';
import 'routes/ThirdRouteAdd.dart';
import 'routes/FourthRouteSquare.dart';
// Neues feature: Wenn diese Box in der Mitte gedrückt wird soll sie laden und dann eine
// neue Seite zeigen wo man ein kleines spiel spielen kann oder etwas ähnliches
// Kann entweder die Tap funktion auf dem Icon schreiben oder auf der Box
// schöner wärs auf der Box aber ich versuche es jetzt mal mit dem Icon

// Ziel : Box in der Mitte, diese soll durch drücken der drei Buttons in der Bar
// das entsprechende Icon zeigen

// ! when AppBar is tapped the color shall invert

class Box extends StatelessWidget {
  const Box({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var ratio = MediaQuery.of(context).size;

    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: ratio.height * 0.3,
          width: ratio.height * 0.3,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.blue),
        ),
      ]),
    ]);
  }
}

class IconShower extends StatefulWidget {
  // variablen immer final
  // noch nicht initialisieren, weil noch gesetz werden muss
  final int iconIdx;
  // ignore: prefer_typing_uninitialized_variables
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
    var ratio = MediaQuery.of(context).size;

    return PageView.builder(
      controller: widget.pageController,
      // brauche hier nicht auf Null zu prüfen, weil controller, wegen dem ? in der def
      // Null akzeptiert (nullsafe)
      itemCount: icons.length,
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
                padding: EdgeInsets.symmetric(
                  // diese beiden Anpassungen müssten natürlich dynmaisiert werden
                  horizontal: ratio.width * 0.325,
                  vertical: ratio.height * 0.26,
                ),
                child: InkWell(
                  onLongPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SecoundRouteArrow()));
                    // soll dann also eine neue Seite öffnen
                  },
                  child: Icon(
                    icons[index],
                    size: ratio.height * 0.275,
                  ),
                ),
              )
            else if (index == 1)
              InkWell(
                onLongPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ThirdRouteAdd()));
                  // soll dann also eine neue Seite öffnen
                },
                child: Icon(
                  icons[index],
                  size: ratio.height * 0.275,
                ),
              )
            else if (index == 2)
              InkWell(
                onLongPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FourthRouteSquare()));
                  // soll dann also eine neue Seite öffnen
                },
                child: Icon(
                  icons[index],
                  size: ratio.height * 0.275,
                ),
              )
          ],
        );
      },
    );
  }
}

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
