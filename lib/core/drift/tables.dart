// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'tables.g.dart';

class Chicken extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get breed => text()();
  DateTimeColumn get dateOfBirth => dateTime()();
  RealColumn get weight => real()();
  RealColumn get eggProduction => real()();
}

class EggVariety extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().unique()();
}

class CollectionEggs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idChicken => integer().references(Chicken, #id)();
  IntColumn get idEggVariety => integer().references(EggVariety, #id)();
  IntColumn get quantity => integer()();
  IntColumn get pricePerPiece => integer()();
  DateTimeColumn get collectionDate => dateTime()();
}

class SaleEggs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idEggVariety => integer().references(EggVariety, #id)();
  DateTimeColumn get dateSale => dateTime()();
  IntColumn get quantitySale => integer()();
  IntColumn get pricePerPiece => integer()();
}

class SaleChicken extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get idChicken => integer().references(Chicken, #id)();
  DateTimeColumn get dateSale => dateTime()();
  IntColumn get quantitySale => integer()();
  IntColumn get pricePerPiece => integer()();
}

@DriftDatabase(
  tables: [Chicken, EggVariety, CollectionEggs, SaleEggs, SaleChicken],
)
@singleton
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(path.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
