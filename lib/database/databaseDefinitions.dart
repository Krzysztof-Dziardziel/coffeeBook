const String databaseName = "db1";

//table for coffeecards
const String tableCoffeeCard = 'coffeeCard';
const String columnCoffeeCardId = '_id';
const String columnCoffeeCardLastUseDate = 'lastUseDate';
const String columnCoffeeCardCountry = 'country';
const String columnCoffeeCardRegion = 'region';
const String columnCoffeeCardRoastDate = 'roastDate';
const String columnCoffeeCardPackageSize = 'packageSize';

// table for brews
const String tableBrew = 'brew';
const String columnBrewId = '_id';
const String columnBrewCoffeeCardId = 'coffeeCardId'; //relacja do coffecards
const String columnBrewTemperature = 'temperature';
const String columnBrewGrindSize = 'grindSize';
const String columnBrewBloom = 'bloom';
