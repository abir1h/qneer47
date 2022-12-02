import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyo/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var name;
  get() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('name');
    setState(() {
      name = token;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          color: AppColors.bg2,
          child: Column(
            children: [
              Container(
                height: height / 3,
                width: width,
                decoration: BoxDecoration(color: Colors.pinkAccent),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dashboard',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                              Text(
                                'Good Afternoon',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.white,
                            child: Center(
                                child: Text(
                              name[0],
                              style: TextStyle(
                                  color: Colors.pinkAccent, fontSize: 20),
                            )),
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Wallet Ballance',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              Text(
                                '9,34343',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Card Active',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 12),
                              ),
                              Text(
                                '3',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 5, right: 5, top: 2, bottom: 2),
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height/10,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          scrollPhysics: AlwaysScrollableScrollPhysics(),
                          height: 200,
                          autoPlay: true,
                          reverse: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.6,
                        ),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: width / 1.5,
                                height: height / 10,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Expanded (
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    'Card Balance',
                                                    style: TextStyle(
                                                        color: Colors.pinkAccent,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 12),
                                                  ),
                                                  Text(
                                                    '9,4545545',
                                                    style: TextStyle(
                                                        color: Colors.pinkAccent,
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: height / 10,
                  width: width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),

                          spreadRadius: 5,

                          blurRadius: 7,

                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Add your properties",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "This will take few steps",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: height / 8,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "1",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            Text(
                              "Lorem",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    Container(
                      height: height / 8,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            Text(
                              "Lorem",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    Container(
                      height: height / 8,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            Text(
                              "Lorem",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      height: height / 8,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "4",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            Text(
                              "Lorem",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width / 10,
                    ),
                    Container(
                      height: height / 8,
                      width: width / 4.5,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "5",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 20,
                            ),
                            Text(
                              "Lorem",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
