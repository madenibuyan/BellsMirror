import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/shared/info_snackbar.dart';
import 'package:bells_mirror/ui/views/dashboard/breaking_news_widget/breaking_widget_controller.dart';
import 'package:bells_mirror/ui/views/dashboard/search_widget/search_widget_controller.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_news_screen.dart';
import 'admin_news_controller.dart';

class AdminNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdminNewsWidgetController>(
        init: AdminNewsWidgetController(),
        builder: (model) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "News Section",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {

                Get.to(AddNewsScreen(), fullscreenDialog: true, transition: Transition.rightToLeft);



              },
            ),
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                // SliverPadding(
                //   padding: EdgeInsets.only(left: 20, right: 20),
                //   sliver: SliverList(
                //       delegate: SliverChildListDelegate([
                //     Text(
                //       "Bookmark",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 27,
                //           fontWeight: FontWeight.bold),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     Text(
                //       "Here are your bookmark news",
                //       style: TextStyle(
                //           color: Colors.grey,
                //           fontSize: 13,
                //           fontWeight: FontWeight.w300),
                //     ),
                //     SizedBox(
                //       height: 10,
                //     ),
                //     TextField(
                //       style: TextStyle(color: Colors.black),
                //       onChanged: model.filterSearch,
                //       decoration: InputDecoration(
                //           fillColor: Color(0xffEFEFEF),
                //           filled: true,
                //           prefixIcon: Icon(
                //             Icons.search,
                //             color: Color(0xff929292),
                //           ),
                //           hintText: "Search",
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide:
                //                   BorderSide(color: Colors.transparent)),
                //           enabledBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide:
                //                   BorderSide(color: Colors.transparent)),
                //           focusedBorder: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(10),
                //               borderSide:
                //                   BorderSide(color: Colors.transparent))),
                //     ),
                //   ])),
                // ),
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
                      )
                    : SliverPadding(
                        padding: EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 20),
                        sliver: SliverList(
                            delegate: SliverChildBuilderDelegate((c, i) {
                          return _newsWidget(index: i, model: model);
                        }, childCount: model.newsList.length)),
                      ),
              ],
            ),
          );
        });
  }

  Widget _newsWidget({int index, AdminNewsWidgetController model}) {
    var newsData = model.newsList[index];



    return InkWell(
      onTap: (){


        Get.to(AddNewsScreen(data: newsData,), fullscreenDialog: true, transition: Transition.rightToLeft);
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
                    image:  NetworkImage(newsData.image),
                  )),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(newsData.topic,
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                      icon: Icon(Icons.delete_outline),
                      onPressed: () {
                        model.deleteNews(index: index);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
