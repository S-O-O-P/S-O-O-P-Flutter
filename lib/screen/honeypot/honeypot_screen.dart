import 'package:flutter/material.dart';
import 'package:linkbee/apis/main/honeypot_api.dart';
import 'package:linkbee/model/honeypot_list_item.dart';
import 'package:linkbee/screen/splash_screen.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/navigation_bar.dart';

class HoneypotScreen extends StatefulWidget {
  const HoneypotScreen({Key? key}) : super(key: key);

  @override
  State<HoneypotScreen> createState() => _HoneypotScreenState();
}

class _HoneypotScreenState extends State<HoneypotScreen> {
  final int currentPage = 2;

  List honeyList = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      final data = await selectAllHoneypot();
      if (data != null) {
        setState(() {
          honeyList = data;
        });
      } else {
        debugPrint("허니팟 리스트 호출 성공");
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
        child: Container(
          // color: mainColor,
          child:honeyList.isEmpty
              ? const SplashScreen()
              : honeyPotListItem(context, honeyList),
        )
      ),
    );
  }
}