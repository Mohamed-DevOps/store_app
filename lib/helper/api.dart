import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    final http.Response response =
        await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Request failed with status: ${response.statusCode}.");
    }
  }

  Future post({
    required String url,
    required body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          "Request failed with status: ${response.statusCode}, with body ${jsonDecode(response.body)}");
    }
  }

  Future put({
    required String url,
    required body,
    String? token,
  }) async {
    Map<String, String> headers = {};

    headers.addAll({
      'Content-Type': 'application/x-www-form-urlencoded',
    });

    if (token != null) {
      headers.addAll({
        'Authorization': "Bearer $token",
      });
    }

    debugPrint('url = $url, body = $body, token = $token');

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );

    if (response.statusCode == 200) {
      debugPrint(jsonDecode(response.body));

      return jsonDecode(response.body);
    } else {
      throw Exception(
          "Request failed with status: ${response.statusCode}, with body ${jsonDecode(response.body)}");
    }
  }
}
