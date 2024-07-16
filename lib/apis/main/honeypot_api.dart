import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

Future<List<dynamic>> selectAllHoneypot() async {
  try {
    final response = await http.get(Uri.parse('http://10.0.2.2:8081/honeypot/listandapproved'));
    print('API Response All: ${response.body}'); // 디버깅을 위한 로그

    if (response.statusCode == 200) {
      print('status 200: ${response.body}'); // 디버깅을 위한 로그
      final jsonData = json.decode(utf8.decode(response.bodyBytes));
      final List<dynamic> filteredValidList = jsonData.where((item) {
        return item['closureStatus'] == "모집중";
      }).map((item) {
        DateTime eventDate = DateTime.parse(item['eventDate']);
        String weekday = DateFormat('EEE').format(eventDate); // 'EEE'는 풀 요일 이름을 출력

        // 요일을 item에 추가
        item['eventDay'] = weekday;
        return item;
      }).toList();

      return filteredValidList;
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    print('ERROR OCCURS! $error');
    return []; // 에러 발생 시 빈 배열 반환
  }
}
