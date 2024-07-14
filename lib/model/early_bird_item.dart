import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget buildEarlyImageList(BuildContext context, BoxConstraints constraints, List earlyList) {
  return ListView(
    physics: const PageScrollPhysics(),
    scrollDirection: Axis.horizontal,
    children: earlyList.map((item) {
      return buildEarlyImageItem(context, constraints, item);
    }).toList(),
  );
}

Widget buildEarlyImageItem(BuildContext context, BoxConstraints constraints, item) {
  NumberFormat formatter = NumberFormat('#,###');

  return Container(
    width: (MediaQuery.of(context).size.width / 2) - 20,
    margin: EdgeInsets.symmetric(horizontal: 10.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(item["poster"]),
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
        ),
        SizedBox(
          height: 6.0,
        ),
        Text(
          item["ebTitle"],
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          //DateTime.fromMillisecondsSinceEpoch(item['saleEndDate'])
          "${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(item['saleStartDate']))} ~ ${DateFormat('yyyy-MM-dd').format(DateTime.fromMillisecondsSinceEpoch(item['saleEndDate']))}",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(
              "${(((item["regularPrice"] - item["discountPrice"]) / item["regularPrice"]) * 100).round()}%",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.redAccent,
              ),
            ),
            SizedBox(
              width: 6.0,
            ),
            Text(
              "${formatter.format(item["discountPrice"])}원",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    ),
  );
}