import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/views/dashboard/breaking_news_widget/breaking_news_widget.dart';
import 'package:bells_mirror/ui/views/dashboard/home_widget/home_widget_controller.dart';
import 'package:bells_mirror/ui/views/dashboard/news_details_widget/news_details.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:get/get.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeWidgetController>(
        init: HomeWidgetController(),
        builder: (model) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "HOME(Trending)",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                   model.newsList.isEmpty ? Container(
                     height: Get.height * 0.3,
                     child: Center(
                       child: Text("Fetching news..", style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.bold
                       ),),
                     ),
                   ) :   Container(
                        height: Get.height * 0.3,
                        child: InkWell(
                          onTap: (){
                            Get.to(NewsDetails(newsModel: model.newsList[0],), fullscreenDialog: true, transition: Transition.rightToLeft);
                          },
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(model.newsList[0].image)),
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              Opacity(
                                opacity: 0.6,
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black
                                          ])),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: Text(
                                    model.newsList[0].topic,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Breaking news".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          ActionChip(
                              label: Text(
                                "MORE",
                                style: TextStyle(),
                              ),
                              onPressed: () {

                                Get.to(BreakingNewsWidget(), fullscreenDialog: true, transition: Transition.rightToLeft);

                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ])),
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
                  : SliverToBoxAdapter(
                child: Container(
                  height: Get.height * 0.35,
                  width: Get.width * 0.55,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (c, index) {
                      return Container(
                          width: Get.width * 0.65,

                          child: _breakingNewsWidget(model : model, index : index));
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: model.newsList.length,
                  ),
                ),
              )
            ],
          );
        });
  }

  Widget _breakingNewsWidget({HomeWidgetController model, int index}) {
    var data = model.newsList[index];
    var dateTime = DateTime.fromMillisecondsSinceEpoch(data.date);
    String date = timeago.format(dateTime);

    return InkWell(
      onTap: (){
        Get.to(NewsDetails(newsModel: data,), fullscreenDialog: true, transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20, bottom: 20, top: 15, left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                width: Get.width * 0.65,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(data.image),)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              data.topic,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: TextStyle(
                  fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "By ${data.author}",
              style: TextStyle(
                  fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
