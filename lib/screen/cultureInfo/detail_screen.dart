import 'package:flutter/material.dart';
import 'package:linkbee/apis/cultureInfo/culture_detail_info_api.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/screen/splash_screen.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/loading_page.dart';
import 'package:linkbee/widget/navigation_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  final dynamic seq;
  const DetailScreen({required this.seq, Key ? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final int currentPage = 1;
  Map<String, dynamic> detailInfo={
        "imgUrl": "",
        "area": "",
        "title": "",
        "place": "",
        "startDate": "",
        "endDate": "",
        "placeUrl":"",
        "phone":"",
        "seq": "",
  };

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await getCultureDetailInfoRequest(widget.seq);
      print('Raw API response: $data');
      if (data != null) {
        print('data from detail screen : $data');
        setState(() {
          if (data is List && data.isNotEmpty) {
            // 리스트인 경우 첫 번째 항목 사용
            detailInfo = Map<String, dynamic>.from(data[0]);
          } else {
            print('Unexpected data format or empty list');
          }
        });
        print('detailInfo : $detailInfo');
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300.0,
                  child: detailInfo["imgUrl"].isEmpty
                    ? SplashScreen()
                    : Image.network(
                      detailInfo["imgUrl"],
                      fit: BoxFit.cover,
                  ),
                ),
                // 텍스트 영역
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "관람 제목",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Container(
                            width: MediaQuery.of(context).size.width - 140,
                            padding: EdgeInsets.only(top: 6.0),
                            child: Text(
                              detailInfo["title"].replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll("&#39;", "'"),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: black,
                                height: 1.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "관람 가격",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            detailInfo["price"] ?? "가격 정보가 없습니다.",
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                fontWeight:
                                FontWeight.w600,
                                color: black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "관람 지역",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            detailInfo["area"],
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                fontWeight:
                                FontWeight.w600,
                                color: black),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "관람 장소",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                detailInfo["place"],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                    fontWeight:
                                    FontWeight.w600,
                                    color: black),
                              ),
                              detailInfo["placeUrl"] != null ? GestureDetector(
                                onTap: () async {
                                  final url = Uri.parse(detailInfo["placeUrl"]);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Container(
                                  height: 36,
                                  margin: EdgeInsets.only(top: 10.0),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                      color: pointColor,
                                      borderRadius:
                                      BorderRadius.circular(
                                          36.0)),
                                  child: Text(
                                    "바로가기",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                        fontWeight:
                                        FontWeight.w600,
                                        color: white),
                                  ),
                                ),
                              ) : Text(
                                "현재 관람 장소 홈페이지 정보가 없습니다.\n추후 업데이트하겠습니다.",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                    fontWeight:
                                    FontWeight.w600,
                                    color: white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      detailInfo["phone"] != null ? Row(
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "관람 문의",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Text(
                            detailInfo["phone"],
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                fontWeight:
                                FontWeight.w600,
                                color: black),
                          ),
                        ],
                      ) : Visibility(
                        visible: false,
                        child: Container(),
                      ),
                      SizedBox(height: 20.0),
                      detailInfo["url"] != null ? Row(
                        children: [
                          Container(
                            height: 36,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.0),
                            decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius:
                                BorderRadius.circular(
                                    36.0)),
                            child: Text(
                              "추가 정보",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          GestureDetector(
                            onTap: () async {
                              final url = Uri.parse(detailInfo["url"]);
                              if (await canLaunchUrl(url)) {
                                await launchUrl(url);
                              } else {
                                throw 'Could not launch $url';
                              }},
                            child: Container(
                              width: MediaQuery.of(context).size.width - 140,
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text(
                                // detailInfo["url"]?.toString(),
                                "수정중",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                    fontWeight:
                                    FontWeight.w600,
                                    color: black,
                                    decoration: TextDecoration.underline,
                                    decorationColor: mainColor,
                                    height: 1.5,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                // maxLines: 2,
                              ),
                            ),
                          )
                        ],
                      ) : Visibility(
                        visible: false,
                        child: Container(),
                      ),
                      SizedBox(height: 40,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}


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
