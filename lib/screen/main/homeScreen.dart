import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/widget/appbar.dart';
import 'package:linkbee/widget/navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // navigationbar - currentIndex 매개변수
  final int currentPage = 0;

  List imageList = [
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/ck3S/image/6wW3rm9SeiAdNC4iXCnEPkhEc4A.PNG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmsWrmDdVV_xKtEPxKaXfa_sGr7ab0lKRRA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIvb95UFMPgATAt9wZvq4xgZOag1iH0rnGRJsqCi_VJq-rXRvqgcLKKrZ-YSaK22PK01M&usqp=CAU",
    "https://pbs.twimg.com/media/FWfE9ULaQAAZqaB.jpg:large",
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/eiZd/image/WK5bu4dZ3NBYy3e0NZduoMH3yZM.JPG",
  ];

  List earlyImageList = [
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/ck3S/image/6wW3rm9SeiAdNC4iXCnEPkhEc4A.PNG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmsWrmDdVV_xKtEPxKaXfa_sGr7ab0lKRRA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIvb95UFMPgATAt9wZvq4xgZOag1iH0rnGRJsqCi_VJq-rXRvqgcLKKrZ-YSaK22PK01M&usqp=CAU",
    "https://pbs.twimg.com/media/FWfE9ULaQAAZqaB.jpg:large",
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/eiZd/image/WK5bu4dZ3NBYy3e0NZduoMH3yZM.JPG",
  ];

  @override
  Widget build(BuildContext context) {
    // 기기 화면 width
    // double screenWidth = MediaQuery.of(context).size.width;
    // style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/images/main/bg_01.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "링크비 Picks",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: white, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      items: imageList.map((imgLink) {
                        return Builder(
                          builder: (context) {
                            return Container(
                              margin: EdgeInsets.all(6.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: NetworkImage(imgLink),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),

                      //Slider Container properties
                      options: CarouselOptions(
                        height: 300.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 3 / 4,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 40,
              ),
              Stack(children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/images/main/bg_02.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "얼리버드",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 260,
                      child: LayoutBuilder(builder: (context, snapshot) {
                        return ListView(
                          physics: const PageScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: imageList.map((imgLink) {
                            return Container(
                              width:
                                  (MediaQuery.of(context).size.width / 2) - 20,
                              margin: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: NetworkImage(imgLink),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    "얼리버드 제목",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "2024.07.08 ~ 2024.07.20",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "50%",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600,
                                                color: Colors.redAccent),
                                      ),
                                      SizedBox(
                                        width: 6.0,
                                      ),
                                      Text(
                                        "5,000원",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayLarge!
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    ),
                  ],
                )
              ]),
              SizedBox(
                height: 40,
              ),
              Stack(children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/images/main/bg_03.svg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "허니팟",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CarouselSlider(
                      items: imageList.map((imgLink) {
                        return Builder(
                          builder: (context) {
                            return Container(
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
                                            image: NetworkImage(imgLink),
                                            fit: BoxFit.cover,
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
                                                    "서울",
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
                                                    "전시",
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
                                          "서양미술 800년 전 같이 가실 분 :-)",
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
                                                  "2024.07.20 (토)",
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
                                              "1 / 2",
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
                                          "2024.07.19 까지 모집해요",
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
                        height: 240.0,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 1.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
