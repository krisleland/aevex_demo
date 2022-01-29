import 'package:aevex_demo/main.dart';
import 'package:aevex_demo/repositories/repository.dart';
import 'package:drift/drift.dart';

export 'database/shared.dart';

part 'data_type_repository.g.dart';

@DataClassName('Entry')
class Entries extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get firstName => text()();

  TextColumn get lastName => text()();

  TextColumn get randomNumber => text()();
}

@DriftDatabase(tables: [Entries])
class DataTypeRepository extends _$DataTypeRepository
    implements Repository<Entry> {

  DataTypeRepository(QueryExecutor e) : super(e);

  @override
  Future<Entry?> get({required int id}) async {
    return (select(entries)..where((t) => t.id.equals(id))).getSingle();
  }

  @override
  Future<List<Entry>> getAll({int? offset}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return (select(entries)..limit(limit, offset: offset)).get();
  }

  @override
  Future<int> insert({required UpdateCompanion<Entry> item}) async {
    return into(entries).insert(item);
  }

  Future<void> insertAll({required List<UpdateCompanion<Entry>> items}) async {
    await batch((batch) {
      batch.insertAll(entries, items);
    });
  }

  @override
  int get schemaVersion => 1;
}
