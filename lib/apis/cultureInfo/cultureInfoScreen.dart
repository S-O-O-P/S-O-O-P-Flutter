import 'package:flutter/material.dart';

class CultureInfoScreen extends StatelessWidget {
  const CultureInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('공연/전시 정보 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}