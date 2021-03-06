import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/utils/exception.dart';

enum RequestType { GET, POST, DELETE }

class ApiService {
  final String apiKey = '4343555b136db241cb08c95659de76cb';

  static final ApiService _instance = ApiService._internal();
  final String baseUrl = "https://api.openweathermap.org/data/2.5/";

  factory ApiService() => _instance;

  ApiService._internal();

  final Client _client = Client();

  final Map<int, String> HTTP_REQUEST_STATE_CODE = {
    200: "Ok",
    400: "Bad Request",
    401: "Unauthorized",
    403: "Forbidden",
    404: "Not Found",
    408: "Request Timeout",
  };

  Future<String> request(
      {@required RequestType requestType,
      @required String endPoint,
      dynamic parameter}) async {
    Uri url = Uri.parse("$baseUrl/$endPoint");
    switch (requestType) {
      case RequestType.GET:
        return await _processResponse(await _client.get(url));
      case RequestType.POST:
        return await _processResponse(await _client.post(url,
            headers: {
              "Content-Type": "application/json",
            },
            body: json.encode(parameter)));
      case RequestType.DELETE:
        return await _processResponse(await _client.delete(url));
      default:
        return null;
    }
  }

  Future<String> _processResponse(Response response) async {
    print(response.body);
    switch (response.statusCode) {
      case 200:
        {
          return response.body;
        }
      case 400:
        {
          List errors = json.decode(response.body);
          String message = errors[errors.length - 1];

          throw NetworkException(
              message: message, logMessage: HTTP_REQUEST_STATE_CODE[400]);
        }
      case 401:
        {
          throw NetworkException(message: HTTP_REQUEST_STATE_CODE[401]);
        }
      case 403:
        {
          throw NetworkException(message: HTTP_REQUEST_STATE_CODE[403]);
        }
      case 404:
        {
          throw NetworkException(message: HTTP_REQUEST_STATE_CODE[404]);
        }
      case 408:
        {
          throw NetworkException(message: HTTP_REQUEST_STATE_CODE[408]);
        }
      default:
        {
          throw NetworkException(message: "Unknown Error");
        }
    }
  }
}
