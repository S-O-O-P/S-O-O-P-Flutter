import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/navigation_bar.dart';

class DetailScreen extends StatefulWidget {
  final int seq;
  const DetailScreen({required this.seq, Key ? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    // 임의의 item 데이터를 예시로 사용
    final Map<String, dynamic> item = {
      "thumbnail": "https://example.com/image.jpg",
      "area": "Seoul",
      "title": "Example Title",
      "place": "Example Place",
      "startDate": "2023-01-01",
      "endDate": "2023-12-31",
      "seq": widget.seq,
    };

    return Scaffold(
        appBar: MainAppBar(),
        bottomNavigationBar: bottomNavigator(context, currentPage),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 300.0,
                child: Image.network(
                  item["thumbnail"],
                  fit: BoxFit.cover,
                ),
              ),
              // 텍스트 영역
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '제목',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                          fontWeight:
                          FontWeight.w600,
                          color: black),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '여기에 상세 설명이 들어갑니다.',
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                          fontWeight:
                          FontWeight.w600,
                          color: black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
