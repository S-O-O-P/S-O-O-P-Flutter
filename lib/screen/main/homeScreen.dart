import 'package:flutter/material.dart';
import 'package:linkbee/widget/appbar.dart';
import 'package:linkbee/widget/navigationbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // navigationbar - currentIndex 매개변수
  final int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
      child: Text('링크비 Link Bee Home 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
    ),);
  }
}
