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
            expandedHeight: ratio.height * 0.85,
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
                    width: ratio.width * 0.25,
                    child: const Placeholder(),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
