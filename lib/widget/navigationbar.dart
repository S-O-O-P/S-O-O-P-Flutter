import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:linkbee/const/colors.dart';

Widget bottomNavigator(BuildContext context, int? currentIndex){
  return NavigationBar(
    height: 60,
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    indicatorColor: white,
    backgroundColor: white,
    elevation: 1,
    onDestinationSelected: (int index) {
      currentIndex = index;
      if(index == 0){ // home
        Navigator.of(context).pushReplacementNamed('/home_screen');
      }else if(index == 1){ // search
        Navigator.of(context).pushReplacementNamed('/cultureInfo');
      }else if(index == 2){ // horoscope
        Navigator.of(context).pushReplacementNamed('/honeypot');
      }else if(index == 3){ // favorites
        Navigator.of(context).pushReplacementNamed('/mypage');
      }
    },
    selectedIndex: currentIndex!,
    destinations: <Widget>[
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 0 ? 'assets/images/common/icon_home_active.png' : 'assets/images/common/icon_home_inactive.png'), width: 28, height: 28,),
            Text('홈', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 10),)
          ],
        ),
        label: '홈',
      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 1 ? 'assets/images/common/icon_ticket_active.png' : 'assets/images/common/icon_ticket_inactive.png'), width: 28, height: 28,),
            Text('공연/전시', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 10),)
          ],
        ),
        label: '공연/전시',
      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 2 ? 'assets/images/common/icon_hive_active.png' : 'assets/images/common/icon_hive_inactive.png'), width: 28, height: 28,),
            Text('허니팟', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 10),)
          ],
        ),
        label: '허니팟',

      ),
      NavigationDestination(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(currentIndex == 3 ? 'assets/images/common/icon_user_active.png' : 'assets/images/common/icon_user_inactive.png'), width: 28, height: 28,),
            Text('마이', style: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 10),)
          ],),
        label: '',
      ),
    ],
  );
}