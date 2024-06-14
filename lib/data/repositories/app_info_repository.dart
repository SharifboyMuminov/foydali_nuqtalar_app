import 'package:foydali_nuqtalar/data/api/api_provider.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';

class AppInfoRepository {
  AppInfoRepository(this._apiProvider);

  final ApiProvider _apiProvider;

  Future<NetworkResponse> getAppInfo() => _apiProvider.getAppInfo();
}
