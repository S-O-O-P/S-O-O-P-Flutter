import 'package:flutter/material.dart';
import 'package:linkbee/apis/main/culture_info_api.dart';
import 'package:linkbee/apis/main/early_bird_api.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/model/cultureinfo_item.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/loading_page.dart';
import 'package:linkbee/widget/navigation_bar.dart';

class CultureInfoScreen extends StatefulWidget {
  const CultureInfoScreen({Key? key}) : super(key: key);

  @override
  State<CultureInfoScreen> createState() => _CultureInfoScreenState();
}

class _CultureInfoScreenState extends State<CultureInfoScreen> {
  final int currentPage = 1;

  List<dynamic> earlyBirdList = [];
  List cultureList = [];

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
        setState(() {
          cultureList = data; // cultureList 업데이트
        });
      } else {
        print('Failed to fetch data.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }

    earlyData(); // earlyData 호출
  }

  // 얼리버드 공연/전시 정보 불러오기
  void earlyData() async {
    List<dynamic> allEarlyBirds = await selectAllEarlyBirdInfo();
    debugPrint("earlyData : ${allEarlyBirds}");
    setState(() {
      earlyBirdList = allEarlyBirds;
    });
    debugPrint("earlyList : ${earlyBirdList}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
        child: SingleChildScrollView(
            child: cultureList == null
                ? LoadingPage()
                : Container(
                    width: MediaQuery.of(context).size.width,
                    color: mainColor,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: Column(
                      children: [
                        LayoutBuilder(builder: (context, snapshot) {
                          return Column(
                            children: [
                              cultureInfoList(
                              context, snapshot, cultureList)
                            ],
                          );
                        }),
                      ],
                    ),
                  )),
      ),
    );
  }
}
