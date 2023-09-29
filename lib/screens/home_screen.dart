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
                    // location
                    Text('📍Dhaka', style: title),
                    SizedBox(height: 10),

                    // greetings
                    Text('Good Morning',
                        style: title.copyWith(
                            fontSize: 25, fontWeight: FontWeight.w600)),

                    // weather image
                    Image.asset('assets/images/1.png'),
                    // temperature
                    Center(
                        child: Text('21°C',
                            style: title.copyWith(
                                fontSize: 55, fontWeight: FontWeight.w600))),
                    // weather condition
                    Center(
                        child: Text('Thunderstorm',
                            style: title.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w600))),
                    SizedBox(height: 5),
                    // date time
                    Center(
                        child: Text('Friday 29 - 12:20 pm',
                            style: title.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300))),
                    SizedBox(height: 30),

                    // ui
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/11.png', scale: 8),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunrise',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('5:34 am',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/12.png', scale: 8),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Sunset',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('5:34 am',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: Colors.grey),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/13.png', scale: 8),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Max',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('12°C',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Image.asset('assets/images/13.png', scale: 8),
                            SizedBox(width: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Temp Min',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300)),
                                Text('8°C',
                                    style: title.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
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
