import 'database/databaseDefinitions.dart';

class CoffeeCardModel {
  int id;
  String lastUseDate;
  String country;
  String region;
  String roastDate;
  int packageSize;

  CoffeeCardModel(
      {this.id,
      this.lastUseDate,
      this.country,
      this.region,
      this.roastDate,
      this.packageSize});

  Map<String, dynamic> toMap() {
    return {
      columnCoffeeCardLastUseDate: lastUseDate,
      columnCoffeeCardCountry: country,
      columnCoffeeCardRegion: region,
      columnCoffeeCardRoastDate: roastDate,
      columnCoffeeCardPackageSize: packageSize
    };
  }
}

class BrewModel {
  int coffeeCardId;
  int temperature;
  int grindSize;
  int bloom;

  BrewModel({this.coffeeCardId, this.temperature, this.grindSize, this.bloom});

  Map<String, dynamic> toMap() {
    return {
      columnBrewCoffeeCardId: coffeeCardId,
      columnBrewTemperature: temperature,
      columnBrewGrindSize: grindSize,
      columnBrewBloom: bloom
    };
  }
}
