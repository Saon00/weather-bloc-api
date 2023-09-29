import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/constants/fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        // if your mobile's time bar now showing
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: deepPurpleColor),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: deepPurpleColor),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(color: Colors.deepOrange),
                ),
              ),

              // for making gradient looking
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(color: transparentColor),
                ),
              ),

              //
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('📍Dhaka', style: title),
                    SizedBox(height: 10),
                    Text('Good Morning',
                        style: title.copyWith(
                            fontSize: 25, fontWeight: FontWeight.w600)),
                    Image.asset('assets/images/1.png'),
                    Center(
                        child: Text('21°C',
                            style: title.copyWith(
                                fontSize: 55, fontWeight: FontWeight.w600))),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
