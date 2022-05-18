import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../../configs/configs.dart';
// import '../../configs/configs.dart';

class NetworkState<T> {
  int? code;
  int? time;
  String? message;
  T? data;

  NetworkState({this.message, this.data, this.code, this.time});

  factory NetworkState.fromResponse(Response response, {converter, value, String? prefix}) {
    try {
      return NetworkState._fromJson(jsonDecode(jsonEncode(response.data)),
          converter: converter, prefix: prefix, value: value);
    } catch (e) {
      log("Error NetworkResponse.fromResponse: $e");
      return NetworkState.withErrorConvert(e);
    }
  }

  NetworkState._fromJson(dynamic json, {converter, value, String? prefix}) {
    code = json['code'];
    time = json['time'];
    message = json['msg'];
    if (value != null)
      data = value;
    else if (prefix != null) {
      if (prefix.trim().isEmpty)
        data = converter != null && json != null ? converter(json) : json;
      else
        data = converter != null && json[prefix] != null ? converter(json[prefix]) : json[prefix];
    } else {
      data =
      converter != null && json["data"] != null ? converter(json["data"]) : json["data"];
    }
  }

  NetworkState.fromJson(Map<String, dynamic> json) {
    this.message = json['msg'];
    this.code = json['code'];
    this.data = json['data'];
    this.time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.message;
    data['code'] = this.code;
    data['data'] = this.data;
    data['time'] = this.time;
    return data;
  }

  NetworkState.withError(DioError error) {
    String message;
    int? code;
    Response? response = error.response;
    if (response != null) {
      code = response.statusCode;
      message = response.data["message"];
    } else {
      code = AppEndpoint.ERROR_SERVER;
      message = "Không thể kết nối đến máy chủ!";
    }
    this.message = message;
    this.code = code;
    this.data = null;
    this.time = null;
  }

  NetworkState.withDisconnect() {
    message = "Mất kết nối internet, vui lòng kiểm tra wifi/3g và thử lại!";
    this.code = AppEndpoint.ERROR_DISCONNECT;
    this.data = null;
    this.time = null;
  }

  NetworkState.withErrorConvert(error) {
    this.data = null;
  }

  bool get isSuccess => code == AppEndpoint.SUCCESS;

  bool get isError => code != AppEndpoint.SUCCESS;
}
