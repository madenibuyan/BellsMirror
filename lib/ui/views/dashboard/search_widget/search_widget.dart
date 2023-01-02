import 'package:bells_mirror/ui/views/dashboard/news_details_widget/news_details.dart';
import 'package:bells_mirror/ui/views/dashboard/search_widget/search_widget_controller.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchWidgetController>(
        init: SearchWidgetController(),
        builder: (model) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(left: 20, right: 20),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                  Text(
                    "Discover",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "News from around bells",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    onChanged: model.filterSearch,
                    decoration: InputDecoration(
                        fillColor: Color(0xffEFEFEF),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Color(0xff929292),
                        ),
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  DefaultTabController(
                      initialIndex: 0,
                      length: 5,
                      child: Column(
                        children: [
                          TabBar(
                              isScrollable: true,
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              unselectedLabelColor: Color(0xffC1C1C1),
                              unselectedLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              tabs: <Tab>[
                                Tab(
                                  text: "Trending",
                                ),
                                Tab(
                                  text: "Events",
                                ),
                                Tab(
                                  text: "Announcement",
                                ),
                                Tab(
                                  text: "Sports",
                                ),
                                Tab(
                                  text: "Articles",
                                ),
                              ]),
                          //
                          // Container(
                          //   height: 50,
                          //   child: TabBarView(children:
                          //
                          //       [
                          //         Container(
                          //           height: 20,
                          //           color: Colors.blue,
                          //         ),
                          //         Container(
                          //           height: 20,
                          //           color: Colors.red,
                          //         ),
                          //         Container(
                          //           height: 20,
                          //           color: Colors.orange,
                          //         ),
                          //         Container(
                          //           height: 20,
                          //           color: Colors.green,
                          //         ),
                          //         Container(
                          //           height: 20,
                          //           color: Colors.blue,
                          //         ),
                          //       ]
                          //
                          //   ),
                          // ),
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                ])),
              ),
              model.newsList.isEmpty
                  ? SliverFillRemaining(
                child: Center(
                  child: Text(
                    "No News Yet",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ) :     SliverPadding(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                ),
                sliver: SliverList(
                    delegate: SliverChildBuilderDelegate((c, i) {
                  return _newsWidget(index: i, model: model);
                }, childCount: model.newsList.length)),
              ),
            ],
          );
        });
  }

  Widget _newsWidget({int index, SearchWidgetController model}) {
    var newsData = model.newsList[index];






    var dateTime = DateTime.fromMillisecondsSinceEpoch(newsData.date);
    String date = timeago.format(dateTime);


    return InkWell(
      onTap: (){

        Get.to(NewsDetails(newsModel: newsData,), fullscreenDialog: true, transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.4,
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(newsData.image),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(newsData.topic,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }
}
