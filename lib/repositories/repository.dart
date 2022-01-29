import 'package:drift/drift.dart';

abstract class Repository<T> {
  Future<int> insert({required UpdateCompanion<T> item});
  Future<List<T>> getAll();
  Future<T?> get({required int id});
}