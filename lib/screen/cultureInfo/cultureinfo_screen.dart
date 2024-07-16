import 'package:flutter/material.dart';
import 'package:linkbee/apis/main/culture_info_api.dart';
import 'package:linkbee/const/colors.dart';
import 'package:linkbee/model/cultureinfo_item.dart';
import 'package:linkbee/screen/splash_screen.dart';
import 'package:linkbee/widget/app_bar.dart';
import 'package:linkbee/widget/navigation_bar.dart';

class CultureInfoScreen extends StatefulWidget {
  const CultureInfoScreen({Key? key}) : super(key: key);

  @override
  State<CultureInfoScreen> createState() => _CultureInfoScreenState();
}

class _CultureInfoScreenState extends State<CultureInfoScreen> {
  final int currentPage = 1;
  final TextEditingController _searchController = TextEditingController();

  List cultureList = [];
  List filteredCultureList = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterCultureList(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredCultureList = cultureList;
        isSearching = false;
      });
    } else {
      setState(() {
        filteredCultureList = cultureList.where((item) =>
            item['title'].toLowerCase().contains(query.toLowerCase())
        ).toList();
        isSearching = true;
      });
    }
  }

  void fetchData() async {
    try {
      final data = await getCultureInfoRequest();
      if (data != null) {
        setState(() {
          cultureList = data;
          filteredCultureList = data; // filteredCultureList도 같이 업데이트
        });
      } else {
        print('Failed to fetch data.');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: bottomNavigator(context, currentPage),
      body: SafeArea(
          child: Container(
        color: mainColor,
        child: Column(
          children: [
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children:[
                      Container(
                      height:48,
                      width: MediaQuery.of(context).size.width - 40,
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: '검색어를 입력하세요',
                          hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: mainColor,
                            fontWeight: FontWeight.w500,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.0),
                            borderSide: BorderSide(color: mainColor)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.0),
                            borderSide: BorderSide(color: mainColor), // 기본 상태의 border 컬러
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(48.0),
                            borderSide: BorderSide(color: pointColor), // focus 상태의 border 컬러
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 26.0, horizontal: 14.0),
                        ),
                        // onChanged: (value){
                        //   _filterCultureList(value);
                        // },
                      ),
                    ),
                  Positioned(
                    right: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.search, color: mainColor,),
                      onPressed: () {
                        _filterCultureList(_searchController.text);
                      },
                    ),
                  ),
                ],
                      ),
                  ]),

            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: cultureList.isEmpty
                  ? const SplashScreen()
                  : isSearching && filteredCultureList.isEmpty
                  ? Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('[${_searchController.text}]', style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),),
                      SizedBox(width: 6.0,),
                      Text('검색 결과가 없습니다', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: white,
                        fontWeight: FontWeight.w500,
                      ),),
                    ],
                  ))
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: cultureInfoList(context, BoxConstraints(), filteredCultureList),
                  ),
            ),
          ],
        ),
      )),
    );
  }
}
