import 'package:flutter/material.dart';

class BodyLayout extends StatelessWidget {
  const BodyLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}
/*
Widget _myListView(BuildContext context) {

  // backing data
  final europeanCountries = ['Albania', 'Andorra', 'Armenia', 'Austria',
    'Azerbaijan', 'Belarus', 'Belgium', 'Bosnia and Herzegovina', 'Bulgaria',
    'Croatia', 'Cyprus', 'Czech Republic', 'Denmark', 'Estonia', 'Finland',
    'France', 'Georgia', 'Germany', 'Greece', 'Hungary', 'Iceland', 'Ireland',
    'Italy', 'Kazakhstan', 'Kosovo', 'Latvia', 'Liechtenstein', 'Lithuania',
    'Luxembourg', 'Macedonia', 'Malta', 'Moldova', 'Monaco', 'Montenegro',
    'Netherlands', 'Norway', 'Poland', 'Portugal', 'Romania', 'Russia',
    'San Marino', 'Serbia', 'Slovakia', 'Slovenia', 'Spain', 'Sweden',
    'Switzerland', 'Turkey', 'Ukraine', 'United Kingdom', 'Vatican City'];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.airplanemode_active),
        trailing: Row (
          children: [
            Icon(Icons.flag),
            Icon(Icons.directions_car_rounded)
          ],
        ),
        title: Text(europeanCountries[index]),
      );
    },
  );

}

class myIcon extends StatelessWidget {
  late final dynamic _holdicon;

  myIcon(this._holdicon);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton (
      onPressed: () {},
      child: Icon(
          Icons._holdicon,
          color: Color._holdcolor,
      ),

    );
  }
}
*/

Widget _myListView(BuildContext context) {
  // backing data
  final europeanCountries = [
    'Albania',
    'Andorra',
    'Armenia',
    'Austria',
    'Azerbaijan',
    'Belarus',
    'Belgium',
    'Bosnia and Herzegovina',
    'Bulgaria',
    'Croatia',
    'Cyprus',
    'Czech Republic',
    'Denmark',
    'Estonia',
    'Finland',
    'France',
    'Georgia',
    'Germany',
    'Greece',
    'Hungary',
    'Iceland',
    'Ireland',
    'Italy',
    'Kazakhstan',
    'Kosovo',
    'Latvia',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Macedonia',
    'Malta',
    'Moldova',
    'Monaco',
    'Montenegro',
    'Netherlands',
    'Norway',
    'Poland',
    'Portugal',
    'Romania',
    'Russia',
    'San Marino',
    'Serbia',
    'Slovakia',
    'Slovenia',
    'Spain',
    'Sweden',
    'Switzerland',
    'Turkey',
    'Ukraine',
    'United Kingdom',
    'Vatican City'
  ];

  return ListView.builder(
    itemCount: europeanCountries.length,
    itemBuilder: (context, index) {
      return ListTile(
        leading: ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.drive_eta,
            color: Colors.green[550],
          ),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
        ),
        trailing: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.drive_eta,
              color: Colors.green[700],
            ),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Icon(
              Icons.drive_eta,
              color: Colors.green[550],
            ),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
            ),
          ),
        ]),
        title: Text(europeanCountries[index]),
      );
    },
  );
}
