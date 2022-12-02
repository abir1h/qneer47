import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oyo/utils/colors.dart';

class details extends StatefulWidget {
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> with SingleTickerProviderStateMixin {
  List images = [
    'assets/images/r1.jpg',
    'assets/images/r2.jpg',
    'assets/images/r3.jpg',
  ];
  TabController? _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      scrollDirection: Axis.horizontal,
                      scrollPhysics: AlwaysScrollableScrollPhysics(),
                      height: height / 2,
                      autoPlay: true,
                      reverse: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1,
                    ),
                    itemCount: images.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                            height: height / 2,
                            width: width / 1,
                            child: InkWell(
                                onTap: () async {
                                  // var url=snapshot.data[itemIndex]['links'];
                                  // if (await canLaunch(url))
                                  //   await launch(url);
                                  // else
                                  //   // can't launch url, there is some error
                                  //   throw "Could not launch $url";
                                },
                                child: Image.asset(
                                  'assets/images/r1.jpg',
                                  fit: BoxFit.cover,
                                ))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.bookmark,
                        color: AppColors.star_orange,
                        size: 30,
                      ),
                      Expanded(
                        child: Text(
                          'Couple Friendly | Compelementary Breakfast | In_ House Resturent',
                          style: TextStyle(
                              color: AppColors.star_orange,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Town House OAK Vila',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Taj Nagori - Faridabad , Agra ',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.location_pin,
                                  color: Colors.grey,
                                ),
                                Text(
                                  'Map ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(2),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.rating,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    " 4.5",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                                Text(
                                  " | 160  ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          " Sanitised before your eyes ",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.light_grey,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " All stuffs vaccinated with first dose ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 8,
                        color: AppColors.divider,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 18),
                        ),
                      ),
                      Divider(color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Town Hous OAK Vila is a premium hotel located in the heart of Agra. This hotel offers easy access to the Taj Mahal ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Expanded(
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                      color: AppColors.reed_more,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Best Offers for you',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              'All offers( 8 )',
                              style: TextStyle(
                                  color: AppColors.reed_more,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        height: height / 8,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    width: width / 1.5,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey)),
                                    child: Column(children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                'Flat 25 % off ',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            Icon(
                                              Icons.verified,
                                              color: Colors.greenAccent,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                'Get 25 % off on your bookings using this ',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 8.0),
                                              child: Text(
                                                'FRANCSOS',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ])),
                              );
                            }),
                      ),
                      const Divider(
                        thickness: 8,
                        color: AppColors.divider,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date Of travel & guests',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.edit_road_sharp,
                                  color: AppColors.reed_more,
                                ),
                                Text(
                                  'Edit',
                                  style: TextStyle(
                                      color: AppColors.reed_more,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: width,
                        decoration: BoxDecoration(
                            color: AppColors.grey_conttinre,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Todaay - Tommorrow',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '12 Am - 12 Pm',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: VerticalDivider(
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text(
                                        '1 Room',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        '1 Guest',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Divider(
                          thickness: 8,
                          color: AppColors.divider,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.wifi,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Free Wifi',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.ac_unit_outlined,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'AC',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.tv,
                                            color: Colors.grey,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'TV',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: const [
                                      Icon(
                                        Icons.park,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          'Parking',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'View all amanities',
                          style: TextStyle(
                              color: AppColors.reed_more,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Divider(
                        thickness: 8,
                        color: AppColors.divider,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Whats nearby',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TabBar(
                          controller: _controller,
                          isScrollable: true,
                          indicatorColor: AppColors.reed_more,
                          tabs: const [
                            // Tab(icon: Icon(Icons.flight,color: Colors.white,)),
                            Tab(
                                child: Text("Restaurant",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600))),
                            Tab(
                                child: Text("Shopping Mall",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600))),
                            Tab(
                                child: Text("Transports",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600))),
                          ],
                        ),
                      ),
                      Container(
                        height: height / 5,
                        child: TabBarView(
                          controller: _controller,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Prince Inn Hotel',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Palace Hotel',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        'Hotel Sea Palace',
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        'View On Map',
                                        style: TextStyle(
                                            color: AppColors.star_orange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: Text("Shopping Mall"),
                            ),
                            Center(
                              child: Text("Transport"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(
                          thickness: 8,
                          color: AppColors.divider,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Choose Your Sanitised Room',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white),
                        child: Row(
                          children: [
Stack(
  clipBehavior: Clip.none,
  children: [

    Container(
      height: height / 4.8,
      width: width / 2.5,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          image: DecorationImage(
              image: AssetImage(
                'assets/images/r1.jpg',
              ),
              fit: BoxFit.cover)),
    ),
    Align(
      alignment:Alignment.topLeft,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),)
      ),

        child: Padding(
          padding: const EdgeInsets.only(left:8.0,right:2),
          child: Center(
            child: Text("Clasic ( 2x )",style: TextStyle(
                color: Colors.white
            ),),
          ),
        ),
      ),

    ),


  ],
)           ,
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(
                                        'Classic ( 2X ) : 120 sqft',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: const [
                                        Icon(
                                          Icons.tv,color:Colors.grey
                                        ),Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Icon(
                                            Icons.wifi,color:Colors.grey
                                          ),
                                        ), Text(
                                          '+ 8',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              '1044 ',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ), Text(
                                              'BDT 1044 ',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                decoration: TextDecoration.lineThrough,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(color: Colors.grey)
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Row(
                                              children: [
                                                Text("Selected "),
                                                Icon(Icons.verified,color: Colors.greenAccent,)
                                              ],
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 8,
                    color: AppColors.divider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(
                        'Ratings & Reviews',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Container(
                        width: width/3,
                        height: height/8,
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                color: Colors.white,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [  Text('3.7',style:  TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),),
                                    Column(
                                      children: [
                                        Text('591',style:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),),  Text('Ratings',style:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),),

                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ) , Expanded(
                              child: Container(
                                width: width,
                                color: AppColors.greenligght,
                                child:   Center(
                                  child: Text('GOOD',style:  TextStyle(
                                      color: AppColors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),),
                                ),
                              ),
                            )
                          ],
                        ),


                      )


                    ],
                  ),
                ),
                SizedBox(height:10),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Text(
                                            "Hotel Stuff",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: AppColors.rating_bg,

                                valueColor:  new AlwaysStoppedAnimation<Color>(AppColors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: AppColors.rating_bg,

                                valueColor:  new AlwaysStoppedAnimation<Color>(AppColors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Text(
                                            "Sanitisation",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: AppColors.rating_bg,

                                valueColor:  new AlwaysStoppedAnimation<Color>(AppColors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Breakfast",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: AppColors.rating_bg,

                                valueColor:  new AlwaysStoppedAnimation<Color>(AppColors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Text(
                                            "Facilities",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight:
                                              FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: AppColors.rating_bg,

                                valueColor:  new AlwaysStoppedAnimation<Color>(AppColors.green),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                     Container(
                                      child: Column(
                                        children: [

                                          Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Location",
                                                style: TextStyle(
                                                  color: Colors.transparent,
                                                  fontWeight:
                                                  FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: .8,
                                backgroundColor: Colors.transparent,

                                valueColor:  new AlwaysStoppedAnimation<Color>(Colors.transparent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ramaya Mogabira',style:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),  Row(
                              children: [
                                Icon(Icons.star,color: AppColors.reed_more,size: 20,),
                                Icon(Icons.star,color: AppColors.reed_more,size: 20,),
                                Icon(Icons.star,color: AppColors.reed_more,size: 20,),
                                Icon(Icons.star,color: AppColors.reed_more,size: 20,),
                                SizedBox(width: 5,),
                                Text('27 dec 2022',style:  TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),),
                              ],
                            ),
                        Row(
                          children: [
                            Flexible(
                              child: Text('This is a nice hotel and the stuffs are so much helpfull. Great Facilities here.',style:  TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border:Border.all(color:Colors.blue)
                            ),
                            child:  Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text("See all review",style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Divider(
                    thickness: 8,
                    color: AppColors.divider,
                  ),
                ),                      Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Enjoy meals during your day ',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width,
                    height: height/2.9,
                    child: ListView.builder(

                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){return                 Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width/3,
                            height: height/3,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                            color: Colors.white,
                                            child: Image.asset('assets/images/r1.jpg',height:200,width:200)
                                        ),
                                        Text('Breakfast',style:  TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),), Text('Continental ',style:  TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 12),),
                                        Text('BDT 100',style:  TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),),
                                      ],
                                    ),
                                  ),
                                ) , Container(
                                  width: width,
                                  color: AppColors.green_s,
                                  child:   Center(
                                    child: Text('ADD',style:  TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),),
                                  ),
                                )
                              ],
                            ),


                          ),
                        );
                        }),
                  ),
                ),
                SizedBox(height:10),
                Divider(
                  thickness: 8,
                  color: AppColors.divider,
                ),

                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Guest Details',style:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),),
                        Row(
                          children: [
                            Flexible(
                              child: Text('We will use this information to share your booking details.',style:  TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14),),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "First Name"
                          ),
                        ),  TextFormField(
                          decoration: InputDecoration(
                            hintText: "Email"
                          ),
                        ),TextFormField(
                          decoration: InputDecoration(
                            hintText: "Mobile Number"
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Have account with us?',style:  TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),),Text('Login',style:  TextStyle(
                                  color: AppColors.reed_more,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),  Divider(
                  thickness: 8,
                  color: AppColors.divider,
                ),
                SizedBox(height:10),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Pricing Details',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  child: Column(

                    children: [
                      ListTile(
                        leading:Icon(Icons.account_balance,color: Colors.orange,)
                            ,
                        // subtitle: Container(
                        //   decoration:BoxDecoration(
                        //     border:Border.all(color: AppColors.green_s),
                        //
                        //   ),child:Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: Center(
                        //       child: Text('More offers',style:  TextStyle(
                        //         color: AppColors.green_s,
                        //         fontWeight: FontWeight.normal,
                        //         fontSize: 16),),
                        //     ),
                        //   ),
                        // ),
                        title : Text('OMOIN coupon applied',style:  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),),
                        trailing:Text('1334 BDT',style:  TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 18),),
        ),

                    ],
                  ),
                ),
                SizedBox(height:10),
                Container(

                  decoration: BoxDecoration(
                      color: AppColors.light_grey,
                      borderRadius: BorderRadius.circular(5)),
                  child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " Additional savings  ",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),Text(
                          " BDT 255",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height:10),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        " Price to Pay",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),Text(
                        " BDT 255",
                        style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height:10),  Divider(
                  thickness: 8,
                  color: AppColors.divider,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Similar OYO's nearby",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),

                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width,
                    height: height/4,
                    child: ListView.builder(

                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_,index){return                 Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width/3,
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          color: Colors.white,
                                          child: Image.asset(                'assets/images/r1.jpg',
                                             )
                                      ),
                                      Text('Hotel Lubna',style:  TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),), Text('Near Dhaka ',style:  TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 12),),
                                      Text('BDT 100',style:  TextStyle(
                                          color: Colors.orange,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),),
                                    ],
                                  ),
                                )
                              ],
                            ),


                          ),
                        );
                        }),
                  ),
                ),
                SizedBox(height:10),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
