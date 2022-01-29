import 'package:aevex_demo/repositories/data_type_repository.dart';
import 'package:equatable/equatable.dart';

abstract class ResultsState extends Equatable {
  final List<Entry> entries;
  final bool moreResults;

  const ResultsState({this.entries = const [], this.moreResults = true});

  @override
  List<Object?> get props => [entries, moreResults];
}

class ResultsStateLoaded extends ResultsState {
  const ResultsStateLoaded(
      {required List<Entry> entries, required bool moreResults})
      : super(entries: entries, moreResults: moreResults);
}

class ResultsStateLoading extends ResultsState {
  const ResultsStateLoading({List<Entry>? entries, bool? moreResults})
      : super(entries: entries ?? const [], moreResults: moreResults ?? true);
}
