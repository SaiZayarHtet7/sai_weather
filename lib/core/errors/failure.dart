import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object> get props => [];
}

class AuthFail extends Failure {}

class StatusFailure extends Failure {}

class ServerFailure extends Failure {}

class ConnectionFailure extends Failure {}

class LogicFailure extends Failure {
  final String error;

  const LogicFailure(this.error);
  
}
