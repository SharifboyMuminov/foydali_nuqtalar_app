import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_event.dart';
import 'package:foydali_nuqtalar/blocs/app_info/app_info_state.dart';
import 'package:foydali_nuqtalar/data/models/from_status/from_status.dart';
import 'package:foydali_nuqtalar/data/repositories/app_info_repository.dart';

class AppInfoBloc extends Bloc<AppInfoEvent, AppInfoState> {
  AppInfoBloc(this._appInfoRepository)
      : super(
          const AppInfoState(
            fromStatus: FromStatus.pure,
            message: "",
            errorText: "",
            statusMessage: "",
          ),
        ) {
    on<AppInfoGetEvent>(_getAppInfo);
  }

  final AppInfoRepository _appInfoRepository;

  Future<void> _getAppInfo(AppInfoGetEvent event, emit) async {}
}
