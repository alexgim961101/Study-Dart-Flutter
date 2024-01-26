import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> listNewsInof = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // 뉴스 정보 가져오기
    getNewsInfo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  Future getNewsInfo() async {
    // 뉴스 정보를 가지고 오는 api 활용
    const apiKey = '202907e6849544cda4486a06c3ddd046';
    const apiUrl =
        'https://newsapi.org/v2/top-headlines?country=kr&apiKey=$apiKey';

    try {
      // 네트워크 통신 요청
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        // 한글 데이터 받을 시, UTF-8 오류 해결
        final Map<String, dynamic> responseData =
            json.decode(utf8.decode(response.bodyBytes));
        listNewsInof = responseData['articles'];

        listNewsInof.forEach((element) {
          print(element);
        });
      } else {
        throw Exception('Failed to load news');
      }
    } catch (error) {
      print(error);
    }
  }
}
