import 'package:flutter/material.dart';
import 'package:linkbee/widget/appbar.dart';
import 'package:linkbee/widget/navigationbar.dart';

class HoneypotScreen extends StatelessWidget {
  const HoneypotScreen({Key? key}) : super(key: key);

  final int currentPage = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
        child: Text('허니팟 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}