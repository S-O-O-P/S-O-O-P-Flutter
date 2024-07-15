import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:linkbee/const/colors.dart';

Widget cultureInfoList(BuildContext context, BoxConstraints constraints, List earlyList) {
  // return Column(
  //   children: earlyList.map((item) {
  //     return cultureInfoItem(context, constraints, item);
  //   }).toList(),
  // );
  return ListView.builder(
    itemCount: (earlyList.length / 2).ceil(),
    itemBuilder: (context, index) {
      return Row(
        children: [
          Expanded(
            child: cultureInfoItem(context, constraints, earlyList[index * 2]),
          ),
          SizedBox(width: 10), // 간격 조정을 위한 SizedBox 추가
          if ((index * 2 + 1) < earlyList.length)
            Expanded(
              child: cultureInfoItem(context, constraints, earlyList[index * 2 + 1]),
            ),
        ],
      );
    },
  );
}

Widget cultureInfoItem(BuildContext context, BoxConstraints constraints, item) {
  NumberFormat formatter = NumberFormat('#,###');

  return Container(
    width: (MediaQuery.of(context).size.width / 2) - 20,
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 180,
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
        Text(
          item["title"],
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          item["place"],
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          //DateTime.fromMillisecondsSinceEpoch(item['saleEndDate'])
          "${DateFormat('yyyy-MM-dd').format(DateTime.parse(item['startDate']))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.parse(item['endDate']))}",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(
          width: 20.0,
        ),
      ],
    ),
  );
}