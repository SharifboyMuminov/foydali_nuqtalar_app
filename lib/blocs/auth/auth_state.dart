import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';

class AuthState extends Equatable {
  final String errorText;
  final String statusMessage;
  final FromStatus fromStatus;

  const AuthState({
    required this.fromStatus,
    required this.errorText,
    required this.statusMessage,
  });

  AuthState copyWith({
    String? errorText,
    String? statusMessage,
    FromStatus? fromStatus,
  }) {
    return AuthState(
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        fromStatus,
        errorText,
        statusMessage,
      ];
}
