import 'package:flutter/material.dart';
import 'package:linkbee/widget/appbar.dart';
import 'package:linkbee/widget/navigationbar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int currentPage = 4;

    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
        child: Text('로그인 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}
