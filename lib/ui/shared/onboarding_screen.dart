import 'package:bells_mirror/ui/views/authentication/register/register_screen.dart';
import 'package:bells_mirror/utils/constant_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff4E9AF1), Color(0xffBC7F2E)]),
              ),

              child: Center(
                child:   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(Constant.logoImage),
                              fit: BoxFit.contain
                          )
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text("bells mirror".toUpperCase(), style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 40,
            ),

            Center(

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(Constant.newsIcon),
                              fit: BoxFit.contain
                          )
                      ),
                    ),




                    Text("Your number 1 app to get bells news at your fingertips",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff4E9AF1),
                      ), ),




                    SizedBox(
                      height: 60,
                    ),

                    InkWell(
                      onTap: (){

                        Get.to(RegisterScreen());

                      },
                      child: Container(
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xff5584DF)),
                        child: Center(
                          child: Text(
                            "Get started".toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15),
                          ),
                        ),
                      ),
                    ),

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
