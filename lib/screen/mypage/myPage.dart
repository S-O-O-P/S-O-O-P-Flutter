import 'package:flutter/material.dart';
import 'package:linkbee/widget/appbar.dart';
import 'package:linkbee/widget/navigationbar.dart';

class MypageScreen extends StatelessWidget {
  const MypageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentPage = 3;

    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
        child: Text('마이 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}