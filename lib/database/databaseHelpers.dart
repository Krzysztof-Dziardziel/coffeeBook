import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

import 'package:coffeebook/database/databaseDefinitions.dart';
import 'package:coffeebook/models.dart';

class DatabaseHelpers {
  //otwiera baze danych
  final Future<Database> database = getDatabasesPath().then((String path) =>
      openDatabase(join(path, databaseName), version: 5,
          onCreate: (db, version) {
        db.execute('''
          create table $tableCoffeeCard ( 
            $columnCoffeeCardId integer primary key autoincrement,
            $columnCoffeeCardLastUseDate text not null, 
            $columnCoffeeCardCountry text not null,
            $columnCoffeeCardRegion text,
            $columnCoffeeCardRoastDate text not null,
            $columnCoffeeCardPackageSize integer not null)''');
        db.execute('''
          create table $tableBrew ( 
            $columnBrewId integer primary key autoincrement,
            $columnBrewCoffeeCardId integer not null,
            $columnBrewTemperature integer,
            $columnBrewGrindSize integer,
            $columnBrewBloom integer,
            foreign key ($columnBrewCoffeeCardId) 
              references $columnCoffeeCardId ($columnBrewCoffeeCardId))''');
      }));

  //dodaje coffeeCard
  Future<void> addCoffeeCard(CoffeeCardModel coffeeCard) async {
    Database db = await database;
    await db.insert(tableCoffeeCard, coffeeCard.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace); //sprawdzic co to robi
  }

  //dodaje brew
  Future<void> addBrew(BrewModel brew) async {
    Database db = await database;
    await db.insert(tableBrew, brew.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  //zwraca wszystkie coffeeCards
  Future<List<CoffeeCardModel>> getCoffeeCards() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableCoffeeCard);
    return List.generate(maps.length, (i) {
      return CoffeeCardModel(
          id: maps[i][columnCoffeeCardId],
          lastUseDate: maps[i][columnCoffeeCardLastUseDate],
          country: maps[i][columnCoffeeCardCountry],
          region: maps[i][columnCoffeeCardRegion],
          roastDate: maps[i][columnCoffeeCardRoastDate],
          packageSize: maps[i][columnCoffeeCardPackageSize]);
    });
  }

  //zwraca wszystkie brew
  Future<List<BrewModel>> getBrews() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableBrew);
    return List.generate(maps.length, (i) {
      return BrewModel(
          coffeeCardId: maps[i][columnBrewCoffeeCardId],
          temperature: maps[i][columnBrewTemperature],
          grindSize: maps[i][columnBrewGrindSize],
          bloom: maps[i][columnBrewBloom]);
    });
  }

  Future<void> clean() async {
    final Database db = await database;
    await db.delete(tableBrew);
    await db.delete(tableCoffeeCard);
  }
}
