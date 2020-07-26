import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffeebook/newCoffee/newCoffee.dart';
import 'package:flutter/material.dart';

import '../database/databaseHelpers.dart';
import '../models.dart';
import 'coffeeCard.dart';

class CoffeeCarousel extends StatefulWidget {
  CoffeeCarousel({Key key}) : super(key: key);
  @override
  _CoffeeCarouselState createState() => _CoffeeCarouselState();
}

class _CoffeeCarouselState extends State<CoffeeCarousel> {
  DatabaseHelpers db = DatabaseHelpers();
  List<CoffeeCardModel> coffeeCards;
  @override
  initState() {
    super.initState();

    db.getCoffeeCards().then((List<CoffeeCardModel> output) {
      setState(() {
        coffeeCards = output;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (coffeeCards == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (coffeeCards.isNotEmpty) {
      coffeeCards.sort((a, b) => DateTime.parse(a.lastUseDate)
          .compareTo(DateTime.parse(b.lastUseDate)));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => NewCoffee()));
        },
        child: Icon(Icons.add),
      ),
      body: Center(
        child: CarouselSlider(
          height: MediaQuery.of(context).size.height,
          enableInfiniteScroll: false,
          autoPlay: false,
          onPageChanged: (index) {
            setState(() {});
          },
          items: coffeeCards.map(
            (coffee) {
              return Builder(
                builder: (BuildContext context) {
                  return CoffeeCard(
                    img: 'assets/kenya.jpg',
                    text: coffee.country,
                    subtext: coffee.region,
                  );
                },
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
