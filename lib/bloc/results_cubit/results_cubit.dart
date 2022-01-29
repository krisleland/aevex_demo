import 'package:aevex_demo/bloc/results_cubit/results_state.dart';
import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../main.dart';

class ResultsCubit extends Cubit<ResultsState> {
  final repo = getIt.get<DataTypeRepository>();

  ResultsCubit() : super(const ResultsStateLoading()) {
    _getInitialData();
  }

  _getInitialData() async {
    var data = await repo.getAll();
    emit(ResultsStateLoaded(entries: data, moreResults: data.length == 20));
  }

  void getMoreData() async {
    if (state is! ResultsStateLoading && state.moreResults) {
      emit(ResultsStateLoading(
          entries: state.entries, moreResults: state.moreResults));
      var data = await repo.getAll(offset: state.entries.length);
      emit(ResultsStateLoaded(
          entries: List.from(state.entries)..addAll(data),
          moreResults: data.length == 20));
    }
  }
}
