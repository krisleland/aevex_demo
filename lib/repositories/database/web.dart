import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:drift/web.dart';

DataTypeRepository constructDb({bool logStatements = false}) {
  return DataTypeRepository(WebDatabase('db', logStatements: logStatements));
}