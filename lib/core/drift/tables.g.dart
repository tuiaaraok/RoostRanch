// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tables.dart';

// ignore_for_file: type=lint
class $ChickenTable extends Chicken with TableInfo<$ChickenTable, ChickenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChickenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedMeta = const VerificationMeta('breed');
  @override
  late final GeneratedColumn<String> breed = GeneratedColumn<String>(
    'breed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateOfBirthMeta = const VerificationMeta(
    'dateOfBirth',
  );
  @override
  late final GeneratedColumn<DateTime> dateOfBirth = GeneratedColumn<DateTime>(
    'date_of_birth',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<double> weight = GeneratedColumn<double>(
    'weight',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eggProductionMeta = const VerificationMeta(
    'eggProduction',
  );
  @override
  late final GeneratedColumn<double> eggProduction = GeneratedColumn<double>(
    'egg_production',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    breed,
    dateOfBirth,
    weight,
    eggProduction,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chicken';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChickenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('breed')) {
      context.handle(
        _breedMeta,
        breed.isAcceptableOrUnknown(data['breed']!, _breedMeta),
      );
    } else if (isInserting) {
      context.missing(_breedMeta);
    }
    if (data.containsKey('date_of_birth')) {
      context.handle(
        _dateOfBirthMeta,
        dateOfBirth.isAcceptableOrUnknown(
          data['date_of_birth']!,
          _dateOfBirthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dateOfBirthMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('egg_production')) {
      context.handle(
        _eggProductionMeta,
        eggProduction.isAcceptableOrUnknown(
          data['egg_production']!,
          _eggProductionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eggProductionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChickenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChickenData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      breed:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed'],
          )!,
      dateOfBirth:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_of_birth'],
          )!,
      weight:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}weight'],
          )!,
      eggProduction:
          attachedDatabase.typeMapping.read(
            DriftSqlType.double,
            data['${effectivePrefix}egg_production'],
          )!,
    );
  }

  @override
  $ChickenTable createAlias(String alias) {
    return $ChickenTable(attachedDatabase, alias);
  }
}

class ChickenData extends DataClass implements Insertable<ChickenData> {
  final int id;
  final String name;
  final String breed;
  final DateTime dateOfBirth;
  final double weight;
  final double eggProduction;
  const ChickenData({
    required this.id,
    required this.name,
    required this.breed,
    required this.dateOfBirth,
    required this.weight,
    required this.eggProduction,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['breed'] = Variable<String>(breed);
    map['date_of_birth'] = Variable<DateTime>(dateOfBirth);
    map['weight'] = Variable<double>(weight);
    map['egg_production'] = Variable<double>(eggProduction);
    return map;
  }

  ChickenCompanion toCompanion(bool nullToAbsent) {
    return ChickenCompanion(
      id: Value(id),
      name: Value(name),
      breed: Value(breed),
      dateOfBirth: Value(dateOfBirth),
      weight: Value(weight),
      eggProduction: Value(eggProduction),
    );
  }

  factory ChickenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChickenData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      breed: serializer.fromJson<String>(json['breed']),
      dateOfBirth: serializer.fromJson<DateTime>(json['dateOfBirth']),
      weight: serializer.fromJson<double>(json['weight']),
      eggProduction: serializer.fromJson<double>(json['eggProduction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'breed': serializer.toJson<String>(breed),
      'dateOfBirth': serializer.toJson<DateTime>(dateOfBirth),
      'weight': serializer.toJson<double>(weight),
      'eggProduction': serializer.toJson<double>(eggProduction),
    };
  }

  ChickenData copyWith({
    int? id,
    String? name,
    String? breed,
    DateTime? dateOfBirth,
    double? weight,
    double? eggProduction,
  }) => ChickenData(
    id: id ?? this.id,
    name: name ?? this.name,
    breed: breed ?? this.breed,
    dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    weight: weight ?? this.weight,
    eggProduction: eggProduction ?? this.eggProduction,
  );
  ChickenData copyWithCompanion(ChickenCompanion data) {
    return ChickenData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      breed: data.breed.present ? data.breed.value : this.breed,
      dateOfBirth:
          data.dateOfBirth.present ? data.dateOfBirth.value : this.dateOfBirth,
      weight: data.weight.present ? data.weight.value : this.weight,
      eggProduction:
          data.eggProduction.present
              ? data.eggProduction.value
              : this.eggProduction,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChickenData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('weight: $weight, ')
          ..write('eggProduction: $eggProduction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, breed, dateOfBirth, weight, eggProduction);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChickenData &&
          other.id == this.id &&
          other.name == this.name &&
          other.breed == this.breed &&
          other.dateOfBirth == this.dateOfBirth &&
          other.weight == this.weight &&
          other.eggProduction == this.eggProduction);
}

class ChickenCompanion extends UpdateCompanion<ChickenData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> breed;
  final Value<DateTime> dateOfBirth;
  final Value<double> weight;
  final Value<double> eggProduction;
  const ChickenCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.breed = const Value.absent(),
    this.dateOfBirth = const Value.absent(),
    this.weight = const Value.absent(),
    this.eggProduction = const Value.absent(),
  });
  ChickenCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String breed,
    required DateTime dateOfBirth,
    required double weight,
    required double eggProduction,
  }) : name = Value(name),
       breed = Value(breed),
       dateOfBirth = Value(dateOfBirth),
       weight = Value(weight),
       eggProduction = Value(eggProduction);
  static Insertable<ChickenData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? breed,
    Expression<DateTime>? dateOfBirth,
    Expression<double>? weight,
    Expression<double>? eggProduction,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (breed != null) 'breed': breed,
      if (dateOfBirth != null) 'date_of_birth': dateOfBirth,
      if (weight != null) 'weight': weight,
      if (eggProduction != null) 'egg_production': eggProduction,
    });
  }

  ChickenCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? breed,
    Value<DateTime>? dateOfBirth,
    Value<double>? weight,
    Value<double>? eggProduction,
  }) {
    return ChickenCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      breed: breed ?? this.breed,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      weight: weight ?? this.weight,
      eggProduction: eggProduction ?? this.eggProduction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (breed.present) {
      map['breed'] = Variable<String>(breed.value);
    }
    if (dateOfBirth.present) {
      map['date_of_birth'] = Variable<DateTime>(dateOfBirth.value);
    }
    if (weight.present) {
      map['weight'] = Variable<double>(weight.value);
    }
    if (eggProduction.present) {
      map['egg_production'] = Variable<double>(eggProduction.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChickenCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('breed: $breed, ')
          ..write('dateOfBirth: $dateOfBirth, ')
          ..write('weight: $weight, ')
          ..write('eggProduction: $eggProduction')
          ..write(')'))
        .toString();
  }
}

class $EggVarietyTable extends EggVariety
    with TableInfo<$EggVarietyTable, EggVarietyData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EggVarietyTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'egg_variety';
  @override
  VerificationContext validateIntegrity(
    Insertable<EggVarietyData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  EggVarietyData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EggVarietyData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
    );
  }

  @override
  $EggVarietyTable createAlias(String alias) {
    return $EggVarietyTable(attachedDatabase, alias);
  }
}

class EggVarietyData extends DataClass implements Insertable<EggVarietyData> {
  final int id;
  final String name;
  const EggVarietyData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  EggVarietyCompanion toCompanion(bool nullToAbsent) {
    return EggVarietyCompanion(id: Value(id), name: Value(name));
  }

  factory EggVarietyData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EggVarietyData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  EggVarietyData copyWith({int? id, String? name}) =>
      EggVarietyData(id: id ?? this.id, name: name ?? this.name);
  EggVarietyData copyWithCompanion(EggVarietyCompanion data) {
    return EggVarietyData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EggVarietyData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EggVarietyData &&
          other.id == this.id &&
          other.name == this.name);
}

