import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_event.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_state.dart';
import 'package:foydali_nuqtalar/data/models/app_info/app_info_model.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';
import 'package:foydali_nuqtalar/data/repositories/app_info_repository.dart';

class AppInfoBloc extends Bloc<AppInfoEvent, AppInfoState> {
  AppInfoBloc(this._appInfoRepository)
      : super(
          AppInfoState(
            fromStatus: FromStatus.pure,
            message: "",
            errorText: "",
            statusMessage: "",
            appInfoModel: AppInfoModel.initial(),
          ),
        ) {
    on<AppInfoGetEvent>(_getAppInfo);
  }

  final AppInfoRepository _appInfoRepository;

  Future<void> _getAppInfo(AppInfoGetEvent event, emit) async {
    emit(state.copyWith(fromStatus: FromStatus.loading));

    NetworkResponse networkResponse = await _appInfoRepository.getAppInfo();

    if (networkResponse.errorText.isEmpty) {
      List appInfoModels = (networkResponse.data as List);

      if (appInfoModels.isNotEmpty) {
        emit(
          state.copyWith(
            fromStatus: FromStatus.success,
            appInfoModel: appInfoModels.first,
          ),
        );
      } else {
        emit(
          state.copyWith(
            fromStatus: FromStatus.error,
            errorText: "Empty Data :(",
          ),
        );
      }
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
