import 'package:flutter/material.dart';
import 'package:kingdom_fm/screens/news.dart';
import 'package:kingdom_fm/screens/three.dart';
import 'package:kingdom_fm/screens/two.dart';
import 'package:navigation_dot_bar/navigation_dot_bar.dart';

class BottomTab extends StatefulWidget {
  BottomTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BottomTabState createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
   int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageOne(),
      //  Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationDotBar ( // Usar -> "BottomNavigationDotBar"
      items: <BottomNavigationDotBarItem>[
        BottomNavigationDotBarItem(icon: Icons.home, onTap: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => PageOne()));}),
        BottomNavigationDotBarItem(icon: Icons.live_tv, onTap: () { Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => PageTwo()));}),
        BottomNavigationDotBarItem(icon: Icons.radio, onTap: () {Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => PageThree()));}),
      ]
  ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}