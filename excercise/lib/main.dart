// import 'package:excercise/sectest.dart';
import 'package:flutter/material.dart';
import 'test.dart';

void main() {
  runApp(const MyApp());
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
  const StatefulScaffold({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulScaffold> createState() => _StatefulScaffoldState();
}

class _StatefulScaffoldState extends State<StatefulScaffold> {
  bool _hbp =
      false; // boolean variable "hasBeenPressed" to control the functionality of the, ontap, color switch indicating AppBar
  int iconIdx = 0;

  Color iconbuttoncolor = const Color(0xff1976D2);
  Color fgcolor = Colors.black;
  Color bgcolor = Colors.blue;
  // colors have to be declared outside of Widet builder, still not quite sure why but it works

  PageController pageController = PageController();
  // classes get initiated by the use of a contructor

  @override
  Widget build(BuildContext context) {
    Size ratio = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        actions: [
          // SizedBox in which the Inkwell is nested in in order to control the layout of the AppBar
          SizedBox(
            width: ratio.width * 1,
            height: ratio.height * 0.1,

            // Inkwell for colorswitch when AppBar is tapped
            child: InkWell(
              onTap: () {
                setState(
                  () {
                    // stuff that has to change immediately after pushing a button for example
                    // has to be put in the setState property
                    iconbuttoncolor = _hbp
                        ? const Color(0xff111111)
                        : const Color(0xff1976D2);
                    fgcolor = _hbp ? Colors.blue : Colors.black;
                    bgcolor = _hbp ? Colors.black : Colors.blue;
                    _hbp = !_hbp;
                    // this line changes the state of hbp (has been pressed) to it's opposite boolean everytime the appBar is pressed
                    // Navigator.push(context, MaterialPageRoute(builder: (_) => IconShower(passedfg: fgcolor, passedbg: bgcolor)))
                  },
                );
              },
              // Arrangement of the text in the Appbar
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
        // End of the action section of the AppBar
        // Mostly the layout part of the AppBar itself
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: const Center(
          child: Text('TestApp'),
        ),
        foregroundColor: fgcolor,
        backgroundColor: bgcolor,
      ),
      // Beginning of the BottomNavBar which is here implemented as an BottomAppbar, same shape as the Appbar
      // No functionalities implemented besides the Iconbuttons
      bottomNavigationBar: BottomAppBar(
        shape: const AutomaticNotchedShape(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
        ),
        color: bgcolor,
        // Same as in the AppBar, using a SizedBox in order to control the layout of the elements in the BottomAppBar
        child: SizedBox(
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
                        setState(
                          () {
                            iconIdx = 0;
                          },
                        );
                        pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastOutSlowIn,
                        );
                      },
                    ),
                  ),
                  backgroundColor: iconbuttoncolor,
                  foregroundColor: fgcolor),
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
                foregroundColor: fgcolor,
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
                foregroundColor: fgcolor,
              ),
            ],
          ),
        ),
      ),
      // this IconShower, which is a widget created in another file, is supposed to control which iconbox is currently shown
      body: IconShower(
        pageController: pageController,
        iconIdx: iconIdx,
        passedbg: bgcolor,
        passedfg: fgcolor,
      ),
    );
  }
}
