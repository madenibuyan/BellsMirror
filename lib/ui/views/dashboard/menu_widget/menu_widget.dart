import 'package:bells_mirror/datamodel/news_model.dart';
import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/ui/views/dashboard/breaking_news_widget/breaking_widget_controller.dart';
import 'package:bells_mirror/ui/views/dashboard/search_widget/search_widget_controller.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';

import 'menu_widget_controller.dart';


class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuWidgetController>(
        init: MenuWidgetController(),
        builder: (model) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.only(left: 20, right: 20),
                sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Text(
                        "Menu",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),

                      SizedBox(
                        height: 10,
                      ),


                      Text(
                        "Interact with the app",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.w300),
                      ),


                      SizedBox(
                        height: 45,
                      ),


                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color:      Color(0xff4E9AF1),
                          )
                        ),
                        child: Container(
                          height: 70,
                          child: InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Icon(FontAwesome.asterisk, size: 20,),

                                  SizedBox(width: 15,),

                                  Text("Change Password", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),

                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color:      Color(0xff4E9AF1),
                          )
                        ),
                        child: Container(
                          height: 70,
                          child: InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Icon(FontAwesome.flash, size: 20,),

                                  SizedBox(width: 15,),

                                  Text("Change appearance", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                      SizedBox(
                        height: 25,
                      ),


                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color:      Color(0xff4E9AF1),
                            )
                        ),
                        child: Container(
                          height: 70,
                          child: InkWell(
                            onTap: (){

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Icon(FontAwesome.newspaper_o, size: 20,),

                                  SizedBox(width: 15,),

                                  Text("Attendance", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 25,
                      ),


                      Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            side: BorderSide(
                              color:      Color(0xff4E9AF1),
                            )
                        ),
                        child: Container(
                          height: 70,
                          child: InkWell(
                            onTap: (){
                              model.logoutClicked();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [


                                  Icon(FontAwesome.sign_out, size: 20,),

                                  SizedBox(width: 15,),

                                  Text("Log-out", style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),


                    ])),
              ),



            ],
          );
        });
  }

}
