import 'dart:io';

import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart' as paths;
import 'package:path/path.dart' as p;

DataTypeRepository constructDb({bool logStatements = false}) {
  if (Platform.isIOS || Platform.isAndroid) {
    final executor = LazyDatabase(() async {
      final dataDir = await paths.getApplicationDocumentsDirectory();
      final dbFile = File(p.join(dataDir.path, 'db.sqlite'));
      return NativeDatabase(dbFile, logStatements: logStatements);
    });
    return DataTypeRepository(executor);
  }
  if (Platform.isMacOS || Platform.isLinux) {
    final file = File('db.sqlite');
    return DataTypeRepository(NativeDatabase(file, logStatements: logStatements));
  }
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  return DataTypeRepository(NativeDatabase.memory(logStatements: logStatements));
}