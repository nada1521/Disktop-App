part of 'log_in_cubit.dart';

@immutable
abstract class LogInState {}

class LogInInitialState extends LogInState {}

class LogInSuccessState extends LogInState {
  final LogInResponseModel responseModel;

  LogInSuccessState({required this.responseModel});
}

class LogInFailureState extends LogInState {
   final String erroreMessag;

  LogInFailureState({required this.erroreMessag});
}

class LogInLoadingState extends LogInState {}
