import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_task_app/app/modules/home/models/fivedaysdata.dart';

import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<HomeController>(
        builder: (controller) {
          debugPrint(
              'controller.currentWeatherData.name = ${controller.currentWeatherData.name}');
          debugPrint('controller.city = ${controller.city}');
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/cloud-in-blue-sky.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        child: AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          // leading: IconButton(
                          //   icon: Icon(
                          //     Icons.menu,
                          //     color: Colors.white,
                          //   ),
                          //   onPressed: () {},
                          // ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 120, left: 20, right: 20),
                        child: TextField(
                          onSubmitted: (value) {
                            setState(() {
                              controller.city = value;
                            });
                          },
                          // onSubmitted: (value) {},
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            suffix: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: 'Search'.toUpperCase(),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(0.0, 1.6),
                        child: SizedBox(
                          height: 10,
                          width: 10,
                          child: OverflowBox(
                            minWidth: 0.0,
                            maxWidth: MediaQuery.of(context).size.width,
                            minHeight: 0.0,
                            maxHeight:
                                MediaQuery.of(context).size.height / 2.85,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  width: double.infinity,
                                  height: double.infinity,
                                  child: Card(
                                    color: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 15, left: 20, right: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Center(
                                                child: Text(
                                                  // ignore: unnecessary_null_comparison
                                                  controller.currentWeatherData !=
                                                          null
                                                      ? '${controller.currentWeatherData.name}'
                                                          .toUpperCase()
                                                      : '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontFamily:
                                                            'flutterfonts',
                                                        fontSize: 28,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                ),
                                              ),
                                              Center(
                                                child: Text(
                                                  DateFormat()
                                                      .add_MMMMEEEEd()
                                                      .format(DateTime.now()),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .caption
                                                      ?.copyWith(
                                                        color: Colors.black45,
                                                        fontFamily:
                                                            'flutterfonts',
                                                        fontSize: 16,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 50),
                                              child: Column(
                                                children: <Widget>[
                                                  Text(
                                                    controller.currentWeatherData
                                                                .weather !=
                                                            null
                                                        ? controller
                                                            .currentWeatherData
                                                            .weather![0]
                                                            .description!
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.copyWith(
                                                          color: Colors.black45,
                                                          fontSize: 22,
                                                          fontFamily:
                                                              'flutterfonts',
                                                        ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Text(
                                                    controller.currentWeatherData
                                                                .main?.temp !=
                                                            null
                                                        ? '${((controller.currentWeatherData.main!.temp)! - 274.15).round().toString()}\u2103'
                                                        : '',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline2
                                                        ?.copyWith(
                                                            color:
                                                                Colors.black45,
                                                            fontFamily:
                                                                'flutterfonts'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 90,
                                                    height: 90,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                          'https://openweathermap.org/img/wn/${controller.currentWeatherData.weather?[0].icon}@2x.png',
                                                        ),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 120),
                Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Container(
                        padding: EdgeInsets.only(top: 120),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'forcast next 5 days'.toUpperCase(),
                                    ),
                                    Icon(
                                      Icons.next_plan_outlined,
                                      color: Colors.black45,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 250,
                                child: ListView.separated(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  separatorBuilder: (context, index) =>
                                      VerticalDivider(
                                    color: Colors.transparent,
                                    width: 5,
                                  ),
                                  itemCount: controller.fiveDaysData.isEmpty
                                      ? 0
                                      : controller.fiveDaysData.length,
                                  itemBuilder: (context, index) {
                                    WeatherData data;
                                    data = controller.fiveDaysData[index];
                                    print(
                                        'data = ${controller.fiveDaysData[index].weather?[0].icon}');
                                    // var datetime = data.dtTxt?.split(' ');
                                    // var date = datetime?[1];
                                    // List<WeatherData> averageTemp = controller.fiveDaysData.map((m) => m.main.temp).reduce((a, b) => a + b) / controller.fiveDaysData.length;
                                    // List time = datetime?[1].;
                                    // print('icon = $icon');
                                    // print('date = $date');
                                    return Container(
                                      width: 140,
                                      height: 150,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                // ignore: unnecessary_null_comparison
                                                (data != null)
                                                    ? '${((data.main!.temp)! - 274.15).round().toString()}\u2103'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                              Text(
                                                // ignore: unnecessary_null_comparison
                                                (data != null)
                                                    ? '${data.dtTxt}'
                                                    : '',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption
                                                    ?.copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts',
                                                    ),
                                              ),
                                              Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'https://openweathermap.org/img/wn/${controller.fiveDaysData[index].weather?[0].icon}@2x.png',
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
