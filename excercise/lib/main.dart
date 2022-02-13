// import 'package:excercise/sectest.dart';
import 'package:flutter/material.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
  // runnApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const StatefulScaffold(),
    );
  }
}

class StatefulScaffold extends StatefulWidget {
  // final Color fgcolor;
  // final Color bgcolor;

  const StatefulScaffold({
    Key? key,
    // required this.fgcolor,
    // required this.bgcolor,
  }) : super(key: key);

  @override
  State<StatefulScaffold> createState() => _StatefulScaffoldState();
}

class _StatefulScaffoldState extends State<StatefulScaffold> {
  /*double addsize = 0;
  double squaresize = 0;
  double arrowsize = 0;

  
  void printSizes() {
    print(addsize);
    print(squaresize);
    print(arrowsize);
    print('\n');
  }*/

  int iconIdx = 0;
  PageController pageController = PageController();
  // klassen werden mit konstruktoren initialisiert werden

  @override
  Widget build(BuildContext context) {
    Color iconbuttoncolor = const Color(0xff1976D2);
    Color bgcolor = Colors.blue;
    Color fgcolor = Colors.black;
    bool isFavorite = false;
    Size ratio = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            width: ratio.width * 1,
            height: ratio.height * 0.1,

            // continue at this place tomorrow with setting the functionality
            // for colorswitch when AppBat is tapped
            child: InkWell(
              onTap: () {
                isFavorite = !isFavorite;
                setState(
                  () {
                    // fgcolor = Colors.blue;
                    // bgcolor = Colors.black;
                  },
                );
              },
              child: Center(
                child: Text(
                  'Testapp',
                  style: TextStyle(
                    fontSize: ratio.height * 0.035,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        title: const Center(child: Text('TestApp')),
        foregroundColor: fgcolor,
        backgroundColor: bgcolor,
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)))),
        color: Colors.blue,
        child: SizedBox(
          // muss dynamisiert werden , sonst passt die Höhe nicht auf jedem Handy
          height: ratio.height * 0.1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <CircleAvatar>[
              CircleAvatar(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // durch setState sage ich Flutter dass alle vars die
                        // da drinnen stehen in der UI reloaded werden sollen
                        // dieser State kann nur in dieser Klasse genutzt werden

                        setState(() {
                          iconIdx = 0;
                        });
                        pageController.animateToPage(0,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.fastOutSlowIn);
                      },
                    ),
                  ),
                  backgroundColor: iconbuttoncolor,
                  foregroundColor: Colors.black),
              CircleAvatar(
                child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      iconIdx = 1;
                    });
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
                backgroundColor: iconbuttoncolor,
                foregroundColor: Colors.black,
              ),
              CircleAvatar(
                child: IconButton(
                  icon: const Icon(
                    Icons.crop_square,
                  ),
                  onPressed: () {
                    setState(() {
                      iconIdx = 2;
                    });
                    pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  },
                ),
                backgroundColor: iconbuttoncolor,
                foregroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: IconShower(
        pageController: pageController,
        iconIdx: iconIdx,
      ),
    );
  }
}

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

class ThirdRouteAdd extends StatefulWidget {
  const ThirdRouteAdd({Key? key}) : super(key: key);

  @override
  State<ThirdRouteAdd> createState() => _ThirdRouteAddState();
}

class _ThirdRouteAddState extends State<ThirdRouteAdd> {
  @override
  Widget build(BuildContext context) {
    var ratio = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            expandedHeight: ratio.height * 0.25,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.black,
            title: const Text('SliverAppBar'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    child: const Placeholder(),
                  ),
                );
              },
              childCount: 3,
            ),
          ),
        ],
      ),
    );
  }
}

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