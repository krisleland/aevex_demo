import 'package:aevex_demo/models/data_type.dart';
import 'package:aevex_demo/repositories/repository.dart';

class DataTypeRepository implements Repository<DataType> {

  int count = 0;

  final Map<int, DataType> data = {};

  static final DataTypeRepository _repository = DataTypeRepository._internal();
  factory DataTypeRepository() {
    return _repository;
  }

  DataTypeRepository._internal();

  @override
  Future<DataType?> get({required int id}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (id < 0 || id >= data.length) {
      return null;
    } else {
      return data[id];
    }
  }

  @override
  Future<Map<int, DataType>> getAll({int? id}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (id != null) {
      return {};
    }
    return data;
  }

  @override
  Future<DataType> insert({required DataType item}) async {
    var newItem = item.copyWith(id: count);
    count += 1;
    data[newItem.id] = newItem;
    return newItem;
  }

  Future<List<DataType>> insertAll({required List<DataType> items}) async {
    if (items.isEmpty) {
      return [];
    }
    for (int i = 0; i < items.length; i++) {
      var newItem = items[i].copyWith(id: count);
      count += 1;
      data[newItem.id] = newItem;
      items[i] = newItem;
    }
    return items;
  }
}