class EggVarietyCompanion extends UpdateCompanion<EggVarietyData> {
  final Value<int> id;
  final Value<String> name;
  const EggVarietyCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  EggVarietyCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<EggVarietyData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  EggVarietyCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return EggVarietyCompanion(id: id ?? this.id, name: name ?? this.name);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EggVarietyCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $CollectionEggsTable extends CollectionEggs
    with TableInfo<$CollectionEggsTable, CollectionEgg> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CollectionEggsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idChickenMeta = const VerificationMeta(
    'idChicken',
  );
  @override
  late final GeneratedColumn<int> idChicken = GeneratedColumn<int>(
    'id_chicken',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chicken (id)',
    ),
  );
  static const VerificationMeta _idEggVarietyMeta = const VerificationMeta(
    'idEggVariety',
  );
  @override
  late final GeneratedColumn<int> idEggVariety = GeneratedColumn<int>(
    'id_egg_variety',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES egg_variety (id)',
    ),
  );
  static const VerificationMeta _quantityMeta = const VerificationMeta(
    'quantity',
  );
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
    'quantity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerPieceMeta = const VerificationMeta(
    'pricePerPiece',
  );
  @override
  late final GeneratedColumn<int> pricePerPiece = GeneratedColumn<int>(
    'price_per_piece',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _collectionDateMeta = const VerificationMeta(
    'collectionDate',
  );
  @override
  late final GeneratedColumn<DateTime> collectionDate =
      GeneratedColumn<DateTime>(
        'collection_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idChicken,
    idEggVariety,
    quantity,
    pricePerPiece,
    collectionDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'collection_eggs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CollectionEgg> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_chicken')) {
      context.handle(
        _idChickenMeta,
        idChicken.isAcceptableOrUnknown(data['id_chicken']!, _idChickenMeta),
      );
    } else if (isInserting) {
      context.missing(_idChickenMeta);
    }
    if (data.containsKey('id_egg_variety')) {
      context.handle(
        _idEggVarietyMeta,
        idEggVariety.isAcceptableOrUnknown(
          data['id_egg_variety']!,
          _idEggVarietyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idEggVarietyMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(
        _quantityMeta,
        quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta),
      );
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('price_per_piece')) {
      context.handle(
        _pricePerPieceMeta,
        pricePerPiece.isAcceptableOrUnknown(
          data['price_per_piece']!,
          _pricePerPieceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerPieceMeta);
    }
    if (data.containsKey('collection_date')) {
      context.handle(
        _collectionDateMeta,
        collectionDate.isAcceptableOrUnknown(
          data['collection_date']!,
          _collectionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_collectionDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CollectionEgg map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CollectionEgg(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      idChicken:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_chicken'],
          )!,
      idEggVariety:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_egg_variety'],
          )!,
      quantity:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}quantity'],
          )!,
      pricePerPiece:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}price_per_piece'],
          )!,
      collectionDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}collection_date'],
          )!,
    );
  }

  @override
  $CollectionEggsTable createAlias(String alias) {
    return $CollectionEggsTable(attachedDatabase, alias);
  }
}

