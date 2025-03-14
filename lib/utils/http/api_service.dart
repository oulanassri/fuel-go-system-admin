// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../../models/city.dart';
// import '../../native_service/get_storage.dart';
// import '../constants/api_constants.dart';
//
// class ApiService {
//   static final String _baseUrl = APIConstants.baseUrl;
//   static final String token = UserStorage.read('token');
//
//   static Future<List<CityModel>> getCities() async {
//     List<CityModel> cities = [];
//     var response = await http.get(
//         Uri.parse('$_baseUrl${APIConstants.endPoints.getCities}'),
//         headers: {
//           'Content-Type': 'application/json',
//         });
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       List<dynamic> body = json.decode(response.body);
//
//       for (int i = 0; i < body.length; i++) {
//         cities.add(CityModel(id: body[i]["id"], name: body[i]["name"]));
//       }
//       return cities;
//     } else {
//       throw Exception('Failed to load date: ${response.statusCode}');
//     }
//   }
// }
