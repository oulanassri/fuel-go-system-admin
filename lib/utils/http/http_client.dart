import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../native_service/get_storage.dart';
import '../constants/api_constants.dart';

class THttpHelper {
  static final String _baseUrl = APIConstants.baseUrl;
  static final String token = UserStorage.read('token');
  //Helper method to make a GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    final response = await http.get(Uri.parse('$_baseUrl$endpoint'));
    return _handleResponse(response);
  }

  //Helper method to make a POST request
  static Future<Map<String, dynamic>> post(
      {required String endpoint, required dynamic data}) async {
    final response = await http.post(Uri.parse('$_baseUrl$endpoint'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(data));
    return _handleResponse(response);
  }

  //Helper method to make a PUT request
  static Future<Map<String, dynamic>> put(String endpoint, dynamic data) async {
    final response = await http.put(Uri.parse('$_baseUrl$endpoint'),
        headers: {'Content-Type': 'application/json; charset=utf-8'}, body: json.encode(data));
    return _handleResponse(response);
  }

  //Helper method to make a DELETE request
  static Future<Map<String, dynamic>> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$_baseUrl$endpoint'));
    return _handleResponse(response);
  }

  //Handle the HTTP response
  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      print("response.statusCode ${response.statusCode}");
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load date: ${response.statusCode}');
    }
  }
}
