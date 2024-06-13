import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';

class AuthState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final String userEmail;
  final FromStatus fromStatus;

  const AuthState({
    required this.userEmail,
    required this.fromStatus,
    required this.message,
    required this.errorText,
    required this.statusMessage,
  });

  AuthState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    String? userEmail,
    FromStatus? fromStatus,
  }) {
    return AuthState(
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
      userEmail: userEmail ?? this.userEmail,
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
        message,
      ];
}
