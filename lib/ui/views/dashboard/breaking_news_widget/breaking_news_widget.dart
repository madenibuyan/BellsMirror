import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/views/dashboard/breaking_news_widget/breaking_widget_controller.dart';
import 'package:bells_mirror/ui/views/dashboard/news_details_widget/news_details.dart';
import 'package:bells_mirror/ui/views/dashboard/search_widget/search_widget_controller.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreakingNewsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BreakingNewsWidgetController>(
        init: BreakingNewsWidgetController(),
        builder: (model) {
          return Scaffold(
            appBar: fullScreenDialogAppBar(title: ""),
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  sliver: SliverList(
                      delegate: SliverChildListDelegate([
                    Text(
                      "Breaking news".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),

                        SizedBox(
                          height: 10,
                        ),


                        Text(
                      "More breaking news for you",
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                    ),


                        SizedBox(
                          height: 10,
                        ),


                        TextField(
                          style: TextStyle(
                            color: Colors.black
                          ),
                          onChanged: model.filterSearch,
                          decoration: InputDecoration(
                            fillColor: Color(0xffEFEFEF),
                            filled: true,
                            prefixIcon: Icon(Icons.search, color: Color(0xff929292),),
                            hintText: "Search",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)
                            ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent)
                              ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.transparent)
                            )
                          ),
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
                ) :    SliverPadding(
                  padding: EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),

                  sliver: SliverList(delegate: SliverChildBuilderDelegate((c, i){

                    return _newsWidget(
                      index: i,
                      model: model
                    );
                  },
                      childCount: model.newsList.length

                  )),
                ),

              ],
            ),
          );
        });
  }

  Widget _newsWidget({int index, BreakingNewsWidgetController model}) {


    var newsData = model.newsList[index];

    return InkWell(
      onTap: (){
        Get.to(NewsDetails(newsModel: newsData,), fullscreenDialog: true, transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 15,
          bottom: 15
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width*0.4,
              height: Get.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(newsData.image),
                )
              ),
            ),

            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text( newsData.topic, style : TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              )),
            )


          ],
        ),
      ),
    );

  }
}
