import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _HomePageState();
}

class _HomePageState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/main_image.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/Star.svg",
                      semanticsLabel: 'Dart Logo',
                      height: 15.0,
                      width: 15.0,
                    ),
                    SizedBox(width: 10.0,),
                    Text("60k+",style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0,
                        color: Colors.white),),
                    SizedBox(width: 10.0,),
                    Text("Premium Recipes",style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20.0,
                        color: Colors.white),)
                  ],
                ),
                Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Let's",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 60.0,
                          color: Colors.white),),
                    Text("Cooking",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 60.0,
                          color: Colors.white),),
                    SizedBox(height: 10.0,),
                    Text("Find Best Recipes for Cooking",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize:20.0,
                          color: Colors.white),),
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal:80.0,vertical: 30.0),
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent, // Button background color
                            foregroundColor: Colors.white, // Text color
                            padding: EdgeInsets.all(20.0) , // Padding inside the button
                            textStyle: TextStyle(
                              fontSize: 18, // Font size
                              fontWeight: FontWeight.bold, // Font weight
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners
                            ),
                            elevation: 5, // Shadow elevation
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Start Cooking",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:20.0,
                                    color: Colors.white),),
                              SizedBox(width: 10.0,),
                              SvgPicture.asset(
                                "assets/icons/Arrow-Right.svg",
                                semanticsLabel: 'Dart Logo',
                                height: 25.0,
                                width: 25.0,
                              ),
                            ],
                          )),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),

    );
  }
}
