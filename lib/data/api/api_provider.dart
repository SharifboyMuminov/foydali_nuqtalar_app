import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:foydali_nuqtalar/data/api/api_client.dart';
import 'package:foydali_nuqtalar/data/local/storage_repository.dart';
import 'package:foydali_nuqtalar/data/models/app_info/app_info_model.dart';
import 'package:foydali_nuqtalar/data/models/book/book_model.dart';
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
        data: jsonEncode(
            {"full_name": fullName, "email": email, "password": password}),
      );

      if (response.statusCode != 201) {
        networkResponse.errorText = "This email is already registered.";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "With this Email already exists.";
    }

    return networkResponse;
  }

  Future<NetworkResponse> verify({
    required String email,
    required int activateCode,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/activate/',
        data: jsonEncode({"email": email, "activate_code": activateCode}),
      );

      if (response.statusCode == 200) {
        debugPrint("${response.data} -------------");
        networkResponse.errorText = response.data["message"];
      } else {
        networkResponse.errorText = "Error password :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      // debugPrint("${error}  ----------------");
      networkResponse.errorText = "Error activate code or email";
    }

    return networkResponse;
  }

  Future<NetworkResponse> login({
    required String email,
    required String password,
  }) async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      debugPrint("Password: $password");
      Response response = await dio.post(
        'https://nuqtalar.idrok.group/api/users/login/',
        data: jsonEncode({"email": email, "password": password}),
      );

      if (response.statusCode == 200) {
        String fullName =
            "${response.data['first_name'] as String? ?? ""} ${response.data['last_name'] as String? ?? ""}";

        StorageRepository.setString(
          key: "user_full_name",
          value: fullName,
        );
        StorageRepository.setString(
          key: "email",
          value: response.data['email'] as String? ?? "",
        );

        networkResponse.data = UserModel.fromJson(response.data["user"]);
      } else {
        networkResponse.errorText = "Error password or not profile :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = "No user or error emil or password :(";
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

//TODO start App info ------------------------------------------------------------

  Future<NetworkResponse> getAppInfo() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.get(
        'https://nuqtalar.idrok.group/api/infos/info/',
      );

      if (response.statusCode == 200) {
        networkResponse.data = (response.data["results"] as List?)
                ?.map((e) => AppInfoModel.fromJson(e))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }

//TODO End App info ------------------------------------------------------------

//TODO Start Book  ------------------------------------------------------------
  Future<NetworkResponse> fetchBooks() async {
    NetworkResponse networkResponse = NetworkResponse();
    try {
      Response response = await dio.get(
        'https://nuqtalar.idrok.group/api/book/?limit=5',
      );

      if (response.statusCode == 200) {
        networkResponse.data = (response.data["results"] as List?)
                ?.map((e) => BookModel.fromJson(e["translate"]["uz"]))
                .toList() ??
            [];
      } else {
        networkResponse.errorText = "Error :(";
      }
    } on SocketException {
      networkResponse.errorText = "No Internet connection";
    } catch (error) {
      networkResponse.errorText = error.toString();
    }

    return networkResponse;
  }
//TODO End Book  ------------------------------------------------------------
}
