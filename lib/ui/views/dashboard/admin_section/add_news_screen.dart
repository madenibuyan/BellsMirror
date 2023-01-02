import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/theme/theme_light.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'add_news_screen_controller.dart';

class AddNewsScreen extends StatelessWidget {

 NewsModel data;

  AddNewsScreen({this.data});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddNewsScreenController>(

        init: AddNewsScreenController(newsModel: data),
        builder: (model){

      return Scaffold(
        appBar: fullScreenDialogAppBar(title: "Add News"),

        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(

            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: model.imageAvailable()
                            ? Colors.transparent
                            : Theme.of(context).primaryColor.withOpacity(0.25),
                        image: model.imageAvailable()
                            ? DecorationImage(
                          image: NetworkImage(model.newsModel.image),
                          fit: BoxFit.cover,
                        )
                            : null),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: TextButton(
                      onPressed: model.changeImage,
                      child: Text(
                        "Change Image",
                        style: TextStyle(color: DeggiaLightTheme.Blue),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(),
                SizedBox(
                  height: 30,
                ),


                Text("News Topic :", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),


                SizedBox(height: 10),



                TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                 controller: model.topicController,
                  maxLines: 2,
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFEFEF),
                      filled: true,
                      // prefixIcon: Icon(Icons.search, color: Color(0xff929292),),
                      // hintText: "Search",
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



                SizedBox(
                  height: 30,
                ),

                Text("Description : ", style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),),

                SizedBox(height: 10),

                TextField(
                  style: TextStyle(
                      color: Colors.black
                  ),
                 controller: model.bodyController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      fillColor: Color(0xffEFEFEF),
                      filled: true,
                      // prefixIcon: Icon(Icons.search, color: Color(0xff929292),),
                      // hintText: "Search",
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



                SizedBox(
                  height: 30,
                ),


                InkWell(
                  onTap: model.addNewsClicked,
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(30),
                        color: Color(0xff5584DF)),
                    child: Center(
                      child: Text(
                        "Save Changes".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

              ],
            ),
          ),
        ),

      );
    });
  }
}
