import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> selectAllEarlyBirdInfo() async {
  try {
    final response = await http.get(Uri.parse('http://10.0.2.2:8081/cultureinfo/early'));
    print('API Response All: ${response.body}'); // 디버깅을 위한 로그

    if (response.statusCode == 200) {
      print('status 200: ${response.body}'); // 디버깅을 위한 로그
      final jsonData = json.decode(response.body);
      final List<dynamic> filteredValidList = jsonData['earlyBirdList'].where((item) {
        // Assuming item['saleEndDate'] is an integer representing timestamp
        final saleEndDate = DateTime.fromMillisecondsSinceEpoch(item['saleEndDate']);
        return saleEndDate.isAfter(DateTime.now());
      }).toList();

      print("filteredValidList: $filteredValidList");
      return filteredValidList;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('ERROR OCCURS! $error');
    return []; // 에러 발생 시 빈 배열 반환
  }
}

Future<Map<String, dynamic>> selectDetailEarlyBirdInfo(String earlyCode) async {
  try {
    final response = await http.get(Uri.parse('http://localhost:8081/cultureinfo/early/$earlyCode'));
    print('API Response detail: ${response.body}'); // 디버깅을 위한 로그

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final Map<String, dynamic> foundEarlyInfo = jsonData['foundEarlyInfo'] ?? {};
      print('Fetched Event for detail: ${foundEarlyInfo['ebTitle']}'); // Log the fetched data
      return foundEarlyInfo;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('ERROR OCCURS! detail: $error');
    return {}; // 에러 발생 시 빈 객체 반환
  }
}