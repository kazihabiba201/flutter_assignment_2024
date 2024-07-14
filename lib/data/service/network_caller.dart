import 'dart:convert';

import 'package:flutter_assignment_2024/data/model/network_response.dart';
import 'package:http/http.dart';


class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      final response = await get(Uri.parse(url));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      print('Error in network request: $e');
    }

    return NetworkResponse(false, -1, null);
  }
}
