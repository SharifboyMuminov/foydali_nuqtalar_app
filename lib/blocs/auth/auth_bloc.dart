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
            message: '',
          ),
        ) {
    on<AuthRegisterEvent>(_register);
    on<AuthVerifyEvent>(_verify);
    on<AuthLoginEvent>(_login);
    on<AuthResetPasswordEvent>(_resetPassword);
    on<AuthResetPasswordConfirmEvent>(_resetPasswordConfirm);
  }

  final AuthRepository _authRepository;

  Future<void> _register(AuthRegisterEvent event, emit) async {
    emit(
      state.copyWith(
        fromStatus: FromStatus.loading,
        statusMessage: "",
      ),
    );

    NetworkResponse networkResponse = await _authRepository.register(
      email: event.email,
      password: event.password,
      fullName: event.fullName,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          statusMessage: "good",
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }

  Future<void> _verify(AuthVerifyEvent event, emit) async {
    emit(
      state.copyWith(
        fromStatus: FromStatus.loading,
        statusMessage: "",
      ),
    );

    NetworkResponse networkResponse = await _authRepository.verify(
      email: event.email,
      activateCode: int.parse(event.activateCode),
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          statusMessage: "ok",
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }

  Future<void> _login(AuthLoginEvent event, emit) async {
    emit(state.copyWith(
      fromStatus: FromStatus.loading,
      statusMessage: "",
    ));

    NetworkResponse networkResponse = await _authRepository.login(
      email: event.email,
      password: event.password,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.authenticated,
          statusMessage: "",
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }

  Future<void> _resetPassword(AuthResetPasswordEvent event, emit) async {
    emit(
      state.copyWith(
        fromStatus: FromStatus.loading,
        statusMessage: "",
      ),
    );

    NetworkResponse networkResponse = await _authRepository.resetPassword(
      email: event.email,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          statusMessage: "_resetPassword",
          message: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }

  Future<void> _resetPasswordConfirm(
      AuthResetPasswordConfirmEvent event, emit) async {
    emit(
      state.copyWith(
        fromStatus: FromStatus.loading,
        statusMessage: "",
      ),
    );

    NetworkResponse networkResponse =
        await _authRepository.resetPasswordConfirm(
      email: event.email,
      activateCode: event.activationCode,
      newPassword: event.newPassword,
      confirmPassword: event.confirmPassword,
    );

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          fromStatus: FromStatus.success,
          statusMessage: "_resetPasswordConfirm",
          message: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          fromStatus: FromStatus.error,
          errorText: networkResponse.errorText,
          statusMessage: "",
        ),
      );
    }
  }
}
