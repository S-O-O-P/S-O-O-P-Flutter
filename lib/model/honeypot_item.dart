import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';
// import 'package:url_launcher/url_launcher.dart';

Widget honeyPotListItem(List list){
  return CarouselSlider(
    items: list.map((item) {
      return Builder(
        builder: (context) {
          return
          // return GestureDetector(
          //     onTap: () async {
          //   final url = 'http://localhost:3001';
          //   if (await canLaunch(url)) {
          // await launch(url);
          // } else {
          // throw 'Could not launch $url';
          // }
          // },child:
             Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius:
                        BorderRadius.circular(20.0)),
                    child: Container(
                      width: 120,
                      // margin: EdgeInsets.symmetric(
                      //     vertical: 6.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(item["poster"]),
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14.0,
                    right: -6.0,
                    child: Container(
                      child: Column(
                        children: List.generate(7, (index) {
                          return Column(
                            children: [
                              Container(
                                width: 9.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ]),
                // 허니팟 이미지영역

                Container(
                  width:
                  MediaQuery.sizeOf(context).width - 160,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius:
                      BorderRadius.circular(20.0)),
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                        30.0)),
                                child: Text(
                                  item["region"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                      fontWeight:
                                      FontWeight.w600,
                                      color: white),
                                ),
                              ),
                              SizedBox(
                                width: 6.0,
                              ),
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: categoryGenre,
                                    borderRadius:
                                    BorderRadius.circular(
                                        30.0)),
                                child: Text(
                                  item["interestName"],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                      fontWeight:
                                      FontWeight.w600,
                                      color: white),
                                ),
                              ),
                            ],
                          ), // 지역 / 장르 카테고리 표시
                          Container(
                            height: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: pointColor,
                                borderRadius:
                                BorderRadius.circular(
                                    30.0)),
                            child: Text(
                              "모집중",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        item["honeypotTitle"],
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ), // 허니팟 제목
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: pointColor,
                                    borderRadius:
                                    BorderRadius.circular(
                                        30.0)),
                                child: Text(
                                  "일정",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                      fontWeight:
                                      FontWeight.w600,
                                      color: white),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '${item["eventDate"]} (${item["eventDay"]})',
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall!
                                    .copyWith(
                                    fontWeight:
                                    FontWeight.w500),
                              )
                            ],
                          ), // 참여일정
                        ],
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: pointColor,
                                borderRadius:
                                BorderRadius.circular(
                                    30.0)),
                            child: Text(
                              "참여 인원",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                  fontWeight:
                                  FontWeight.w600,
                                  color: white),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "${item["approvedCount"] + 1} / ${item["totalMember"]}",
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                fontWeight:
                                FontWeight.w500),
                          )
                        ],
                      ), // 참여인원
                      SizedBox(
                        height: 20.0,
                      ),
                      // 모집 마감 기간
                      Text(
                        "${item["endDate"]} 까지 모집해요",
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ), // 허니팟 텍스트 영역
              ],
            ),
          );
        },
      );
    }).toList(),

    //Slider Container properties
    options: CarouselOptions(
      height: 220.0,
      autoPlay: true,
      aspectRatio: 16 / 9,
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      viewportFraction: 1.0,
    ),
  );
}