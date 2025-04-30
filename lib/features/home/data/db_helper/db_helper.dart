import 'package:sqflite/sqflite.dart';

import '../models/meal_model.dart';

Database? database;

List<Map> meals = [];
Future<void> createDatabase() async {
  database = await openDatabase('meals.db', version: 3,
      onCreate: (Database db, int version) async {
        //print('database created');
        await db
            .execute(
            'CREATE TABLE meals (id INTEGER PRIMARY KEY, name TEXT, imageUrl TEXT, rate TEXT, time TEXT, description TEXT)')
            .then((value) => //print('table created')
        null)
            .catchError((e) {
          throw e;
        });
      }, onOpen: (database) async {
        //print('database opened');
        await getDataFromDatabase(database).then((value) {
          meals = value;
          print(meals);
        });
      });
}

Future<void> insertIntoDatabase({required MealModel meal}) async {
  return await database?.transaction((txn) async {
    await txn
        .rawInsert(
        'INSERT INTO meals(name, imageUrl, rate, time, description) VALUES("${meal.title}", "${meal.img}", "${meal.rate}", "${meal.time}", "${meal.description}")')
        .then((value) => value)
        .catchError((e) {
      throw e;
    });
    //print('inserted1: $id1');
  });
}

Future<List<Map>> getDataFromDatabase(database) async {
  return await database.rawQuery('SELECT * FROM meals');
}