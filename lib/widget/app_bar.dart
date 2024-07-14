import 'package:flutter/material.dart';
import 'package:linkbee/apis/cs/noticeScreen.dart';
// import 'package:linkbee/apis/main/homeScreen.dart';
import '../const/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: white,
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return InkWell(
            child: Row(
              children: [
                SizedBox(width: 20,),
                Image.asset(
                'assets/images/common/logo.png',
                width: 36,),
              ],
            ),
            onTap: (){
              Navigator.of(context).pushReplacementNamed('/home_screen');
            },
          );
        },
      ),
      // actions: [
      //   Builder(
      //     builder: (context) {
      //       return IconButton(
      //         icon: Icon(
      //           Icons.info_outline,
      //           color: mainColor,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).pushReplacementNamed('/notice');
      //         },
      //       );
      //     }
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}