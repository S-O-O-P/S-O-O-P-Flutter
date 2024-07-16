import 'dart:async';
import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: mainColor,
        ),
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: white,
                  borderRadius:
                  BorderRadius.circular(120.0)),
              child: Center(
                child: Container(
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(120.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/common/logo.png"),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              '🍯잠시만 기다려주세요🐝',
              style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'SUIT',
                  fontWeight: FontWeight.w700,
                  color: white),
            ),
            Positioned(
                top: 100,
                left: -100,
                child: Center(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      color: white,
                      backgroundColor: pointColor,
                      strokeWidth: 5,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}