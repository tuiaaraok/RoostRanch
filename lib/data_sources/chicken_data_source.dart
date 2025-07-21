import 'package:chickenman/core/drift/tables.dart';
import 'package:chickenman/model/chicken_model.dart';
import 'package:drift/drift.dart';
import 'package:intl/intl.dart';

class ChickenDataSource {
  final AppDatabase _db;
  ChickenDataSource(this._db);

  Future<ChickenData?> getChicken({required int chickenId}) async {
    final chicken =
        (_db.select(_db.chicken)
          ..where((ctb) => ctb.id.equals(chickenId))).getSingleOrNull();
    return chicken;
  }

  Future addChicken({required ChickenModel chicken}) async {
    await _db
        .into(_db.chicken)
        .insert(
          ChickenCompanion.insert(
            name: chicken.name,
            breed: chicken.breed,
            dateOfBirth: chicken.dateOfBirth,
            weight: chicken.weight,
            eggProduction: chicken.eggProduction,
          ),
        );
  }

  Stream<Map<String, List<Map<String, dynamic>>>>
  watchCollectionEggsGroupedByDate() {
    // Create a stream from the table query
    final stream =
        _db.select(_db.collectionEggs).join([
          innerJoin(
            _db.eggVariety,
            _db.eggVariety.id.equalsExp(_db.collectionEggs.idEggVariety),
          ),
        ]).watch();

    // Transform the stream to group and sort the data
    return stream.map((results) {
      final grouped = <String, List<Map<String, dynamic>>>{};

      for (final row in results) {
        final collection = row.readTable(_db.collectionEggs);
        final variety = row.readTable(_db.eggVariety);

        final dateKey = DateFormat(
          'dd/MM/yyyy',
        ).format(collection.collectionDate);

        final entry = {
          'quantity': collection.quantity,
          'pricePerPiece': collection.pricePerPiece,
          'EggVarietyName': variety.name,
          'idChicken': collection.idChicken, // Add chicken ID for lookup
        };

        grouped.putIfAbsent(dateKey, () => []).add(entry);
      }

      // Sort dates from newest to oldest
      final sortedKeys =
          grouped.keys.toList()..sort((a, b) {
            final dateA = DateFormat('dd/MM/yyyy').parse(a);
            final dateB = DateFormat('dd/MM/yyyy').parse(b);
            return dateB.compareTo(dateA);
          });

      // Create a new sorted Map
      final sortedMap = <String, List<Map<String, dynamic>>>{};
      for (final key in sortedKeys) {
        sortedMap[key] = grouped[key]!;
      }

      return sortedMap;
    });
  }

  Future updateChicken(ChickenData chicken) async {
    await (_db.update(_db.chicken)
      ..where((filter) => filter.id.equals(chicken.id))).write(chicken);
  }

  Future addCollectingEggs(
    int chickenId,
    int eggVarietyId,
    int quantity,
    int pricePerPiece,
  ) async {
    await _db
        .into(_db.collectionEggs)
        .insert(
          CollectionEggsCompanion.insert(
            idChicken: chickenId,
            idEggVariety: eggVarietyId,
            quantity: quantity, // Use the parameter
            pricePerPiece: pricePerPiece, // Use the parameter
            collectionDate: DateTime.now(),
          ),
        );
  }

  Future<int> addEggVariety(String eggVarietyName) async {
    return await _db
        .into(_db.eggVariety)
        .insert(EggVarietyCompanion.insert(name: eggVarietyName));
  }

  Future<Map<String, List<Map<String, dynamic>>>>
  getSaleEggsGroupedByDate() async {
    // Запрос с JOIN между SaleEggs и EggVariety
    final query = _db.select(_db.saleEggs).join([
      innerJoin(
        _db.eggVariety,
        _db.eggVariety.id.equalsExp(_db.saleEggs.idEggVariety),
      ),
    ]);

    final results = await query.get();

    // Группировка по дате
    final grouped = <String, List<Map<String, dynamic>>>{};

    for (final row in results) {
      final sale = row.readTable(_db.saleEggs);
      final variety = row.readTable(_db.eggVariety);

      final dateKey = DateFormat('dd/MM/yyyy').format(sale.dateSale);
      final totalAmount = sale.quantitySale * sale.pricePerPiece; // Общая сумма

      final entry = {
        'EggVarietyName': variety.name,
        'quantitySale': sale.quantitySale,
        'totalAmount': totalAmount, // Добавляем вычисляемое поле
        'pricePerPiece': sale.pricePerPiece, // Опционально, если нужно
      };

      grouped.putIfAbsent(dateKey, () => []).add(entry);
    }

    // Сортировка дат от новых к старым
    final sortedKeys =
        grouped.keys.toList()..sort((a, b) {
          final dateA = DateFormat('dd/MM/yyyy').parse(a);
          final dateB = DateFormat('dd/MM/yyyy').parse(b);
          return dateB.compareTo(dateA); // Сортировка по убыванию
        });

    // Создаем отсортированный Map
    final sortedMap = <String, List<Map<String, dynamic>>>{};
    for (final key in sortedKeys) {
      sortedMap[key] = grouped[key]!;
    }

    return sortedMap;
  }

