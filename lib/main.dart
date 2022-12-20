import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Rail(),
    );
  }
}

class Rail extends StatefulWidget {
  const Rail({super.key});

  @override
  State<Rail> createState() => _RailState();
}

class _RailState extends State<Rail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(

            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },

            selectedLabelTextStyle: TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Colors.white),
         
            groupAlignment: -1,
            labelType: NavigationRailLabelType.selected,
            backgroundColor: Colors.purple,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(radius:30,backgroundColor: Colors.grey,child:Icon(Icons.people)),
            ),
            trailing: Padding(padding: EdgeInsets.all(8),child: OutlinedButton(onPressed: (){},child: Text("data"),),),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('First'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.bookmark_border),
                selectedIcon: Icon(Icons.book),
                label: Text('Second'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.star_border),
                selectedIcon: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                label: Text('Third'),
              ),
            ],
          ),
          const VerticalDivider(
            thickness: 2,
            width: 5,
            color: Colors.blue,
          ),
          // This is the main content.
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("this is navigation rail")],
            ),
          ),
        ],
      ),
    );
  }
}
