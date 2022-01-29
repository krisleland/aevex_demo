part of 'input_cubit.dart';

abstract class InputState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InputStateInitial extends InputState {}

class InputStateLoading extends InputState {}

class InputStateSubmitSuccess extends InputState {
  final DataType data;

  InputStateSubmitSuccess({required this.data});

  @override
  List<Object?> get props => [data];
}