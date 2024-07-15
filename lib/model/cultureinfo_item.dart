import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/screen/cultureInfo/detail_screen.dart';

Widget cultureInfoList(BuildContext context, BoxConstraints constraints, List earlyList) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 0.7,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemCount: earlyList.length,
    itemBuilder: (context, index) {
      return cultureInfoItem(context, constraints, earlyList[index]);
    },
  );
}

Widget cultureInfoItem(BuildContext context, BoxConstraints constraints, item) {
  NumberFormat formatter = NumberFormat('#,###');

  return GestureDetector(
      onTap: () {
    // 상세 페이지로 이동하며 item["seq"] 데이터를 넘겨줍니다.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(seq: item["seq"]),
      ),
    );
  },
  child: Card(
    elevation: 2,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(item["thumbnail"]),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Positioned(
                top: 10.0,
                left: 10.0,
                child:Container(
                  height: 20,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius:
                      BorderRadius.circular(
                          30.0)),
                  child: Text(
                    item?["area"] == Null ? "지역정보없음" : item?["area"],
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(
                        fontWeight:
                        FontWeight.w600,
                        color: white),
                  ),
                ),
            ),
          ]
        ),
        SizedBox(
          height: 6.0,
        ),
        Container(
          padding: EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item["title"].replaceAll('&lt;', '<').replaceAll('&gt;', '>').replaceAll("&#39;", "'"),
                style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w700),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                item["place"],
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text(
                "${DateFormat('yyyy-MM-dd').format(DateTime.parse(item['startDate']))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.parse(item['endDate']))}",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
    ),)
  );
}