import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weatherapp/blocs/weather_bloc.dart';
import 'package:weatherapp/constants/colors.dart';
import 'package:weatherapp/constants/fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


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
              BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
                if (state is WeatherSuccess) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // location
                        Text('📍${state.weather.areaName}', style: title),
                        SizedBox(height: 10),

                        // greetings
                        Text('Good Morning',
                            style: title.copyWith(
                                fontSize: 25, fontWeight: FontWeight.w600)),

                        // weather image
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        // Image.asset('assets/images/1.png'),
                        // temperature
                        Center(
                            child: Text(
                                '${state.weather.temperature!.celsius!.round()}°C',
                                style: title.copyWith(
                                    fontSize: 55,
                                    fontWeight: FontWeight.w600))),
                        // weather condition
                        Center(
                            child: Text(
                                '${state.weather.weatherMain!.toUpperCase()}',
                                style: title.copyWith(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600))),
                        SizedBox(height: 5),
                        // date time
                        Center(
                            child: Text(
                                DateFormat('EEEE dd -')
                                    .add_jm()
                                    .format(state.weather.date!),
                                // 'Friday 29 - 12:20 pm',
                                style: title.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300))),
                        SizedBox(height: 50),

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
                                    Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunrise!),
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
                                    Text(
                                        DateFormat()
                                            .add_jm()
                                            .format(state.weather.sunset!),
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
                                    Text(
                                        '${state.weather.tempMax!.celsius!.round().toString()}°C',
                                        style: title.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset('assets/images/14.png', scale: 8),
                                SizedBox(width: 5),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Temp Min',
                                        style: title.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w300)),
                                    Text(
                                        '${state.weather.tempMin!.celsius!.round().toString()}°C',
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
                  );
                } else {
                  return Container();
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  Widget getWeatherIcon(int code) {
    switch (code) {
      case >= 200 && <= 232:
        return Image.asset('assets/images/1.png');
        break;
      case >= 300 && <= 321:
        return Image.asset('assets/images/2.png');
        break;
      case >= 500 && <= 531:
        return Image.asset('assets/images/3.png');
        break;
      case >= 600 && <= 622:
        return Image.asset('assets/images/4.png');
        break;
      case >= 701 && <= 781:
        return Image.asset('assets/images/5.png');
        break;
      case 800:
        return Image.asset('assets/images/6.png');
        break;
      case >= 801 && <= 804:
        return Image.asset('assets/images/7.png');
        break;

      default:
        return Image.asset('assets/images/1.png');
        break;
    }
  }

  // want to implement that this will show good morning/night according to time
  Widget getGrettings(int time) {
    switch (time) {
      case >= 200 && <= 232:
        return Image.asset('assets/images/1.png');
        break;
      case >= 300 && <= 321:
        return Image.asset('assets/images/2.png');
        break;
      case >= 500 && <= 531:
        return Image.asset('assets/images/3.png');
        break;
      case >= 600 && <= 622:
        return Image.asset('assets/images/4.png');
        break;
      case >= 701 && <= 781:
        return Image.asset('assets/images/5.png');
        break;
      case 800:
        return Image.asset('assets/images/6.png');
        break;
      case >= 801 && <= 804:
        return Image.asset('assets/images/7.png');
        break;

      default:
        return Image.asset('assets/images/1.png');
        break;
    }
  }
}