class CollectionEgg extends DataClass implements Insertable<CollectionEgg> {
  final int id;
  final int idChicken;
  final int idEggVariety;
  final int quantity;
  final int pricePerPiece;
  final DateTime collectionDate;
  const CollectionEgg({
    required this.id,
    required this.idChicken,
    required this.idEggVariety,
    required this.quantity,
    required this.pricePerPiece,
    required this.collectionDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_chicken'] = Variable<int>(idChicken);
    map['id_egg_variety'] = Variable<int>(idEggVariety);
    map['quantity'] = Variable<int>(quantity);
    map['price_per_piece'] = Variable<int>(pricePerPiece);
    map['collection_date'] = Variable<DateTime>(collectionDate);
    return map;
  }

  CollectionEggsCompanion toCompanion(bool nullToAbsent) {
    return CollectionEggsCompanion(
      id: Value(id),
      idChicken: Value(idChicken),
      idEggVariety: Value(idEggVariety),
      quantity: Value(quantity),
      pricePerPiece: Value(pricePerPiece),
      collectionDate: Value(collectionDate),
    );
  }

  factory CollectionEgg.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CollectionEgg(
      id: serializer.fromJson<int>(json['id']),
      idChicken: serializer.fromJson<int>(json['idChicken']),
      idEggVariety: serializer.fromJson<int>(json['idEggVariety']),
      quantity: serializer.fromJson<int>(json['quantity']),
      pricePerPiece: serializer.fromJson<int>(json['pricePerPiece']),
      collectionDate: serializer.fromJson<DateTime>(json['collectionDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idChicken': serializer.toJson<int>(idChicken),
      'idEggVariety': serializer.toJson<int>(idEggVariety),
      'quantity': serializer.toJson<int>(quantity),
      'pricePerPiece': serializer.toJson<int>(pricePerPiece),
      'collectionDate': serializer.toJson<DateTime>(collectionDate),
    };
  }

  CollectionEgg copyWith({
    int? id,
    int? idChicken,
    int? idEggVariety,
    int? quantity,
    int? pricePerPiece,
    DateTime? collectionDate,
  }) => CollectionEgg(
    id: id ?? this.id,
    idChicken: idChicken ?? this.idChicken,
    idEggVariety: idEggVariety ?? this.idEggVariety,
    quantity: quantity ?? this.quantity,
    pricePerPiece: pricePerPiece ?? this.pricePerPiece,
    collectionDate: collectionDate ?? this.collectionDate,
  );
  CollectionEgg copyWithCompanion(CollectionEggsCompanion data) {
    return CollectionEgg(
      id: data.id.present ? data.id.value : this.id,
      idChicken: data.idChicken.present ? data.idChicken.value : this.idChicken,
      idEggVariety:
          data.idEggVariety.present
              ? data.idEggVariety.value
              : this.idEggVariety,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      pricePerPiece:
          data.pricePerPiece.present
              ? data.pricePerPiece.value
              : this.pricePerPiece,
      collectionDate:
          data.collectionDate.present
              ? data.collectionDate.value
              : this.collectionDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CollectionEgg(')
          ..write('id: $id, ')
          ..write('idChicken: $idChicken, ')
          ..write('idEggVariety: $idEggVariety, ')
          ..write('quantity: $quantity, ')
          ..write('pricePerPiece: $pricePerPiece, ')
          ..write('collectionDate: $collectionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    idChicken,
    idEggVariety,
    quantity,
    pricePerPiece,
    collectionDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CollectionEgg &&
          other.id == this.id &&
          other.idChicken == this.idChicken &&
          other.idEggVariety == this.idEggVariety &&
          other.quantity == this.quantity &&
          other.pricePerPiece == this.pricePerPiece &&
          other.collectionDate == this.collectionDate);
}

class CollectionEggsCompanion extends UpdateCompanion<CollectionEgg> {
  final Value<int> id;
  final Value<int> idChicken;
  final Value<int> idEggVariety;
  final Value<int> quantity;
  final Value<int> pricePerPiece;
  final Value<DateTime> collectionDate;
  const CollectionEggsCompanion({
    this.id = const Value.absent(),
    this.idChicken = const Value.absent(),
    this.idEggVariety = const Value.absent(),
    this.quantity = const Value.absent(),
    this.pricePerPiece = const Value.absent(),
    this.collectionDate = const Value.absent(),
  });
  CollectionEggsCompanion.insert({
    this.id = const Value.absent(),
    required int idChicken,
    required int idEggVariety,
    required int quantity,
    required int pricePerPiece,
    required DateTime collectionDate,
  }) : idChicken = Value(idChicken),
       idEggVariety = Value(idEggVariety),
       quantity = Value(quantity),
       pricePerPiece = Value(pricePerPiece),
       collectionDate = Value(collectionDate);
  static Insertable<CollectionEgg> custom({
    Expression<int>? id,
    Expression<int>? idChicken,
    Expression<int>? idEggVariety,
    Expression<int>? quantity,
    Expression<int>? pricePerPiece,
    Expression<DateTime>? collectionDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idChicken != null) 'id_chicken': idChicken,
      if (idEggVariety != null) 'id_egg_variety': idEggVariety,
      if (quantity != null) 'quantity': quantity,
      if (pricePerPiece != null) 'price_per_piece': pricePerPiece,
      if (collectionDate != null) 'collection_date': collectionDate,
    });
  }

  CollectionEggsCompanion copyWith({
    Value<int>? id,
    Value<int>? idChicken,
    Value<int>? idEggVariety,
    Value<int>? quantity,
    Value<int>? pricePerPiece,
    Value<DateTime>? collectionDate,
  }) {
    return CollectionEggsCompanion(
      id: id ?? this.id,
      idChicken: idChicken ?? this.idChicken,
      idEggVariety: idEggVariety ?? this.idEggVariety,
      quantity: quantity ?? this.quantity,
      pricePerPiece: pricePerPiece ?? this.pricePerPiece,
      collectionDate: collectionDate ?? this.collectionDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idChicken.present) {
      map['id_chicken'] = Variable<int>(idChicken.value);
    }
    if (idEggVariety.present) {
      map['id_egg_variety'] = Variable<int>(idEggVariety.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (pricePerPiece.present) {
      map['price_per_piece'] = Variable<int>(pricePerPiece.value);
    }
    if (collectionDate.present) {
      map['collection_date'] = Variable<DateTime>(collectionDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CollectionEggsCompanion(')
          ..write('id: $id, ')
          ..write('idChicken: $idChicken, ')
          ..write('idEggVariety: $idEggVariety, ')
          ..write('quantity: $quantity, ')
          ..write('pricePerPiece: $pricePerPiece, ')
          ..write('collectionDate: $collectionDate')
          ..write(')'))
        .toString();
  }
}

class $SaleEggsTable extends SaleEggs with TableInfo<$SaleEggsTable, SaleEgg> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleEggsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idEggVarietyMeta = const VerificationMeta(
    'idEggVariety',
  );
  @override
  late final GeneratedColumn<int> idEggVariety = GeneratedColumn<int>(
    'id_egg_variety',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES egg_variety (id)',
    ),
  );
  static const VerificationMeta _dateSaleMeta = const VerificationMeta(
    'dateSale',
  );
  @override
  late final GeneratedColumn<DateTime> dateSale = GeneratedColumn<DateTime>(
    'date_sale',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantitySaleMeta = const VerificationMeta(
    'quantitySale',
  );
  @override
  late final GeneratedColumn<int> quantitySale = GeneratedColumn<int>(
    'quantity_sale',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerPieceMeta = const VerificationMeta(
    'pricePerPiece',
  );
  @override
  late final GeneratedColumn<int> pricePerPiece = GeneratedColumn<int>(
    'price_per_piece',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idEggVariety,
    dateSale,
    quantitySale,
    pricePerPiece,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_eggs';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleEgg> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_egg_variety')) {
      context.handle(
        _idEggVarietyMeta,
        idEggVariety.isAcceptableOrUnknown(
          data['id_egg_variety']!,
          _idEggVarietyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idEggVarietyMeta);
    }
    if (data.containsKey('date_sale')) {
      context.handle(
        _dateSaleMeta,
        dateSale.isAcceptableOrUnknown(data['date_sale']!, _dateSaleMeta),
      );
    } else if (isInserting) {
      context.missing(_dateSaleMeta);
    }
    if (data.containsKey('quantity_sale')) {
      context.handle(
        _quantitySaleMeta,
        quantitySale.isAcceptableOrUnknown(
          data['quantity_sale']!,
          _quantitySaleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantitySaleMeta);
    }
    if (data.containsKey('price_per_piece')) {
      context.handle(
        _pricePerPieceMeta,
        pricePerPiece.isAcceptableOrUnknown(
          data['price_per_piece']!,
          _pricePerPieceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerPieceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleEgg map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleEgg(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      idEggVariety:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_egg_variety'],
          )!,
      dateSale:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_sale'],
          )!,
      quantitySale:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}quantity_sale'],
          )!,
      pricePerPiece:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}price_per_piece'],
          )!,
    );
  }

  @override
  $SaleEggsTable createAlias(String alias) {
    return $SaleEggsTable(attachedDatabase, alias);
  }
}

class SaleEgg extends DataClass implements Insertable<SaleEgg> {
  final int id;
  final int idEggVariety;
  final DateTime dateSale;
  final int quantitySale;
  final int pricePerPiece;
  const SaleEgg({
    required this.id,
    required this.idEggVariety,
    required this.dateSale,
    required this.quantitySale,
    required this.pricePerPiece,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_egg_variety'] = Variable<int>(idEggVariety);
    map['date_sale'] = Variable<DateTime>(dateSale);
    map['quantity_sale'] = Variable<int>(quantitySale);
    map['price_per_piece'] = Variable<int>(pricePerPiece);
    return map;
  }

  SaleEggsCompanion toCompanion(bool nullToAbsent) {
    return SaleEggsCompanion(
      id: Value(id),
      idEggVariety: Value(idEggVariety),
      dateSale: Value(dateSale),
      quantitySale: Value(quantitySale),
      pricePerPiece: Value(pricePerPiece),
    );
  }

  factory SaleEgg.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleEgg(
      id: serializer.fromJson<int>(json['id']),
      idEggVariety: serializer.fromJson<int>(json['idEggVariety']),
      dateSale: serializer.fromJson<DateTime>(json['dateSale']),
      quantitySale: serializer.fromJson<int>(json['quantitySale']),
      pricePerPiece: serializer.fromJson<int>(json['pricePerPiece']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idEggVariety': serializer.toJson<int>(idEggVariety),
      'dateSale': serializer.toJson<DateTime>(dateSale),
      'quantitySale': serializer.toJson<int>(quantitySale),
      'pricePerPiece': serializer.toJson<int>(pricePerPiece),
    };
  }

  SaleEgg copyWith({
    int? id,
    int? idEggVariety,
    DateTime? dateSale,
    int? quantitySale,
    int? pricePerPiece,
  }) => SaleEgg(
    id: id ?? this.id,
    idEggVariety: idEggVariety ?? this.idEggVariety,
    dateSale: dateSale ?? this.dateSale,
    quantitySale: quantitySale ?? this.quantitySale,
    pricePerPiece: pricePerPiece ?? this.pricePerPiece,
  );
  SaleEgg copyWithCompanion(SaleEggsCompanion data) {
    return SaleEgg(
      id: data.id.present ? data.id.value : this.id,
      idEggVariety:
          data.idEggVariety.present
              ? data.idEggVariety.value
              : this.idEggVariety,
      dateSale: data.dateSale.present ? data.dateSale.value : this.dateSale,
      quantitySale:
          data.quantitySale.present
              ? data.quantitySale.value
              : this.quantitySale,
      pricePerPiece:
          data.pricePerPiece.present
              ? data.pricePerPiece.value
              : this.pricePerPiece,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleEgg(')
          ..write('id: $id, ')
          ..write('idEggVariety: $idEggVariety, ')
          ..write('dateSale: $dateSale, ')
          ..write('quantitySale: $quantitySale, ')
          ..write('pricePerPiece: $pricePerPiece')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idEggVariety, dateSale, quantitySale, pricePerPiece);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleEgg &&
          other.id == this.id &&
          other.idEggVariety == this.idEggVariety &&
          other.dateSale == this.dateSale &&
          other.quantitySale == this.quantitySale &&
          other.pricePerPiece == this.pricePerPiece);
}

class SaleEggsCompanion extends UpdateCompanion<SaleEgg> {
  final Value<int> id;
  final Value<int> idEggVariety;
  final Value<DateTime> dateSale;
  final Value<int> quantitySale;
  final Value<int> pricePerPiece;
  const SaleEggsCompanion({
    this.id = const Value.absent(),
    this.idEggVariety = const Value.absent(),
    this.dateSale = const Value.absent(),
    this.quantitySale = const Value.absent(),
    this.pricePerPiece = const Value.absent(),
  });
  SaleEggsCompanion.insert({
    this.id = const Value.absent(),
    required int idEggVariety,
    required DateTime dateSale,
    required int quantitySale,
    required int pricePerPiece,
  }) : idEggVariety = Value(idEggVariety),
       dateSale = Value(dateSale),
       quantitySale = Value(quantitySale),
       pricePerPiece = Value(pricePerPiece);
  static Insertable<SaleEgg> custom({
    Expression<int>? id,
    Expression<int>? idEggVariety,
    Expression<DateTime>? dateSale,
    Expression<int>? quantitySale,
    Expression<int>? pricePerPiece,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idEggVariety != null) 'id_egg_variety': idEggVariety,
      if (dateSale != null) 'date_sale': dateSale,
      if (quantitySale != null) 'quantity_sale': quantitySale,
      if (pricePerPiece != null) 'price_per_piece': pricePerPiece,
    });
  }

  SaleEggsCompanion copyWith({
    Value<int>? id,
    Value<int>? idEggVariety,
    Value<DateTime>? dateSale,
    Value<int>? quantitySale,
    Value<int>? pricePerPiece,
  }) {
    return SaleEggsCompanion(
      id: id ?? this.id,
      idEggVariety: idEggVariety ?? this.idEggVariety,
      dateSale: dateSale ?? this.dateSale,
      quantitySale: quantitySale ?? this.quantitySale,
      pricePerPiece: pricePerPiece ?? this.pricePerPiece,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idEggVariety.present) {
      map['id_egg_variety'] = Variable<int>(idEggVariety.value);
    }
    if (dateSale.present) {
      map['date_sale'] = Variable<DateTime>(dateSale.value);
    }
    if (quantitySale.present) {
      map['quantity_sale'] = Variable<int>(quantitySale.value);
    }
    if (pricePerPiece.present) {
      map['price_per_piece'] = Variable<int>(pricePerPiece.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleEggsCompanion(')
          ..write('id: $id, ')
          ..write('idEggVariety: $idEggVariety, ')
          ..write('dateSale: $dateSale, ')
          ..write('quantitySale: $quantitySale, ')
          ..write('pricePerPiece: $pricePerPiece')
          ..write(')'))
        .toString();
  }
}

class $SaleChickenTable extends SaleChicken
    with TableInfo<$SaleChickenTable, SaleChickenData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SaleChickenTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idChickenMeta = const VerificationMeta(
    'idChicken',
  );
  @override
  late final GeneratedColumn<int> idChicken = GeneratedColumn<int>(
    'id_chicken',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES chicken (id)',
    ),
  );
  static const VerificationMeta _dateSaleMeta = const VerificationMeta(
    'dateSale',
  );
  @override
  late final GeneratedColumn<DateTime> dateSale = GeneratedColumn<DateTime>(
    'date_sale',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quantitySaleMeta = const VerificationMeta(
    'quantitySale',
  );
  @override
  late final GeneratedColumn<int> quantitySale = GeneratedColumn<int>(
    'quantity_sale',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pricePerPieceMeta = const VerificationMeta(
    'pricePerPiece',
  );
  @override
  late final GeneratedColumn<int> pricePerPiece = GeneratedColumn<int>(
    'price_per_piece',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    idChicken,
    dateSale,
    quantitySale,
    pricePerPiece,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sale_chicken';
  @override
  VerificationContext validateIntegrity(
    Insertable<SaleChickenData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('id_chicken')) {
      context.handle(
        _idChickenMeta,
        idChicken.isAcceptableOrUnknown(data['id_chicken']!, _idChickenMeta),
      );
    } else if (isInserting) {
      context.missing(_idChickenMeta);
    }
    if (data.containsKey('date_sale')) {
      context.handle(
        _dateSaleMeta,
        dateSale.isAcceptableOrUnknown(data['date_sale']!, _dateSaleMeta),
      );
    } else if (isInserting) {
      context.missing(_dateSaleMeta);
    }
    if (data.containsKey('quantity_sale')) {
      context.handle(
        _quantitySaleMeta,
        quantitySale.isAcceptableOrUnknown(
          data['quantity_sale']!,
          _quantitySaleMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quantitySaleMeta);
    }
    if (data.containsKey('price_per_piece')) {
      context.handle(
        _pricePerPieceMeta,
        pricePerPiece.isAcceptableOrUnknown(
          data['price_per_piece']!,
          _pricePerPieceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pricePerPieceMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SaleChickenData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SaleChickenData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      idChicken:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id_chicken'],
          )!,
      dateSale:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_sale'],
          )!,
      quantitySale:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}quantity_sale'],
          )!,
      pricePerPiece:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}price_per_piece'],
          )!,
    );
  }

  @override
  $SaleChickenTable createAlias(String alias) {
    return $SaleChickenTable(attachedDatabase, alias);
  }
}

class SaleChickenData extends DataClass implements Insertable<SaleChickenData> {
  final int id;
  final int idChicken;
  final DateTime dateSale;
  final int quantitySale;
  final int pricePerPiece;
  const SaleChickenData({
    required this.id,
    required this.idChicken,
    required this.dateSale,
    required this.quantitySale,
    required this.pricePerPiece,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['id_chicken'] = Variable<int>(idChicken);
    map['date_sale'] = Variable<DateTime>(dateSale);
    map['quantity_sale'] = Variable<int>(quantitySale);
    map['price_per_piece'] = Variable<int>(pricePerPiece);
    return map;
  }

  SaleChickenCompanion toCompanion(bool nullToAbsent) {
    return SaleChickenCompanion(
      id: Value(id),
      idChicken: Value(idChicken),
      dateSale: Value(dateSale),
      quantitySale: Value(quantitySale),
      pricePerPiece: Value(pricePerPiece),
    );
  }

  factory SaleChickenData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SaleChickenData(
      id: serializer.fromJson<int>(json['id']),
      idChicken: serializer.fromJson<int>(json['idChicken']),
      dateSale: serializer.fromJson<DateTime>(json['dateSale']),
      quantitySale: serializer.fromJson<int>(json['quantitySale']),
      pricePerPiece: serializer.fromJson<int>(json['pricePerPiece']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'idChicken': serializer.toJson<int>(idChicken),
      'dateSale': serializer.toJson<DateTime>(dateSale),
      'quantitySale': serializer.toJson<int>(quantitySale),
      'pricePerPiece': serializer.toJson<int>(pricePerPiece),
    };
  }

  SaleChickenData copyWith({
    int? id,
    int? idChicken,
    DateTime? dateSale,
    int? quantitySale,
    int? pricePerPiece,
  }) => SaleChickenData(
    id: id ?? this.id,
    idChicken: idChicken ?? this.idChicken,
    dateSale: dateSale ?? this.dateSale,
    quantitySale: quantitySale ?? this.quantitySale,
    pricePerPiece: pricePerPiece ?? this.pricePerPiece,
  );
  SaleChickenData copyWithCompanion(SaleChickenCompanion data) {
    return SaleChickenData(
      id: data.id.present ? data.id.value : this.id,
      idChicken: data.idChicken.present ? data.idChicken.value : this.idChicken,
      dateSale: data.dateSale.present ? data.dateSale.value : this.dateSale,
      quantitySale:
          data.quantitySale.present
              ? data.quantitySale.value
              : this.quantitySale,
      pricePerPiece:
          data.pricePerPiece.present
              ? data.pricePerPiece.value
              : this.pricePerPiece,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SaleChickenData(')
          ..write('id: $id, ')
          ..write('idChicken: $idChicken, ')
          ..write('dateSale: $dateSale, ')
          ..write('quantitySale: $quantitySale, ')
          ..write('pricePerPiece: $pricePerPiece')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, idChicken, dateSale, quantitySale, pricePerPiece);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SaleChickenData &&
          other.id == this.id &&
          other.idChicken == this.idChicken &&
          other.dateSale == this.dateSale &&
          other.quantitySale == this.quantitySale &&
          other.pricePerPiece == this.pricePerPiece);
}

class SaleChickenCompanion extends UpdateCompanion<SaleChickenData> {
  final Value<int> id;
  final Value<int> idChicken;
  final Value<DateTime> dateSale;
  final Value<int> quantitySale;
  final Value<int> pricePerPiece;
  const SaleChickenCompanion({
    this.id = const Value.absent(),
    this.idChicken = const Value.absent(),
    this.dateSale = const Value.absent(),
    this.quantitySale = const Value.absent(),
    this.pricePerPiece = const Value.absent(),
  });
  SaleChickenCompanion.insert({
    this.id = const Value.absent(),
    required int idChicken,
    required DateTime dateSale,
    required int quantitySale,
    required int pricePerPiece,
  }) : idChicken = Value(idChicken),
       dateSale = Value(dateSale),
       quantitySale = Value(quantitySale),
       pricePerPiece = Value(pricePerPiece);
  static Insertable<SaleChickenData> custom({
    Expression<int>? id,
    Expression<int>? idChicken,
    Expression<DateTime>? dateSale,
    Expression<int>? quantitySale,
    Expression<int>? pricePerPiece,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (idChicken != null) 'id_chicken': idChicken,
      if (dateSale != null) 'date_sale': dateSale,
      if (quantitySale != null) 'quantity_sale': quantitySale,
      if (pricePerPiece != null) 'price_per_piece': pricePerPiece,
    });
  }

  SaleChickenCompanion copyWith({
    Value<int>? id,
    Value<int>? idChicken,
    Value<DateTime>? dateSale,
    Value<int>? quantitySale,
    Value<int>? pricePerPiece,
  }) {
    return SaleChickenCompanion(
      id: id ?? this.id,
      idChicken: idChicken ?? this.idChicken,
      dateSale: dateSale ?? this.dateSale,
      quantitySale: quantitySale ?? this.quantitySale,
      pricePerPiece: pricePerPiece ?? this.pricePerPiece,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (idChicken.present) {
      map['id_chicken'] = Variable<int>(idChicken.value);
    }
    if (dateSale.present) {
      map['date_sale'] = Variable<DateTime>(dateSale.value);
    }
    if (quantitySale.present) {
      map['quantity_sale'] = Variable<int>(quantitySale.value);
    }
    if (pricePerPiece.present) {
      map['price_per_piece'] = Variable<int>(pricePerPiece.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SaleChickenCompanion(')
          ..write('id: $id, ')
          ..write('idChicken: $idChicken, ')
          ..write('dateSale: $dateSale, ')
          ..write('quantitySale: $quantitySale, ')
          ..write('pricePerPiece: $pricePerPiece')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ChickenTable chicken = $ChickenTable(this);
  late final $EggVarietyTable eggVariety = $EggVarietyTable(this);
  late final $CollectionEggsTable collectionEggs = $CollectionEggsTable(this);
  late final $SaleEggsTable saleEggs = $SaleEggsTable(this);
  late final $SaleChickenTable saleChicken = $SaleChickenTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    chicken,
    eggVariety,
    collectionEggs,
    saleEggs,
    saleChicken,
  ];
}

typedef $$ChickenTableCreateCompanionBuilder =
    ChickenCompanion Function({
      Value<int> id,
      required String name,
      required String breed,
      required DateTime dateOfBirth,
      required double weight,
      required double eggProduction,
    });
typedef $$ChickenTableUpdateCompanionBuilder =
    ChickenCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> breed,
      Value<DateTime> dateOfBirth,
      Value<double> weight,
      Value<double> eggProduction,
    });

final class $$ChickenTableReferences
    extends BaseReferences<_$AppDatabase, $ChickenTable, ChickenData> {
  $$ChickenTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionEggsTable, List<CollectionEgg>>
  _collectionEggsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionEggs,
    aliasName: $_aliasNameGenerator(db.chicken.id, db.collectionEggs.idChicken),
  );

  $$CollectionEggsTableProcessedTableManager get collectionEggsRefs {
    final manager = $$CollectionEggsTableTableManager(
      $_db,
      $_db.collectionEggs,
    ).filter((f) => f.idChicken.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_collectionEggsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SaleChickenTable, List<SaleChickenData>>
  _saleChickenRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.saleChicken,
    aliasName: $_aliasNameGenerator(db.chicken.id, db.saleChicken.idChicken),
  );

  $$SaleChickenTableProcessedTableManager get saleChickenRefs {
    final manager = $$SaleChickenTableTableManager(
      $_db,
      $_db.saleChicken,
    ).filter((f) => f.idChicken.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleChickenRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ChickenTableFilterComposer
    extends Composer<_$AppDatabase, $ChickenTable> {
  $$ChickenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get eggProduction => $composableBuilder(
    column: $table.eggProduction,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> collectionEggsRefs(
    Expression<bool> Function($$CollectionEggsTableFilterComposer f) f,
  ) {
    final $$CollectionEggsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionEggs,
      getReferencedColumn: (t) => t.idChicken,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionEggsTableFilterComposer(
            $db: $db,
            $table: $db.collectionEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> saleChickenRefs(
    Expression<bool> Function($$SaleChickenTableFilterComposer f) f,
  ) {
    final $$SaleChickenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleChicken,
      getReferencedColumn: (t) => t.idChicken,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleChickenTableFilterComposer(
            $db: $db,
            $table: $db.saleChicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChickenTableOrderingComposer
    extends Composer<_$AppDatabase, $ChickenTable> {
  $$ChickenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breed => $composableBuilder(
    column: $table.breed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get eggProduction => $composableBuilder(
    column: $table.eggProduction,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ChickenTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChickenTable> {
  $$ChickenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get breed =>
      $composableBuilder(column: $table.breed, builder: (column) => column);

  GeneratedColumn<DateTime> get dateOfBirth => $composableBuilder(
    column: $table.dateOfBirth,
    builder: (column) => column,
  );

  GeneratedColumn<double> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  GeneratedColumn<double> get eggProduction => $composableBuilder(
    column: $table.eggProduction,
    builder: (column) => column,
  );

  Expression<T> collectionEggsRefs<T extends Object>(
    Expression<T> Function($$CollectionEggsTableAnnotationComposer a) f,
  ) {
    final $$CollectionEggsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionEggs,
      getReferencedColumn: (t) => t.idChicken,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionEggsTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> saleChickenRefs<T extends Object>(
    Expression<T> Function($$SaleChickenTableAnnotationComposer a) f,
  ) {
    final $$SaleChickenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleChicken,
      getReferencedColumn: (t) => t.idChicken,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleChickenTableAnnotationComposer(
            $db: $db,
            $table: $db.saleChicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ChickenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChickenTable,
          ChickenData,
          $$ChickenTableFilterComposer,
          $$ChickenTableOrderingComposer,
          $$ChickenTableAnnotationComposer,
          $$ChickenTableCreateCompanionBuilder,
          $$ChickenTableUpdateCompanionBuilder,
          (ChickenData, $$ChickenTableReferences),
          ChickenData,
          PrefetchHooks Function({
            bool collectionEggsRefs,
            bool saleChickenRefs,
          })
        > {
  $$ChickenTableTableManager(_$AppDatabase db, $ChickenTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$ChickenTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$ChickenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$ChickenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> breed = const Value.absent(),
                Value<DateTime> dateOfBirth = const Value.absent(),
                Value<double> weight = const Value.absent(),
                Value<double> eggProduction = const Value.absent(),
              }) => ChickenCompanion(
                id: id,
                name: name,
                breed: breed,
                dateOfBirth: dateOfBirth,
                weight: weight,
                eggProduction: eggProduction,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String breed,
                required DateTime dateOfBirth,
                required double weight,
                required double eggProduction,
              }) => ChickenCompanion.insert(
                id: id,
                name: name,
                breed: breed,
                dateOfBirth: dateOfBirth,
                weight: weight,
                eggProduction: eggProduction,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$ChickenTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            collectionEggsRefs = false,
            saleChickenRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionEggsRefs) db.collectionEggs,
                if (saleChickenRefs) db.saleChicken,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionEggsRefs)
                    await $_getPrefetchedData<
                      ChickenData,
                      $ChickenTable,
                      CollectionEgg
                    >(
                      currentTable: table,
                      referencedTable: $$ChickenTableReferences
                          ._collectionEggsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ChickenTableReferences(
                                db,
                                table,
                                p0,
                              ).collectionEggsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idChicken == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (saleChickenRefs)
                    await $_getPrefetchedData<
                      ChickenData,
                      $ChickenTable,
                      SaleChickenData
                    >(
                      currentTable: table,
                      referencedTable: $$ChickenTableReferences
                          ._saleChickenRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$ChickenTableReferences(
                                db,
                                table,
                                p0,
                              ).saleChickenRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idChicken == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ChickenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChickenTable,
      ChickenData,
      $$ChickenTableFilterComposer,
      $$ChickenTableOrderingComposer,
      $$ChickenTableAnnotationComposer,
      $$ChickenTableCreateCompanionBuilder,
      $$ChickenTableUpdateCompanionBuilder,
      (ChickenData, $$ChickenTableReferences),
      ChickenData,
      PrefetchHooks Function({bool collectionEggsRefs, bool saleChickenRefs})
    >;
typedef $$EggVarietyTableCreateCompanionBuilder =
    EggVarietyCompanion Function({Value<int> id, required String name});
typedef $$EggVarietyTableUpdateCompanionBuilder =
    EggVarietyCompanion Function({Value<int> id, Value<String> name});

final class $$EggVarietyTableReferences
    extends BaseReferences<_$AppDatabase, $EggVarietyTable, EggVarietyData> {
  $$EggVarietyTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CollectionEggsTable, List<CollectionEgg>>
  _collectionEggsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.collectionEggs,
    aliasName: $_aliasNameGenerator(
      db.eggVariety.id,
      db.collectionEggs.idEggVariety,
    ),
  );

  $$CollectionEggsTableProcessedTableManager get collectionEggsRefs {
    final manager = $$CollectionEggsTableTableManager(
      $_db,
      $_db.collectionEggs,
    ).filter((f) => f.idEggVariety.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_collectionEggsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SaleEggsTable, List<SaleEgg>> _saleEggsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.saleEggs,
    aliasName: $_aliasNameGenerator(db.eggVariety.id, db.saleEggs.idEggVariety),
  );

  $$SaleEggsTableProcessedTableManager get saleEggsRefs {
    final manager = $$SaleEggsTableTableManager(
      $_db,
      $_db.saleEggs,
    ).filter((f) => f.idEggVariety.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_saleEggsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EggVarietyTableFilterComposer
    extends Composer<_$AppDatabase, $EggVarietyTable> {
  $$EggVarietyTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> collectionEggsRefs(
    Expression<bool> Function($$CollectionEggsTableFilterComposer f) f,
  ) {
    final $$CollectionEggsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionEggs,
      getReferencedColumn: (t) => t.idEggVariety,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionEggsTableFilterComposer(
            $db: $db,
            $table: $db.collectionEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> saleEggsRefs(
    Expression<bool> Function($$SaleEggsTableFilterComposer f) f,
  ) {
    final $$SaleEggsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleEggs,
      getReferencedColumn: (t) => t.idEggVariety,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleEggsTableFilterComposer(
            $db: $db,
            $table: $db.saleEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EggVarietyTableOrderingComposer
    extends Composer<_$AppDatabase, $EggVarietyTable> {
  $$EggVarietyTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EggVarietyTableAnnotationComposer
    extends Composer<_$AppDatabase, $EggVarietyTable> {
  $$EggVarietyTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> collectionEggsRefs<T extends Object>(
    Expression<T> Function($$CollectionEggsTableAnnotationComposer a) f,
  ) {
    final $$CollectionEggsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.collectionEggs,
      getReferencedColumn: (t) => t.idEggVariety,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CollectionEggsTableAnnotationComposer(
            $db: $db,
            $table: $db.collectionEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> saleEggsRefs<T extends Object>(
    Expression<T> Function($$SaleEggsTableAnnotationComposer a) f,
  ) {
    final $$SaleEggsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.saleEggs,
      getReferencedColumn: (t) => t.idEggVariety,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SaleEggsTableAnnotationComposer(
            $db: $db,
            $table: $db.saleEggs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EggVarietyTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EggVarietyTable,
          EggVarietyData,
          $$EggVarietyTableFilterComposer,
          $$EggVarietyTableOrderingComposer,
          $$EggVarietyTableAnnotationComposer,
          $$EggVarietyTableCreateCompanionBuilder,
          $$EggVarietyTableUpdateCompanionBuilder,
          (EggVarietyData, $$EggVarietyTableReferences),
          EggVarietyData,
          PrefetchHooks Function({bool collectionEggsRefs, bool saleEggsRefs})
        > {
  $$EggVarietyTableTableManager(_$AppDatabase db, $EggVarietyTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$EggVarietyTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$EggVarietyTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$EggVarietyTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
              }) => EggVarietyCompanion(id: id, name: name),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String name}) =>
                  EggVarietyCompanion.insert(id: id, name: name),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$EggVarietyTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            collectionEggsRefs = false,
            saleEggsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (collectionEggsRefs) db.collectionEggs,
                if (saleEggsRefs) db.saleEggs,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (collectionEggsRefs)
                    await $_getPrefetchedData<
                      EggVarietyData,
                      $EggVarietyTable,
                      CollectionEgg
                    >(
                      currentTable: table,
                      referencedTable: $$EggVarietyTableReferences
                          ._collectionEggsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EggVarietyTableReferences(
                                db,
                                table,
                                p0,
                              ).collectionEggsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idEggVariety == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (saleEggsRefs)
                    await $_getPrefetchedData<
                      EggVarietyData,
                      $EggVarietyTable,
                      SaleEgg
                    >(
                      currentTable: table,
                      referencedTable: $$EggVarietyTableReferences
                          ._saleEggsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$EggVarietyTableReferences(
                                db,
                                table,
                                p0,
                              ).saleEggsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.idEggVariety == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EggVarietyTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EggVarietyTable,
      EggVarietyData,
      $$EggVarietyTableFilterComposer,
      $$EggVarietyTableOrderingComposer,
      $$EggVarietyTableAnnotationComposer,
      $$EggVarietyTableCreateCompanionBuilder,
      $$EggVarietyTableUpdateCompanionBuilder,
      (EggVarietyData, $$EggVarietyTableReferences),
      EggVarietyData,
      PrefetchHooks Function({bool collectionEggsRefs, bool saleEggsRefs})
    >;
typedef $$CollectionEggsTableCreateCompanionBuilder =
    CollectionEggsCompanion Function({
      Value<int> id,
      required int idChicken,
      required int idEggVariety,
      required int quantity,
      required int pricePerPiece,
      required DateTime collectionDate,
    });
typedef $$CollectionEggsTableUpdateCompanionBuilder =
    CollectionEggsCompanion Function({
      Value<int> id,
      Value<int> idChicken,
      Value<int> idEggVariety,
      Value<int> quantity,
      Value<int> pricePerPiece,
      Value<DateTime> collectionDate,
    });

final class $$CollectionEggsTableReferences
    extends BaseReferences<_$AppDatabase, $CollectionEggsTable, CollectionEgg> {
  $$CollectionEggsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ChickenTable _idChickenTable(_$AppDatabase db) =>
      db.chicken.createAlias(
        $_aliasNameGenerator(db.collectionEggs.idChicken, db.chicken.id),
      );

  $$ChickenTableProcessedTableManager get idChicken {
    final $_column = $_itemColumn<int>('id_chicken')!;

    final manager = $$ChickenTableTableManager(
      $_db,
      $_db.chicken,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idChickenTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EggVarietyTable _idEggVarietyTable(_$AppDatabase db) =>
      db.eggVariety.createAlias(
        $_aliasNameGenerator(db.collectionEggs.idEggVariety, db.eggVariety.id),
      );

  $$EggVarietyTableProcessedTableManager get idEggVariety {
    final $_column = $_itemColumn<int>('id_egg_variety')!;

    final manager = $$EggVarietyTableTableManager(
      $_db,
      $_db.eggVariety,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEggVarietyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CollectionEggsTableFilterComposer
    extends Composer<_$AppDatabase, $CollectionEggsTable> {
  $$CollectionEggsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get collectionDate => $composableBuilder(
    column: $table.collectionDate,
    builder: (column) => ColumnFilters(column),
  );

  $$ChickenTableFilterComposer get idChicken {
    final $$ChickenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableFilterComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EggVarietyTableFilterComposer get idEggVariety {
    final $$EggVarietyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableFilterComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionEggsTableOrderingComposer
    extends Composer<_$AppDatabase, $CollectionEggsTable> {
  $$CollectionEggsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantity => $composableBuilder(
    column: $table.quantity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get collectionDate => $composableBuilder(
    column: $table.collectionDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChickenTableOrderingComposer get idChicken {
    final $$ChickenTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableOrderingComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EggVarietyTableOrderingComposer get idEggVariety {
    final $$EggVarietyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableOrderingComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionEggsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CollectionEggsTable> {
  $$CollectionEggsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get collectionDate => $composableBuilder(
    column: $table.collectionDate,
    builder: (column) => column,
  );

  $$ChickenTableAnnotationComposer get idChicken {
    final $$ChickenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableAnnotationComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EggVarietyTableAnnotationComposer get idEggVariety {
    final $$EggVarietyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableAnnotationComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CollectionEggsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CollectionEggsTable,
          CollectionEgg,
          $$CollectionEggsTableFilterComposer,
          $$CollectionEggsTableOrderingComposer,
          $$CollectionEggsTableAnnotationComposer,
          $$CollectionEggsTableCreateCompanionBuilder,
          $$CollectionEggsTableUpdateCompanionBuilder,
          (CollectionEgg, $$CollectionEggsTableReferences),
          CollectionEgg,
          PrefetchHooks Function({bool idChicken, bool idEggVariety})
        > {
  $$CollectionEggsTableTableManager(
    _$AppDatabase db,
    $CollectionEggsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CollectionEggsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$CollectionEggsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CollectionEggsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idChicken = const Value.absent(),
                Value<int> idEggVariety = const Value.absent(),
                Value<int> quantity = const Value.absent(),
                Value<int> pricePerPiece = const Value.absent(),
                Value<DateTime> collectionDate = const Value.absent(),
              }) => CollectionEggsCompanion(
                id: id,
                idChicken: idChicken,
                idEggVariety: idEggVariety,
                quantity: quantity,
                pricePerPiece: pricePerPiece,
                collectionDate: collectionDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idChicken,
                required int idEggVariety,
                required int quantity,
                required int pricePerPiece,
                required DateTime collectionDate,
              }) => CollectionEggsCompanion.insert(
                id: id,
                idChicken: idChicken,
                idEggVariety: idEggVariety,
                quantity: quantity,
                pricePerPiece: pricePerPiece,
                collectionDate: collectionDate,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CollectionEggsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idChicken = false, idEggVariety = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idChicken) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idChicken,
                            referencedTable: $$CollectionEggsTableReferences
                                ._idChickenTable(db),
                            referencedColumn:
                                $$CollectionEggsTableReferences
                                    ._idChickenTable(db)
                                    .id,
                          )
                          as T;
                }
                if (idEggVariety) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idEggVariety,
                            referencedTable: $$CollectionEggsTableReferences
                                ._idEggVarietyTable(db),
                            referencedColumn:
                                $$CollectionEggsTableReferences
                                    ._idEggVarietyTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CollectionEggsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CollectionEggsTable,
      CollectionEgg,
      $$CollectionEggsTableFilterComposer,
      $$CollectionEggsTableOrderingComposer,
      $$CollectionEggsTableAnnotationComposer,
      $$CollectionEggsTableCreateCompanionBuilder,
      $$CollectionEggsTableUpdateCompanionBuilder,
      (CollectionEgg, $$CollectionEggsTableReferences),
      CollectionEgg,
      PrefetchHooks Function({bool idChicken, bool idEggVariety})
    >;
typedef $$SaleEggsTableCreateCompanionBuilder =
    SaleEggsCompanion Function({
      Value<int> id,
      required int idEggVariety,
      required DateTime dateSale,
      required int quantitySale,
      required int pricePerPiece,
    });
typedef $$SaleEggsTableUpdateCompanionBuilder =
    SaleEggsCompanion Function({
      Value<int> id,
      Value<int> idEggVariety,
      Value<DateTime> dateSale,
      Value<int> quantitySale,
      Value<int> pricePerPiece,
    });

final class $$SaleEggsTableReferences
    extends BaseReferences<_$AppDatabase, $SaleEggsTable, SaleEgg> {
  $$SaleEggsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EggVarietyTable _idEggVarietyTable(_$AppDatabase db) =>
      db.eggVariety.createAlias(
        $_aliasNameGenerator(db.saleEggs.idEggVariety, db.eggVariety.id),
      );

  $$EggVarietyTableProcessedTableManager get idEggVariety {
    final $_column = $_itemColumn<int>('id_egg_variety')!;

    final manager = $$EggVarietyTableTableManager(
      $_db,
      $_db.eggVariety,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEggVarietyTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SaleEggsTableFilterComposer
    extends Composer<_$AppDatabase, $SaleEggsTable> {
  $$SaleEggsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateSale => $composableBuilder(
    column: $table.dateSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnFilters(column),
  );

  $$EggVarietyTableFilterComposer get idEggVariety {
    final $$EggVarietyTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableFilterComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleEggsTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleEggsTable> {
  $$SaleEggsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateSale => $composableBuilder(
    column: $table.dateSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnOrderings(column),
  );

  $$EggVarietyTableOrderingComposer get idEggVariety {
    final $$EggVarietyTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableOrderingComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleEggsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleEggsTable> {
  $$SaleEggsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get dateSale =>
      $composableBuilder(column: $table.dateSale, builder: (column) => column);

  GeneratedColumn<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => column,
  );

  $$EggVarietyTableAnnotationComposer get idEggVariety {
    final $$EggVarietyTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEggVariety,
      referencedTable: $db.eggVariety,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EggVarietyTableAnnotationComposer(
            $db: $db,
            $table: $db.eggVariety,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleEggsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleEggsTable,
          SaleEgg,
          $$SaleEggsTableFilterComposer,
          $$SaleEggsTableOrderingComposer,
          $$SaleEggsTableAnnotationComposer,
          $$SaleEggsTableCreateCompanionBuilder,
          $$SaleEggsTableUpdateCompanionBuilder,
          (SaleEgg, $$SaleEggsTableReferences),
          SaleEgg,
          PrefetchHooks Function({bool idEggVariety})
        > {
  $$SaleEggsTableTableManager(_$AppDatabase db, $SaleEggsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SaleEggsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SaleEggsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SaleEggsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idEggVariety = const Value.absent(),
                Value<DateTime> dateSale = const Value.absent(),
                Value<int> quantitySale = const Value.absent(),
                Value<int> pricePerPiece = const Value.absent(),
              }) => SaleEggsCompanion(
                id: id,
                idEggVariety: idEggVariety,
                dateSale: dateSale,
                quantitySale: quantitySale,
                pricePerPiece: pricePerPiece,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idEggVariety,
                required DateTime dateSale,
                required int quantitySale,
                required int pricePerPiece,
              }) => SaleEggsCompanion.insert(
                id: id,
                idEggVariety: idEggVariety,
                dateSale: dateSale,
                quantitySale: quantitySale,
                pricePerPiece: pricePerPiece,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SaleEggsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idEggVariety = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idEggVariety) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idEggVariety,
                            referencedTable: $$SaleEggsTableReferences
                                ._idEggVarietyTable(db),
                            referencedColumn:
                                $$SaleEggsTableReferences
                                    ._idEggVarietyTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SaleEggsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleEggsTable,
      SaleEgg,
      $$SaleEggsTableFilterComposer,
      $$SaleEggsTableOrderingComposer,
      $$SaleEggsTableAnnotationComposer,
      $$SaleEggsTableCreateCompanionBuilder,
      $$SaleEggsTableUpdateCompanionBuilder,
      (SaleEgg, $$SaleEggsTableReferences),
      SaleEgg,
      PrefetchHooks Function({bool idEggVariety})
    >;
typedef $$SaleChickenTableCreateCompanionBuilder =
    SaleChickenCompanion Function({
      Value<int> id,
      required int idChicken,
      required DateTime dateSale,
      required int quantitySale,
      required int pricePerPiece,
    });
typedef $$SaleChickenTableUpdateCompanionBuilder =
    SaleChickenCompanion Function({
      Value<int> id,
      Value<int> idChicken,
      Value<DateTime> dateSale,
      Value<int> quantitySale,
      Value<int> pricePerPiece,
    });

final class $$SaleChickenTableReferences
    extends BaseReferences<_$AppDatabase, $SaleChickenTable, SaleChickenData> {
  $$SaleChickenTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ChickenTable _idChickenTable(_$AppDatabase db) =>
      db.chicken.createAlias(
        $_aliasNameGenerator(db.saleChicken.idChicken, db.chicken.id),
      );

  $$ChickenTableProcessedTableManager get idChicken {
    final $_column = $_itemColumn<int>('id_chicken')!;

    final manager = $$ChickenTableTableManager(
      $_db,
      $_db.chicken,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idChickenTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SaleChickenTableFilterComposer
    extends Composer<_$AppDatabase, $SaleChickenTable> {
  $$SaleChickenTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateSale => $composableBuilder(
    column: $table.dateSale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnFilters(column),
  );

  $$ChickenTableFilterComposer get idChicken {
    final $$ChickenTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableFilterComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleChickenTableOrderingComposer
    extends Composer<_$AppDatabase, $SaleChickenTable> {
  $$SaleChickenTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateSale => $composableBuilder(
    column: $table.dateSale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => ColumnOrderings(column),
  );

  $$ChickenTableOrderingComposer get idChicken {
    final $$ChickenTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableOrderingComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleChickenTableAnnotationComposer
    extends Composer<_$AppDatabase, $SaleChickenTable> {
  $$SaleChickenTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get dateSale =>
      $composableBuilder(column: $table.dateSale, builder: (column) => column);

  GeneratedColumn<int> get quantitySale => $composableBuilder(
    column: $table.quantitySale,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pricePerPiece => $composableBuilder(
    column: $table.pricePerPiece,
    builder: (column) => column,
  );

  $$ChickenTableAnnotationComposer get idChicken {
    final $$ChickenTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idChicken,
      referencedTable: $db.chicken,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChickenTableAnnotationComposer(
            $db: $db,
            $table: $db.chicken,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SaleChickenTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SaleChickenTable,
          SaleChickenData,
          $$SaleChickenTableFilterComposer,
          $$SaleChickenTableOrderingComposer,
          $$SaleChickenTableAnnotationComposer,
          $$SaleChickenTableCreateCompanionBuilder,
          $$SaleChickenTableUpdateCompanionBuilder,
          (SaleChickenData, $$SaleChickenTableReferences),
          SaleChickenData,
          PrefetchHooks Function({bool idChicken})
        > {
  $$SaleChickenTableTableManager(_$AppDatabase db, $SaleChickenTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SaleChickenTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SaleChickenTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$SaleChickenTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> idChicken = const Value.absent(),
                Value<DateTime> dateSale = const Value.absent(),
                Value<int> quantitySale = const Value.absent(),
                Value<int> pricePerPiece = const Value.absent(),
              }) => SaleChickenCompanion(
                id: id,
                idChicken: idChicken,
                dateSale: dateSale,
                quantitySale: quantitySale,
                pricePerPiece: pricePerPiece,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int idChicken,
                required DateTime dateSale,
                required int quantitySale,
                required int pricePerPiece,
              }) => SaleChickenCompanion.insert(
                id: id,
                idChicken: idChicken,
                dateSale: dateSale,
                quantitySale: quantitySale,
                pricePerPiece: pricePerPiece,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SaleChickenTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({idChicken = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                T extends TableManagerState<
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic,
                  dynamic
                >
              >(state) {
                if (idChicken) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.idChicken,
                            referencedTable: $$SaleChickenTableReferences
                                ._idChickenTable(db),
                            referencedColumn:
                                $$SaleChickenTableReferences
                                    ._idChickenTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SaleChickenTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SaleChickenTable,
      SaleChickenData,
      $$SaleChickenTableFilterComposer,
      $$SaleChickenTableOrderingComposer,
      $$SaleChickenTableAnnotationComposer,
      $$SaleChickenTableCreateCompanionBuilder,
      $$SaleChickenTableUpdateCompanionBuilder,
      (SaleChickenData, $$SaleChickenTableReferences),
      SaleChickenData,
      PrefetchHooks Function({bool idChicken})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ChickenTableTableManager get chicken =>
      $$ChickenTableTableManager(_db, _db.chicken);
  $$EggVarietyTableTableManager get eggVariety =>
      $$EggVarietyTableTableManager(_db, _db.eggVariety);
  $$CollectionEggsTableTableManager get collectionEggs =>
      $$CollectionEggsTableTableManager(_db, _db.collectionEggs);
  $$SaleEggsTableTableManager get saleEggs =>
      $$SaleEggsTableTableManager(_db, _db.saleEggs);
  $$SaleChickenTableTableManager get saleChicken =>
      $$SaleChickenTableTableManager(_db, _db.saleChicken);
}
