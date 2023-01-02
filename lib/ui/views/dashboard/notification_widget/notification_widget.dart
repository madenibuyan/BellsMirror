import 'package:bells_mirror/ui/shared/full_screen_dialog_appbar.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fullScreenDialogAppBar(
        title: ""
      ),

      body: Padding(
        padding: const EdgeInsets.only(
          left: 20, right: 20
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Notifications".toUpperCase(), style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),

                Switch(value: value, onChanged: (v){
                  setState(() {

                    value = v;
                  });
                })
              ],
            ),

            Flexible(

              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(Constant.notifIcon),
                        )
                      ),
                    ),


                    SizedBox(
                      height: 20,
                    ),

                    Text("Turn on to get notifications", style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w800
                    ),),

                  ],
                ),
              ),
            ),




          ],

        ),
      ),
    );
  }
}
