import 'package:equatable/equatable.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';

class AppInfoState extends Equatable {
  final String errorText;
  final String statusMessage;
  final String message;
  final FromStatus fromStatus;

  const AppInfoState({
    required this.fromStatus,
    required this.message,
    required this.errorText,
    required this.statusMessage,
  });

  AppInfoState copyWith({
    String? errorText,
    String? statusMessage,
    String? message,
    String? userEmail,
    FromStatus? fromStatus,
  }) {
    return AppInfoState(
      fromStatus: fromStatus ?? this.fromStatus,
      errorText: errorText ?? this.errorText,
      statusMessage: statusMessage ?? this.statusMessage,
      message: message ?? this.message,
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
