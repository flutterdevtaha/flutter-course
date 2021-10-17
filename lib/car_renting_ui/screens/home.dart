import 'package:contacts_01/car_renting_ui/clippaths/custome_home_clippath.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:outline_material_icons/outline_material_icons.dart';

import 'car_profile.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: 250,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/waves.png'),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(
                        Boxicons.bx_menu_alt_left,
                        color: Colors.white,
                        size: 30,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/1.png'),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    'Choose a Car',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 63,
                        width: MediaQuery.of(context).size.width - 105,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Icon(
                                OMIcons.locationOn,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(width: 15),
                              Text(
                                'Florida, USA',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 65),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF36CAB),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(
                                  MdiIcons.calendarRange,
                                  size: 25,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.tune,
                        color: Colors.white,
                        size: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 270),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      '23 Results',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Lato',
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      color: Colors.black,
                      size: 40,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 496,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        ClipPath(
                          clipper: CustomClipPath(),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  spreadRadius: 5,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                            height: 300,
                            width: 350,
                            margin: EdgeInsets.only(
                              right: 30,
                              left: 30,
                              top: 20,
                              bottom: 20,
                            ),
                            padding: EdgeInsets.all(30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 30,
                                          width: 65,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFDC162),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        Row(
                                          children: const [
                                            Icon(
                                              Icons.star,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                            Text(
                                              '4.5',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '10 deals',
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  'assets/2.png',
                                  height: 150,
                                  width: 300,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Blue Kia Cerato',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  'FROM 199\$ / DAY',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 290,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarProfile()),
                              );
                            },
                            child: Container(
                              width: 90,
                              height: 90,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  topLeft: Radius.circular(30),
                                ),
                                color: Color(0xff2156c0),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.double_arrow_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
