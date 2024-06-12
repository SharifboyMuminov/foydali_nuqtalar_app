import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {}

class AuthRegisterEvent extends AuthEvent {
  final String email;
  final String fullName;
  final String password;

  AuthRegisterEvent({
    required this.email,
    required this.fullName,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        fullName,
        password,
      ];
}

class AuthVerifyEvent extends AuthEvent {
  final String email;
  final String activateCode;

  AuthVerifyEvent({
    required this.email,
    required this.activateCode,
  });

  @override
  List<Object?> get props => [
        activateCode,
        email,
      ];
}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;

  AuthLoginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        password,
        email,
      ];
}
