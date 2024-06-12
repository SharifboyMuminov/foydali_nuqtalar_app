import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_event.dart';
import 'package:foydali_nuqtalar/blocs/auth/auth_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';
import 'package:foydali_nuqtalar/data/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository)
      : super(
          const AuthState(
            fromStatus: FromStatus.pure,
            errorText: "",
            statusMessage: "",
          ),
        ) {
    on<AuthRegisterEvent>(_register);
    on<AuthVerifyEvent>(_verify);
  }

  final AuthRepository _authRepository;

  Future<void> _register(AuthRegisterEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.register(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(fromStatus: FromStatus.success));
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _verify(AuthVerifyEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.verify(
      email: event.email,
      activateCode: event.activateCode,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(fromStatus: FromStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _login(AuthVerifyEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _authRepository.verify(
      email: event.email,
      activateCode: event.activateCode,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(fromStatus: FromStatus.authenticated));
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
        ),
      );
    }
  }
}
