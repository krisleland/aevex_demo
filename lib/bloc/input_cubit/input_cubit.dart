import 'package:aevex_demo/models/data_type.dart';
import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit(initialState) : super(initialState);

  final repo = DataTypeRepository();

  void submit(
      {required String firstName,
      required String lastName,
      required String randomNumber}) async {
    emit(InputStateLoading());
    var data = DataType(
        firstName: firstName, lastName: lastName, randomNumber: randomNumber);
    var newData = await repo.insert(item: data);
    emit(InputStateSubmitSuccess(data: newData));
  }

  void addHundred() {
    var data = List.generate(
        100,
        (index) => DataType(
            firstName: 'firstName$index',
            lastName: 'lastName$index',
            randomNumber: index.toString()));
    repo.insertAll(items: data);
  }
}
