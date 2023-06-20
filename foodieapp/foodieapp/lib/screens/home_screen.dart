import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foodieapp/utils/get_bannerdata.dart';
import 'package:http/http.dart' as http;
import 'package:foodieapp/utils/list_of_urls.dart';
import 'package:loading_animations/loading_animations.dart';
// ignore: camel_case_types
// ...
class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  late Future<List<banner_Data>> _bannerData;

  Future<List<banner_Data>> fetchBannerData() async {
    var response = await http.get(Uri.parse(bannerdataurl));
    var bannerItems = <banner_Data>[];

    if (response.statusCode == 200) {
      var bannerItemsJson = jsonDecode(response.body);
      for (var bannerItem in bannerItemsJson) {
        bannerItems.add(banner_Data.fromJson(bannerItem));
      }
    }
    return bannerItems;
  }

  @override
  void initState() {
    _bannerData = fetchBannerData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<List<banner_Data>>(
        future: _bannerData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<banner_Data> bannerItems = snapshot.data!;
            return ListView(
              children: [
                Container(
                  height: screenHeight * .08,
                  width: screenWidth,
                ),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    height: (MediaQuery.of(context).size.height) * .23,
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 1, right: 1),
                      child: Stack(
                        children: [
                          Container(
                            height: (MediaQuery.of(context).size.height) * .23,
                            width: (MediaQuery.of(context).size.width) * .9,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(bannerItems[index].pic))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 2, left: 1),
                            child: SizedBox(
                              height:
                                  (MediaQuery.of(context).size.height) * .23,
                              width: (MediaQuery.of(context).size.width) * .5,
                              child: Text(
                                bannerItems[index].desc,
                                style: GoogleFonts.josefinSans(
                                  textStyle: TextStyle(
                                    fontSize: screenHeight * 0.04,
                                    fontWeight: FontWeight.w900,
                                    shadows: [
                                      Shadow(
                                          // bottomLeft
                                          offset: const Offset(-1.5, -1.5),
                                          color: Color(int.parse(
                                              bannerItems[index]
                                                  .foodcolourbg))),
                                      Shadow(
                                          // bottomRight
                                          offset: const Offset(1.5, -1.5),
                                          color: Color(int.parse(
                                              bannerItems[index]
                                                  .foodcolourbg))),
                                      Shadow(
                                          // topRight
                                          offset: const Offset(1.5, 1.5),
                                          color: Color(int.parse(
                                              bannerItems[index]
                                                  .foodcolourbg))),
                                      Shadow(
                                          // topLeft
                                          offset: const Offset(-1.5, 1.5),
                                          color: Color(int.parse(
                                              bannerItems[index]
                                                  .foodcolourbg))),
                                    ],
                                    color: Color(
                                      int.parse(bannerItems[index].foodcolour),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: bannerItems.length,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return  Center(
              child: LoadingBouncingLine.square(
         backgroundColor: Colors.blueAccent,
              ),
            );
          }
        },
      ),
    );
  }
}

// ...
