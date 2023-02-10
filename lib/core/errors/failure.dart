import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message, [List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CriticalFailure extends Failure {
  CriticalFailure(super.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}
