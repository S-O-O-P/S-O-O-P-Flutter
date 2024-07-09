import 'package:flutter/material.dart';

class NoticeScreen extends StatelessWidget {
  const NoticeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text('공지사항 페이지 ', style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w700)),
      ),
    );
  }
}