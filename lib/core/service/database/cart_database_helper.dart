import 'package:e_commerce/core/constance.dart';
import 'package:e_commerce/core/model/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();
  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDb();
    return _database!;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tableCartProduct(
          $columnName TEXT NOT NULL, 
          $columnImage TEXT NOT NULL, 
          $columnPrice TEXT NOT NULL, 
          $columnQuantity INTEGER NOT NULL,
          $columnProductId TEXT NOT NULL)
         ''');
      },
    );
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  // Future<List<CartProductModel>> getAllProduct() async {
  //   var dbClient = await database;
  //   List<Map> maps = await dbClient.query(tableCartProduct);
  //   List<CartProductModel> list = maps.isNotEmpty
  //       ? maps.map((product) => CartProductModel.fromJson(product)).toList()
  //       : [];
  //   dbClient.rawQuery('SELECT *FROM $tableCartProduct').then((value) {
  //     for (var element in value) {
  //       if (element[columnStatus] == 'new') {
  //         currentOrder
  //             .map((product) => CartProductModel.fromJson(element))
  //             .toList();
  //       } else {
  //         doneOrder
  //             .map((product) => CartProductModel.fromJson(element))
  //             .toList();
  //       }
  //     }
  //   });
  //   return list;
  // }

  // List<CartProductModel> currentOrder = [];
  // List<dynamic> doneOrder = [];
  // getAllProduct(database) async {
  //   newOrder = [];
  //   doneOrder = [];
  //   // emit(AppGetDatabaseLoadingState());
  //   var dbClient = await database;

  //   dbClient.rawQuery('SELECT *FROM khatma').then(
  //     (value) {
  //       value.forEach((element) {
  //         if (element['status'] == 'new') {
  //           newOrder.add(element);
  //         } else {
  //           doneOrder.add(element);
  //         }
  //       });

  //       // emit(AppGetDatabaseState());
  //     },
  //   );
  // }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(
      tableCartProduct,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, model.toJson(),
        where: '$columnProductId = ?', whereArgs: [model.productId]);
  }

  deleteProduct({
    required String id,
  }) async {
    var dbClient = await database;

    dbClient.rawDelete(
        'DELETE FROM $tableCartProduct WHERE $columnProductId = ?',
        [id]).then((value) {
      // getAllProduct();
      debugPrint('delete succccccccccccccccccccccc');
    });
  }
}
