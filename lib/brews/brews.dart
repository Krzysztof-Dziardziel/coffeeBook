import 'package:coffeebook/newBrew/newBrew.dart';
import 'package:flutter/material.dart';

class Brews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => (NewBrew())));
        },
      ),
      body: MyListView(),
    );
  }
}

class MyListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

Widget _myListView(BuildContext context) {
  var pastBrews = [
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
    'Coffee',
  ];
  return ListView.separated(
    itemCount: pastBrews.length,
    itemBuilder: (context, index) {
      return ListTile(
          title: Text(pastBrews[index]), trailing: Icon(Icons.favorite_border));
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}
