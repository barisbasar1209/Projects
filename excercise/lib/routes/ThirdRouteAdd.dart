import 'package:flutter/material.dart';

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
        // scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            // automaticallyImplyLeading: false,
            // forceElevated: true,
            pinned: true,
            // floating: true,
            // stretch: true,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                child: const Text(
                  "Title of Appbar",
                  style: TextStyle(color: Colors.blue, fontSize: 30.0),
                ),
              ),
            ),
            // collapsedHeight: ratio.height * 0.25,
            expandedHeight: ratio.height * 0.75,
            foregroundColor: Colors.blue,
            backgroundColor: Colors.black,
            title: const Text('SliverAppBar'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // return ListView(
                //     children: ListTile.divideTiles(context: context, tiles: [
                //   ListTile(
                //     tileColor: Colors.white,
                //   ),
                //   ListTile(
                //     tileColor: Colors.blue,
                //   ),
                //   ListTile(
                //     tileColor: Colors.black,
                //   )
                // ]).toList());
                // return ListTile(
                // leading: Container(
                //   padding: const EdgeInsets.all(8),
                //   width: ratio.width * 0.25,
                //   child: const Text("Here is a text"),
                // ),
                // title: Text("Title"),
                // tileColor: Colors.yellow,

                // trailing: const Divider(),
                // );
                return SizedBox(
                  width: ratio.width * 0.2,
                  height: ratio.height * 0.05,
                  child: Card(
                    child: const Text("Hello Card"),
                    shape: StadiumBorder(
                        side: BorderSide(
                      color: Colors.black87,
                      width: ratio.width * 0.01,
                    )),
                  ),
                );
              },
              childCount: 25,
            ),
          ),
        ],
      ),
    );
  }
}
