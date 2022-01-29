// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_type_repository.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Entry extends DataClass implements Insertable<Entry> {
  final int id;
  final String firstName;
  final String lastName;
  final String randomNumber;
  Entry(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.randomNumber});
  factory Entry.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Entry(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      firstName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}first_name'])!,
      lastName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}last_name'])!,
      randomNumber: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}random_number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['first_name'] = Variable<String>(firstName);
    map['last_name'] = Variable<String>(lastName);
    map['random_number'] = Variable<String>(randomNumber);
    return map;
  }

  EntriesCompanion toCompanion(bool nullToAbsent) {
    return EntriesCompanion(
      id: Value(id),
      firstName: Value(firstName),
      lastName: Value(lastName),
      randomNumber: Value(randomNumber),
    );
  }

  factory Entry.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Entry(
      id: serializer.fromJson<int>(json['id']),
      firstName: serializer.fromJson<String>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      randomNumber: serializer.fromJson<String>(json['randomNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'firstName': serializer.toJson<String>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'randomNumber': serializer.toJson<String>(randomNumber),
    };
  }

  Entry copyWith(
          {int? id,
          String? firstName,
          String? lastName,
          String? randomNumber}) =>
      Entry(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        randomNumber: randomNumber ?? this.randomNumber,
      );
  @override
  String toString() {
    return (StringBuffer('Entry(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('randomNumber: $randomNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, firstName, lastName, randomNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Entry &&
          other.id == this.id &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.randomNumber == this.randomNumber);
}

class EntriesCompanion extends UpdateCompanion<Entry> {
  final Value<int> id;
  final Value<String> firstName;
  final Value<String> lastName;
  final Value<String> randomNumber;
  const EntriesCompanion({
    this.id = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.randomNumber = const Value.absent(),
  });
  EntriesCompanion.insert({
    this.id = const Value.absent(),
    required String firstName,
    required String lastName,
    required String randomNumber,
  })  : firstName = Value(firstName),
        lastName = Value(lastName),
        randomNumber = Value(randomNumber);
  static Insertable<Entry> custom({
    Expression<int>? id,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? randomNumber,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (randomNumber != null) 'random_number': randomNumber,
    });
  }

  EntriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? firstName,
      Value<String>? lastName,
      Value<String>? randomNumber}) {
    return EntriesCompanion(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      randomNumber: randomNumber ?? this.randomNumber,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (randomNumber.present) {
      map['random_number'] = Variable<String>(randomNumber.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EntriesCompanion(')
          ..write('id: $id, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('randomNumber: $randomNumber')
          ..write(')'))
        .toString();
  }
}

class $EntriesTable extends Entries with TableInfo<$EntriesTable, Entry> {
  final GeneratedDatabase _db;
  final String? _alias;
  $EntriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _firstNameMeta = const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String?> firstName = GeneratedColumn<String?>(
      'first_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _lastNameMeta = const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String?> lastName = GeneratedColumn<String?>(
      'last_name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _randomNumberMeta =
      const VerificationMeta('randomNumber');
  @override
  late final GeneratedColumn<String?> randomNumber = GeneratedColumn<String?>(
      'random_number', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, firstName, lastName, randomNumber];
  @override
  String get aliasedName => _alias ?? 'entries';
  @override
  String get actualTableName => 'entries';
  @override
  VerificationContext validateIntegrity(Insertable<Entry> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    } else if (isInserting) {
      context.missing(_firstNameMeta);
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('random_number')) {
      context.handle(
          _randomNumberMeta,
          randomNumber.isAcceptableOrUnknown(
              data['random_number']!, _randomNumberMeta));
    } else if (isInserting) {
      context.missing(_randomNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Entry map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Entry.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $EntriesTable createAlias(String alias) {
    return $EntriesTable(_db, alias);
  }
}

abstract class _$DataTypeRepository extends GeneratedDatabase {
  _$DataTypeRepository(QueryExecutor e)
      : super(SqlTypeSystem.defaultInstance, e);
  late final $EntriesTable entries = $EntriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [entries];
}
