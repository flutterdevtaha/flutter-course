import 'package:contacts_01/car_renting_ui/clippaths/custom_profile_clipath.dart';
import 'package:flutter/material.dart';

class CarProfile extends StatelessWidget {
  const CarProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(70),
                bottomRight: Radius.circular(70),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/waves.png'),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey.shade300,
                                ),
                              ],
                            ),
                            height: 400,
                            width: 350,
                            margin: EdgeInsets.all(15),
                            padding: EdgeInsets.all(50),
                            child: Column(
                              children: [
                                SizedBox(height: 75),
                                Text(
                                  'Blue Kia Cerato',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Text(
                                  '4 doors | Kia Cerato',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      Icon(
                                        Icons.star_border,
                                        color: Colors.amber,
                                      ),
                                      Text(
                                        ' (23.5k)',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 40),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.autorenew,
                                          size: 25,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Automatic',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.ac_unit,
                                          size: 25,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Air Con',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.person,
                                          size: 25,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '5 Seater',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 17,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: -40,
                            left: 40,
                            child: Image.asset(
                              'assets/2.png',
                              height: 200,
                              width: 300,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Trip Dates',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          ClipPath(
                            clipper: CustomProfileClipPath(),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xfff83a86),
                                      ),
                                      child: Icon(
                                        Icons.event_outlined,
                                        color: Colors.white,
                                      )),
                                  Text(
                                    '   03-10-2021 - 05-07-2021',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff2156c0)),
                            child: Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'Pickup & Return',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          ClipPath(
                            clipper: CustomProfileClipPath(),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.75,
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    blurRadius: 8,
                                    spreadRadius: 8,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xfff83a86),
                                    ),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    ' California, 349 CA',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff2156c0)),
                            child: Icon(
                              Icons.double_arrow_rounded,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 1,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '\$399',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 20,
                                      ),
                                    ),
                                    Text(
                                      '/ trip',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w900,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffF13A28)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(20)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    side: BorderSide(color: Colors.red),
                                  ),
                                ),
                              ),
                              child: Text(
                                'Go to Checkout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
