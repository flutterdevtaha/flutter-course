import 'dart:convert';

import 'package:flutter/material.dart';

class BottomNavigationBarWithListViewTask extends StatefulWidget {
  const BottomNavigationBarWithListViewTask({Key? key}) : super(key: key);

  @override
  BottomNavigationBarWithListViewTaskState createState() =>
      BottomNavigationBarWithListViewTaskState();
}

class BottomNavigationBarWithListViewTaskState
    extends State<BottomNavigationBarWithListViewTask> {
  int selectedIndex = 0;
  final widgetOptions = [
    const LaptopsList(),
    const Text('Add  Laptop'),
    const Text('Favourites'),
  ];
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Laptops Store App')),
      body: Center(child: widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.laptop),
            label: 'Laptops',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo),
            label: ' Laptop',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourites',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
    );
  }
}

class LaptopsList extends StatefulWidget {
  const LaptopsList({Key? key}) : super(key: key);

  @override
  LaptopsListState createState() => LaptopsListState();
}

class LaptopsListState extends State<LaptopsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/laptops.json'),
          builder: (context, snapshot) {
            var laptops = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                var laptop = laptops[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        "Name: " + laptop['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        "Company: " + laptop['company'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Price: " + laptop['price'],
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      Image.asset('assets/1.png', height: 200)
                    ],
                  ),
                );
              },
              itemCount: laptops == null ? 0 : laptops.length,
            );
          }),
    ));
  }
}
