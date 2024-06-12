import 'dart:io';
import 'package:dio/dio.dart';
import 'package:foydali_nuqtalar/data/api/api_client.dart';
import 'package:foydali_nuqtalar/data/models/network_response.dart';
import 'package:foydali_nuqtalar/data/models/user/user_model.dart';

class ApiProvider extends ApiClient {
  //TODO Start Auth ------------------------------------------------------------

  Future<NetworkResponse> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();

    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/register/',
        data: {
          "full_name": fullName,
          "email": email,
          "password": password,
        },
      );

      if (response.statusCode != 201) {
        networkResponse.errorText = "This email is already registered.";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  Future<NetworkResponse> verify({
    required String email,
    required String activateCode,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/activate/',
        data: {
          "email": email,
          "activate_code": activateCode,
        },
      );

      if (response.statusCode == 200) {
        networkResponse.errorText = response.data["message"];
      } else {
        networkResponse.errorText = "Error password :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  Future<NetworkResponse> login({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/login/',
        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200) {
        networkResponse.data = UserModel.fromJson(response.data["user"]);
      } else {
        networkResponse.errorText = "Error password or not profile :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  Future<NetworkResponse> resetPassword({
    required String email,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/reset-password/',
        data: {"email": email},
      );

      if (response.statusCode != 200) {
        networkResponse.errorText =
            response.data["detail"] as String? ?? "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

  Future<NetworkResponse> resetPasswordConfirm({
    required String email,
    required String activateCode,
    required String newPassword,
    required String confirmPassword,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/reset-password-confirm/',
        data: {
          "email": email,
          "activation_code": activateCode,
          "new_password": newPassword,
          "confirm_password": confirmPassword,
        },
      );

      if (response.statusCode == 200) {
        networkResponse.data = response.data["detail"] as String? ?? "Good :)";
      } else {
        networkResponse.data = response.data["detail"] as String? ?? "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

//TODO End Auth ------------------------------------------------------------
}
