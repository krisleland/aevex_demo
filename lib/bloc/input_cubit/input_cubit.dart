import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

part 'input_state.dart';

class InputCubit extends Cubit<InputState> {
  InputCubit(initialState) : super(initialState);

  final repo = getIt.get<DataTypeRepository>();

  void submit(
      {required String firstName,
      required String lastName,
      required String randomNumber}) async {
    emit(InputStateLoading());
    var data = EntriesCompanion.insert(
        firstName: firstName,
        lastName: lastName,
        randomNumber: randomNumber);

    await repo.insert(item: data);
    emit(InputStateSubmitSuccess());
  }

  void addHundred() {
    var data = List.generate(
        100,
        (index) => EntriesCompanion.insert(
            firstName: 'firstName$index',
            lastName: 'lastName$index',
            randomNumber: index.toString()));
    repo.insertAll(items: data);
  }
}