  Stream<List<ChickenData>> watchChickenList() {
    return _db.select(_db.chicken).watch();
  }

  Future<List<ChickenData>> getChickenNameList() async {
    final chickenList = await _db.select(_db.chicken).get();

    return chickenList;
  }

  Future<List<EggVarietyData>> getEggVarietyList() async {
    final eggVarietyList = await _db.select(_db.eggVariety).get();

    return eggVarietyList;
  }

  Future<List<ChickenData>> getChickenList() async {
    final chickenList = await _db.select(_db.chicken).get();
    return chickenList;
  }

  // For egg sales
  Stream<Map<String, List<Map<String, dynamic>>>> watchSaleEggsGroupedByDate() {
    final stream =
        _db.select(_db.saleEggs).join([
          innerJoin(
            _db.eggVariety,
            _db.eggVariety.id.equalsExp(_db.saleEggs.idEggVariety),
          ),
        ]).watch();

    return stream.map((results) {
      final grouped = <String, List<Map<String, dynamic>>>{};

      for (final row in results) {
        final sale = row.readTable(_db.saleEggs);
        final variety = row.readTable(_db.eggVariety);

        final dateKey = DateFormat('dd/MM/yyyy').format(sale.dateSale);

        final entry = {
          'quantity': sale.quantitySale,
          'pricePerPiece': sale.pricePerPiece,
          'EggVarietyName': variety.name,
          'totalAmount': sale.quantitySale * sale.pricePerPiece,
        };

        grouped.putIfAbsent(dateKey, () => []).add(entry);
      }

      final sortedKeys =
          grouped.keys.toList()..sort((a, b) {
            final dateA = DateFormat('dd/MM/yyyy').parse(a);
            final dateB = DateFormat('dd/MM/yyyy').parse(b);
            return dateB.compareTo(dateA);
          });

      final sortedMap = <String, List<Map<String, dynamic>>>{};
      for (final key in sortedKeys) {
        sortedMap[key] = grouped[key]!;
      }

      return sortedMap;
    });
  }

  Future<void> addSaleChicken(
    int chickenId,
    int quantity,
    int pricePerPiece,
  ) async {
    await _db
        .into(_db.saleChicken)
        .insert(
          SaleChickenCompanion.insert(
            idChicken: chickenId,
            quantitySale: quantity,
            pricePerPiece: pricePerPiece,
            dateSale: DateTime.now(),
          ),
        );
  }

  Future<void> addSaleEggs(
    int eggVarietyId,
    int quantity,
    int pricePerPiece,
  ) async {
    await _db
        .into(_db.saleEggs)
        .insert(
          SaleEggsCompanion.insert(
            idEggVariety: eggVarietyId,
            quantitySale: quantity,
            pricePerPiece: pricePerPiece,
            dateSale: DateTime.now(),
          ),
        );
  }

  // For chicken sales
  Stream<Map<String, List<Map<String, dynamic>>>>
  watchSaleChickensGroupedByDate() {
    final stream =
        _db.select(_db.saleChicken).join([
          innerJoin(
            _db.chicken,
            _db.chicken.id.equalsExp(_db.saleChicken.idChicken),
          ),
        ]).watch();

    return stream.map((results) {
      final grouped = <String, List<Map<String, dynamic>>>{};

      for (final row in results) {
        final sale = row.readTable(_db.saleChicken);
        final chicken = row.readTable(_db.chicken);

        final dateKey = DateFormat('dd/MM/yyyy').format(sale.dateSale);

        final entry = {
          'quantity': sale.quantitySale,
          'pricePerPiece': sale.pricePerPiece,
          'ChickenName': chicken.name,
          'totalAmount': sale.quantitySale * sale.pricePerPiece,
        };

        grouped.putIfAbsent(dateKey, () => []).add(entry);
      }

      final sortedKeys =
          grouped.keys.toList()..sort((a, b) {
            final dateA = DateFormat('dd/MM/yyyy').parse(a);
            final dateB = DateFormat('dd/MM/yyyy').parse(b);
            return dateB.compareTo(dateA);
          });

      final sortedMap = <String, List<Map<String, dynamic>>>{};
      for (final key in sortedKeys) {
        sortedMap[key] = grouped[key]!;
      }

      return sortedMap;
    });
  }
}
