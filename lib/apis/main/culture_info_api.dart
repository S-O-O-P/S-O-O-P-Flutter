import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';
import 'dart:async';
import 'dart:convert';

Future<List<dynamic>?> getCultureInfoRequest() async {
  const serviceKey = 'w29wQLe/8/4PUJf0wWdFZPENtTTQMK4bZD1AENMUNoy5ix8lTvxxLy7xu3y95HzLURbtwRbCPupqzu3Vj20zJw=='; // 서비스 인증키
  const url = 'http://www.culture.go.kr/openapi/rest/publicperformancedisplays/realm'; //기간별 공연/전시 정보 목록 조회 요청 url

  // 조회시 요청 parameters
  final queryParams = {
    'serviceKey': serviceKey,
    'keyword': '',
    'ComMsgHeader': '',
    'RequestTime': '20240701:23003422', // 요청 기간
    'CallBackURI': '',
    'MsgBody': '',
    'cPage': '1',
    'rows': '50', // 1페이지에 불러올 데이터 갯수
    'from': '20240715', // 시작일
    'to': '20240719' // 종료일
  };

  final uri = Uri.parse(url).replace(queryParameters: queryParams);

  try {

    final response = await http.get(uri);

    debugPrint('API Call End: $url, Status: ${response.statusCode}');

    if (response.statusCode >= 200 && response.statusCode < 300) {
      // UTF-8로 디코딩
      final xmlText = utf8.decode(response.bodyBytes);
      final xmlDom = XmlDocument.parse(xmlText); // XML 문자열을 XML DOM 객체로 변환
      final jsonData = xmlToJson(xmlDom); // XML 데이터를 JSON 형식으로 변환
      debugPrint('from CultureApi: ${jsonData}');
      // perforList만 추출하여 반환
      final perforList = jsonData['response']['msgBody'][0]['perforList'];
      return perforList;
    } else {
      // 오류 처리
      debugPrint('Network response was not ok ${response.reasonPhrase}');
      return null;
    }
  } catch (e) {
    // 네트워크 오류 처리
    debugPrint('XMLHttpRequest failed: $e');
    return null;
  }
}

Map<String, dynamic> xmlToJson(XmlDocument xml) {
  final result = <String, dynamic>{};
  final root = xml.rootElement;

  Map<String, dynamic> parseNode(XmlElement node) {
    final obj = <String, dynamic>{};

    node.attributes.forEach((attr) {
      obj[attr.name.toString()] = attr.value;
    });

    node.children.whereType<XmlElement>().forEach((child) {
      final childObj = parseNode(child);
      if (child.children.length == 1 && child.firstChild is XmlText) {
        obj[child.name.toString()] = child.text.trim();
      } else {
        if (!obj.containsKey(child.name.toString())) {
          obj[child.name.toString()] = [];
        }
        (obj[child.name.toString()] as List).add(childObj);
      }
    });

    return obj;
  }

  result[root.name.toString()] = parseNode(root);
  return result;
}