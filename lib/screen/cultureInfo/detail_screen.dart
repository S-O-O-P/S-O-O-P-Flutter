import 'package:flutter/material.dart';
import 'package:linkbee/apis/cultureInfo/culture_detail_info_api.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/navigation_bar.dart';

class DetailScreen extends StatefulWidget {
  final String seq;
  const DetailScreen({required this.seq, Key ? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final int currentPage = 1;
  Map<String, dynamic> detailInfo={};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await getCultureDetailInfoRequest(widget.seq);
      if (data != null) {
        Map<String, dynamic> tempPickList = {};
        // for (var item in data) {
        //   tempPickList.add({
        //     "thumbnail": item["thumbnail"],
        //     "area": item["area"],
        //     "title": item["title"],
        //     "place": item["place"],
        //     "startDate": item["startDate"],
        //     "endDate": item["endDate"],
        //     "seq": widget.seq,
        //   });
        // }
        setState(() {
          detailInfo = tempPickList; // pickList 업데이트
          print('detailInfo :'+ data.toString());
        });
      } else {
        print('Failed to fetch data.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  detailInfo?["thumbnail"] ?? "",
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
                      detailInfo?["title"] ?? "",
                      //detailInfo?["title"].replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll("&#39;", "'")
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
                      detailInfo?["price"] ?? "가격 정보가 없습니다.",
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
