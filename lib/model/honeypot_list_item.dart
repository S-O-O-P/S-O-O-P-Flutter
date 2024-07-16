import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:linkbee/const/colors.dart';
import 'package:url_launcher/url_launcher.dart';

Widget honeyPotListItem(BuildContext context, List list) {
  return SingleChildScrollView(
    child: Column(
      children: list.map((item) {
        return GestureDetector(
            onTap: () async {
              final url = Uri.parse('https://www.daum.net/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }},
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Stack(children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      width: 130,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: NetworkImage(item["poster"]),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 14.0,
                    right: -4.0,
                    child: Container(
                      child: Column(
                        children: List.generate(7, (index) {
                          return Column(
                            children: [
                              Container(
                                width: 9.0,
                                height: 18.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          );
                        }),
                      ),
                    ),
                  ),
                ]),
                Container(
                  width: MediaQuery.of(context).size.width - 170,
                  height: 200,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border(
                      top: BorderSide(color: mainColor, width: 1),
                      right: BorderSide(color: mainColor, width: 1),
                      bottom: BorderSide(color: mainColor, width: 1),
                      ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: mainColor,
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Text(
                                  item["region"],
                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: white
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.0),
                              Container(
                                height: 20,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                decoration: BoxDecoration(
                                    color: categoryGenre,
                                    borderRadius: BorderRadius.circular(30.0)
                                ),
                                child: Text(
                                  item["interestName"],
                                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: white
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: pointColor,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Text(
                              "모집중",
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: white
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        item["honeypotTitle"],
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: pointColor,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Text(
                              "일정",
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: white
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            '${item["eventDate"]} (${item["eventDay"]})',
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 6.0),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: pointColor,
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Text(
                              "참여 인원",
                              style: Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: white
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "${item["approvedCount"] + 1} / ${item["totalMember"]}",
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        "${item["endDate"]} 까지 모집해요",
                        style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        );
      }).toList(),
    ),
  );
}
