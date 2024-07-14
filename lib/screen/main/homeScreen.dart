import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkbee/apis/main/culture_info_api.dart';
import 'package:linkbee/apis/main/early_bird_api.dart';
import 'package:linkbee/apis/main/honeypot_api.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/model/early_bird_item.dart';
import 'package:linkbee/model/honeypot_item.dart';
import 'package:linkbee/model/top_banner.dart';
import 'package:linkbee/screen/splash_screen.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/navigation_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // navigationbar - currentIndex 매개변수
  final int currentPage = 0;

  List<dynamic> earlyBirdList = [];
  List<dynamic> honeyList = [];
  // Map<String, dynamic> foundEarlyInfo = {};

  List earlyImageList = [
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/ck3S/image/6wW3rm9SeiAdNC4iXCnEPkhEc4A.PNG",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmsWrmDdVV_xKtEPxKaXfa_sGr7ab0lKRRA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIvb95UFMPgATAt9wZvq4xgZOag1iH0rnGRJsqCi_VJq-rXRvqgcLKKrZ-YSaK22PK01M&usqp=CAU",
    "https://pbs.twimg.com/media/FWfE9ULaQAAZqaB.jpg:large",
    "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/eiZd/image/WK5bu4dZ3NBYy3e0NZduoMH3yZM.JPG",
  ];

  List pickList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await getCultureInfoRequest();
      if (data != null) {
        List<Map<String, dynamic>> tempPickList = [];
        for (var item in data) {
          tempPickList.add({
            'seq': item['seq'],
            'thumbnail': item['thumbnail'],
          });
        }
        setState(() {
          pickList = tempPickList; // pickList 업데이트
        });
      } else {
        print('Failed to fetch data.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }

    earlyData(); // earlyData 호출
    honeyData(); // honeyData 호출
  }

  // 공공 api 호출
  // void pickData() async {
  //   final data = await getCultureInfoRequest();
  //   if (data != null) {
  //     // data를 사용하여 필요한 작업을 수행
  //     print('Fetched Data: $data');
  //     for (var item in data) {
  //       pickList.add({
  //         'seq': item['seq'],
  //         'thumbnail': item['thumbnail'],
  //       });
  //     }
  //     // print('PickList Data: $pickList');
  //     print('PickList Data: ${pickList[0]['thumbnail']}');
  //   } else {
  //     print('Failed to fetch data.');
  //   }
  // }

  // 얼리버드 공연/전시 정보 불러오기
  void earlyData() async {
    List<dynamic> allEarlyBirds = await selectAllEarlyBirdInfo();
    debugPrint("earlyData : ${allEarlyBirds}");
    setState(() {
      earlyBirdList = allEarlyBirds;
    });
    debugPrint("earlyList : ${earlyBirdList}");

    // 예시로 상세 데이터를 불러오는 예시 함수
    // String earlyCode = 'your_early_code_here'; // 예시로 사용할 얼리버드 코드
    // Map<String, dynamic> detailEarlyInfo = await selectDetailEarlyBirdInfo(earlyCode);
    // setState(() {
    //   foundEarlyInfo = detailEarlyInfo;
    // });
  }

  // 허니팟 정보 불러오기
  void honeyData() async {
    List<dynamic> honeyData = await selectAllHoneypot();
    debugPrint("honeyList Data : ${honeyData}");
    setState(() {
      honeyList = honeyData;
    });
    debugPrint("honeyList : ${honeyList}");
  }

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
          child: pickList == null ? SplashScreen() : Column(
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
                    buildCarouselSlider(pickList),
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
                        return buildEarlyImageList(context, snapshot, earlyBirdList);
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
                    honeyPotListItem(honeyList),
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


