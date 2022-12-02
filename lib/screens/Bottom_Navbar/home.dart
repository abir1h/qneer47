import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/screens/auctions/ongoing.dart';
import 'package:oyo/screens/auctions/upcoming.dart';
import 'package:oyo/screens/broker/host_registration.dart';
import 'package:oyo/screens/builkder/host_registration.dart';
import 'package:oyo/screens/details.dart';
import 'package:oyo/screens/host/host_registration.dart';
import 'package:oyo/utils/colors.dart';
import 'package:http/http.dart'as http;
import 'package:oyo/utils/package_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  Future? slide;
  Future emergency() async {


    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
    };

    var response =
    await http.get(Uri.parse(AppUrl.show_package), headers: requestHeaders);
    if (response.statusCode == 200) {
      print('Get post collected' + response.body);
      var userData1 = jsonDecode(response.body)['data'];
      print(userData1);
      return userData1;
    } else {
      var userData1 = jsonDecode(response.body)['data'];
      print(userData1);
      return userData1;    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    slide = emergency();

  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              elevation: 1,
              // ...
              backgroundColor: Colors.white,
              leadingWidth: 100,
              leading: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Q",
                    style: TextStyle(
                        color: Colors.pinkAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 28),
                  ),
                  Text(
                    "neer",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                ],
              ),
              // title: Row(
              //   children: [
              //     Text("Q",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),),
              //     Text("neer",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              //   ],
              // ),

              // flexibleSpace: Stack(
              //   clipBehavior: Clip.none,
              //   children: [
              //     (Container
              //       height: height/6,
              //       width: width,
              //       decoration: BoxDecoration(
              //           image:DecorationImage(
              //               image: AssetImage(
              //                 "assets/images/na.jpg",
              //               ),fit: BoxFit.cover
              //           )
              //       ),
              //     ),
              //     Positioned(
              //         top: height/15,
              //         child:                       Padding(
              //           padding: const EdgeInsets.only(left:20.0),
              //           child: Container(
              //
              //             width: MediaQuery.of(context).size.width/1.1,
              //             decoration: BoxDecoration(
              //                 color: Colors.grey[300],
              //                 borderRadius: BorderRadius.circular(15)
              //             ),
              //             child: Padding(
              //               padding: const EdgeInsets.all(8.0),
              //               child: TextFormField(
              //
              //                 decoration: InputDecoration(
              //                     suffixIcon: Icon(Icons.search),
              //                     border: InputBorder.none,
              //                     hintText: "Search for a locality,area or city "
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ),
              //     ),
              //     // Positioned(
              //     //     top: height/8.5,
              //     //     child: Padding(
              //     //       padding: const EdgeInsets.only(right:18.0,),
              //     //       child: Container(
              //     //         width: width,
              //     //         child: Row(
              //     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //           children: [
              //     //             Padding(
              //     //               padding: const EdgeInsets.only(left: 8.0),
              //     //               child: Container(
              //     //                 height: height/12,
              //     //                 width: width/4.5,
              //     //                 decoration: BoxDecoration(
              //     //
              //     //                     image: DecorationImage(
              //     //                         image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2_BQyyqZZBlFC9vEZSRqf-bYuW8Jk6WvaGQ&usqp=CAU'),
              //     //                         fit: BoxFit.cover
              //     //                     ),
              //     //                     color: Colors.white,borderRadius: BorderRadius.circular(10)
              //     //                 ),            ),
              //     //             ),
              //     //             Container(
              //     //               height: height/12,
              //     //               width: width/4.5,
              //     //               decoration: BoxDecoration(
              //     //                   image: DecorationImage(
              //     //                       image: NetworkImage('https://assets.volvo.com/is/image/VolvoInformationTechnologyAB/1860x1050-9700-teaser-2018?qlt=82&wid=1440&ts=1629860473425&fit=constrain'),
              //     //                       fit: BoxFit.cover
              //     //                   ),
              //     //                   color: Colors.white,borderRadius: BorderRadius.circular(10)
              //     //               ),            ),
              //     //             Padding(
              //     //               padding: const EdgeInsets.only(right: 8.0),
              //     //               child: Container(
              //     //                 height: height/12,
              //     //                 width: width/4.5,
              //     //                 decoration: BoxDecoration(  image: DecorationImage(
              //     //                     image: NetworkImage('https://www.ihgplc.com/-/media/ihg/images/brands/regent/regent_carousel_1.jpg'),
              //     //                     fit: BoxFit.cover
              //     //                 ),
              //     //                     color: Colors.white,borderRadius: BorderRadius.circular(10)
              //     //                 ),            ),
              //     //             ),
              //     //           ],
              //     //         ),
              //     //       ),
              //     //     ))
              //   ],
              // ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 7,
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          scrollDirection: Axis.horizontal,
                          scrollPhysics: AlwaysScrollableScrollPhysics(),
                          height: 200,
                          autoPlay: true,
                          reverse: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                        ),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: height / 5,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage('assets/images/r2.jpg'),
                                    fit: BoxFit.cover)),
                            // child: InkWell(
                            //
                            //     onTap: ()async{
                            //       // var url=snapshot.data[itemIndex]['links'];
                            //       // if (await canLaunch(url))
                            //       //   await launch(url);
                            //       // else
                            //       //   // can't launch url, there is some error
                            //       //   throw "Could not launch $url";
                            //     },
                            //     child:Image.asset('assets/images/ban.jpg',width: width,))
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Packages",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),            Container(
                        constraints: BoxConstraints(),
                        child: FutureBuilder(
                            future: slide,
                            builder: (_, AsyncSnapshot snapshot) {
                              print(snapshot.data);
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height / 5,
                                    child: SpinKitThreeInOut(
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    Text('Error: ${snapshot.error}');
                                  } else {
                                    return snapshot.hasData
                                        ?                        Container(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            clipBehavior: Clip.none,
                                            height: height / 4.9,
                                            width: width,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: snapshot.data.length,
                                                shrinkWrap: true,
                                                itemBuilder: (_, index) {
                                                  return Padding(
                                                    padding: const EdgeInsets.only(
                                                        left: 8.0, top: 16),
                                                    child: Container(

                                                      child: Stack(
                                                        clipBehavior: Clip.none,
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Container(
                                                              width: width / 1.3,

                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(10),
                                                                  // image: DecorationImage(
                                                                  //     image: AssetImage('assets/images/r2.jpg'),
                                                                  //     fit: BoxFit.cover
                                                                  // )

                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      color: Colors.grey
                                                                          .withOpacity(0.2),
                                                                      spreadRadius: 2,
                                                                      blurRadius: 5,
                                                                      offset: Offset(0,
                                                                          3), // changes position of shadow
                                                                    ),
                                                                  ],
                                                                  color: Colors.white54),
                                                              child: Padding(
                                                                padding:
                                                                const EdgeInsets.all(8.0),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      snapshot.data[index]['name'],
                                                                      style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontWeight:
                                                                          FontWeight.w800,
                                                                          fontSize: 20),
                                                                    ),
                                                                    // Text(
                                                                    //   snapshot.data[index]['details'],
                                                                    //   maxLines: 3,
                                                                    //   overflow: TextOverflow.ellipsis,
                                                                    //   style: TextStyle(
                                                                    //       color: Colors.black,
                                                                    //
                                                                    //       fontWeight:
                                                                    //       FontWeight.w600,
                                                                    //       fontSize: 16),
                                                                    // ),

                                                                    Html(data:  snapshot.data[index]['details'],shrinkWrap: true,

                                                                      style: {
                                                                        "body": Style(
                                                                          maxLines: 2,

                                                                          textOverflow: TextOverflow.ellipsis,
                                                                          fontSize: FontSize.small
                                                                        ),
                                                                      },
                                                                    ),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                          child: InkWell(
                                                                            onTap: (){
                                                                              showDialog(
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return package_alert(price: snapshot.data[index]['price'].toString(),title:  snapshot.data[index]['name'],des: snapshot.data[index]['details'],iamge: AppUrl.pic_url1+snapshot.data[index]['image'],);
                                                                                  });
                                                                            },
                                                                            child: Container(
                                                                              height: height / 25,
                                                                              width: width / 4,
                                                                              decoration:
                                                                              BoxDecoration(
                                                                                color:
                                                                                Colors.pinkAccent,
                                                                                borderRadius:
                                                                                BorderRadius
                                                                                    .circular(8),
                                                                              ),
                                                                              child: Center(
                                                                                  child: Text(
                                                                                    'See more',
                                                                                    style: TextStyle(
                                                                                        color:
                                                                                        Colors.white,
                                                                                        fontWeight:
                                                                                        FontWeight
                                                                                            .bold),
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                          const EdgeInsets.all(
                                                                              4.0),
                                                                          child: Text(snapshot.data[index]['price'].toString()+ " BDT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),)
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              // child: InkWell(
                                                              //
                                                              //     onTap: ()async{
                                                              //       // var url=snapshot.data[itemIndex]['links'];
                                                              //       // if (await canLaunch(url))
                                                              //       //   await launch(url);
                                                              //       // else
                                                              //       //   // can't launch url, there is some error
                                                              //       //   throw "Could not launch $url";
                                                              //     },
                                                              //     child:Image.asset('assets/images/ban.jpg',width: width,))
                                                            ),
                                                          ),
                                                          Positioned(
                                                              left: width * .55,
                                                              top: -18,
                                                              child: CircleAvatar(
                                                                radius: 30,
                                                                backgroundColor:
                                                                Colors.pinkAccent,
                                                                backgroundImage: NetworkImage(
                                                                    AppUrl.pic_url1+snapshot.data[index]['image']),
                                                              ))
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          )
                                          // Padding(
                                          //
                                          //   padding: const EdgeInsets.all(8.0),
                                          //
                                          //   child:   Text("Hot Deals",style: TextStyle(
                                          //
                                          //
                                          //
                                          //     color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold
                                          //
                                          //
                                          //
                                          //   ),),
                                          //
                                          // ),
                                          //
                                          // SizedBox(height: 20,),
                                          //
                                          //        Container(
                                          //
                                          //          height: height/8,
                                          //
                                          //          width: width,
                                          //
                                          //          child:ListView.builder(
                                          //
                                          //
                                          //
                                          //              shrinkWrap: true,
                                          //
                                          //              itemCount: 5,
                                          //
                                          //              scrollDirection: Axis.horizontal,
                                          //
                                          //              itemBuilder: (_,index){
                                          //
                                          //                return  Padding(
                                          //
                                          //                  padding: const EdgeInsets.all(8.0),
                                          //
                                          //                  child: InkWell(
                                          //
                                          //                    onTap: (){
                                          //
                                          //
                                          //
                                          //                      Navigator.push(context, MaterialPageRoute(builder: (_)=>details()));
                                          //
                                          //                    },
                                          //
                                          //                    child: Container(
                                          //
                                          //                      child: Stack(
                                          //
                                          //                        clipBehavior: Clip.none,
                                          //
                                          //                        children: [
                                          //
                                          //                          Padding(
                                          //
                                          //                            padding: const EdgeInsets.all(8.0),
                                          //
                                          //                            child: Container(
                                          //
                                          //                              width: width/2,
                                          //
                                          //                              height: height/10,
                                          //
                                          //                              decoration: BoxDecoration(
                                          //
                                          //                                color: Colors.white,borderRadius: BorderRadius.circular(10),
                                          //
                                          //
                                          //
                                          //                              ),
                                          //
                                          //                              child:
                                          //
                                          //                              Column(
                                          //
                                          //                                crossAxisAlignment: CrossAxisAlignment.end,
                                          //
                                          //                                children: [
                                          //
                                          //                                  Padding(
                                          //
                                          //                                    padding: const EdgeInsets.all(8.0),
                                          //
                                          //                                    child: Text("10 % discount",style: TextStyle(
                                          //
                                          //                                        color: Colors.black,fontWeight: FontWeight.bold
                                          //
                                          //                                    ),),
                                          //
                                          //                                  )
                                          //
                                          //                                ],
                                          //
                                          //                              ),
                                          //
                                          //                            ),
                                          //
                                          //                          ),
                                          //
                                          //                          Positioned(
                                          //
                                          //                            top:-10,
                                          //
                                          //                            child: Container(
                                          //
                                          //                              width: width/3.8,
                                          //
                                          //                              height: height/12,
                                          //
                                          //                              decoration: BoxDecoration(
                                          //
                                          //                                image: DecorationImage(
                                          //
                                          //                                    image: AssetImage('assets/images/d.jpg')
                                          //
                                          //                                    ,
                                          //
                                          //                                    fit: BoxFit.cover
                                          //
                                          //                                ),
                                          //
                                          //
                                          //
                                          //                                borderRadius: BorderRadius.circular(5),
                                          //
                                          //
                                          //
                                          //                              ),
                                          //
                                          //                            ),)
                                          //
                                          //                        ],
                                          //
                                          //                      ),
                                          //
                                          //                    ),
                                          //
                                          //                  ),
                                          //
                                          //                );
                                          //
                                          //              }),
                                          //
                                          //        ),

                                          // Padding(
                                          //
                                          //   padding: const EdgeInsets.all(5.0),
                                          //
                                          //   child:   Row(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Text("Join as a",style: TextStyle(
                                          //
                                          //
                                          //
                                          //           color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                                          //
                                          //
                                          //
                                          //       ),),Padding(
                                          //         padding: const EdgeInsets.all(8.0),
                                          //         child: Text("See All",style: TextStyle(
                                          //
                                          //
                                          //
                                          //             color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
                                          //
                                          //
                                          //
                                          //
                                          //         ),),
                                          //       ),
                                          //     ],
                                          //   ),
                                          //
                                          // ),

                                          // Container(
                                          //   height: height/8,
                                          //   width: width,
                                          //   child: SingleChildScrollView(
                                          //     scrollDirection: Axis.horizontal,
                                          //     child: Row(
                                          //       children: [
                                          //         Padding(
                                          //
                                          //           padding: const EdgeInsets.all(8.0),
                                          //
                                          //           child: InkWell(
                                          //             onTap:(){
                                          //               Navigator.push(context, MaterialPageRoute(builder: (_)=>host_registration()));
                                          //             },
                                          //             child: Container(
                                          //
                                          //               width: width/2.5,
                                          //
                                          //               height: height/10,
                                          //
                                          //               decoration: BoxDecoration(
                                          //
                                          //                 color: Colors.white,borderRadius: BorderRadius.circular(10),
                                          //
                                          //                 boxShadow: [
                                          //                   BoxShadow(
                                          //                     color: Colors.grey.withOpacity(0.2),
                                          //                     spreadRadius: 2,
                                          //                     blurRadius: 5,
                                          //                     offset: Offset(
                                          //                         0, 3), // changes position of shadow
                                          //                   ),],
                                          //
                                          //               ),
                                          //
                                          //               child:
                                          //
                                          //               Row(
                                          //
                                          //                 crossAxisAlignment: CrossAxisAlignment.center,
                                          //
                                          //                 children: [
                                          //                  Padding(
                                          //                    padding: const EdgeInsets.all(8.0),
                                          //                    child: Image.asset('assets/images/house.png',height:height/15,width: width/8,),
                                          //                  ),
                                          //
                                          //                   Padding(
                                          //
                                          //                     padding: const EdgeInsets.all(15.0),
                                          //
                                          //                     child: Column(
                                          //                       crossAxisAlignment: CrossAxisAlignment.start,
                                          //                       mainAxisAlignment: MainAxisAlignment.center,
                                          //                       children: [
                                          //                         SizedBox(height: 10,),
                                          //                         Text("I am a",style: TextStyle(
                                          //
                                          //                             color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12
                                          //
                                          //                         ),), Text("Host",style: TextStyle(
                                          //
                                          //                             color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22
                                          //
                                          //                         ),),
                                          //                       ],
                                          //                     ),
                                          //
                                          //                   )
                                          //
                                          //                 ],
                                          //
                                          //               ),
                                          //
                                          //             ),
                                          //           ),
                                          //
                                          //         ),
                                          //         Padding(
                                          //
                                          //           padding: const EdgeInsets.all(8.0),
                                          //
                                          //           child: InkWell(
                                          //             onTap:(){
                                          //               Navigator.push(context, MaterialPageRoute(builder: (_)=>builder_regisstration()));
                                          //             },
                                          //             child: Container(
                                          //
                                          //               width: width/2.2,
                                          //
                                          //               height: height/10,
                                          //
                                          //               decoration: BoxDecoration(
                                          //
                                          //                 color: Colors.white,borderRadius: BorderRadius.circular(10),
                                          //
                                          //                 boxShadow: [
                                          //                   BoxShadow(
                                          //                     color: Colors.grey.withOpacity(0.2),
                                          //                     spreadRadius: 2,
                                          //                     blurRadius: 5,
                                          //                     offset: Offset(
                                          //                         0, 3), // changes position of shadow
                                          //                   ),],
                                          //
                                          //               ),
                                          //
                                          //               child:
                                          //
                                          //               Row(
                                          //
                                          //                 crossAxisAlignment: CrossAxisAlignment.center,
                                          //
                                          //                 children: [
                                          //                  Padding(
                                          //                    padding: const EdgeInsets.all(8.0),
                                          //                    child: Image.asset('assets/images/builing.png',height:height/15,width: width/8,),
                                          //                  ),
                                          //
                                          //                   Padding(
                                          //
                                          //                     padding: const EdgeInsets.all(15.0),
                                          //
                                          //                     child: Column(
                                          //                       crossAxisAlignment: CrossAxisAlignment.start,
                                          //                       mainAxisAlignment: MainAxisAlignment.center,
                                          //                       children: [
                                          //                         SizedBox(height: 10,),
                                          //                         Text("I am a",style: TextStyle(
                                          //
                                          //                             color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12
                                          //
                                          //                         ),), Text("Builder",style: TextStyle(
                                          //
                                          //                             color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22
                                          //
                                          //                         ),),
                                          //                       ],
                                          //                     ),
                                          //
                                          //                   )
                                          //
                                          //                 ],
                                          //
                                          //               ),
                                          //
                                          //             ),
                                          //           ),
                                          //
                                          //         ),
                                          //         Padding(
                                          //
                                          //           padding: const EdgeInsets.all(8.0),
                                          //
                                          //           child: InkWell(
                                          //             onTap:(){
                                          //               Navigator.push(context, MaterialPageRoute(builder: (_)=>broker_registration()));
                                          //             },
                                          //             child: Container(
                                          //
                                          //               width: width/2.2,
                                          //
                                          //               height: height/10,
                                          //
                                          //               decoration: BoxDecoration(
                                          //
                                          //                 color: Colors.white,borderRadius: BorderRadius.circular(10),
                                          //                 boxShadow: [
                                          //                   BoxShadow(
                                          //                     color: Colors.grey.withOpacity(0.2),
                                          //                     spreadRadius: 2,
                                          //                     blurRadius: 5,
                                          //                     offset: Offset(
                                          //                         0, 3), // changes position of shadow
                                          //                   ),],
                                          //
                                          //
                                          //               ),
                                          //
                                          //               child:
                                          //
                                          //               Row(
                                          //
                                          //                 crossAxisAlignment: CrossAxisAlignment.center,
                                          //
                                          //                 children: [
                                          //                  Padding(
                                          //                    padding: const EdgeInsets.all(8.0),
                                          //                    child: Image.asset('assets/images/broker.png',height:height/15,width: width/8,),
                                          //                  ),
                                          //
                                          //                   Padding(
                                          //
                                          //                     padding: const EdgeInsets.all(15.0),
                                          //
                                          //                     child: Column(
                                          //                       crossAxisAlignment: CrossAxisAlignment.start,
                                          //                       mainAxisAlignment: MainAxisAlignment.center,
                                          //                       children: [
                                          //                         SizedBox(height: 10,),
                                          //                         Text("I am a",style: TextStyle(
                                          //
                                          //                             color: Colors.black,fontWeight: FontWeight.bold,fontSize: 12
                                          //
                                          //                         ),), Text("Broker",style: TextStyle(
                                          //
                                          //                             color: Colors.green,fontWeight: FontWeight.bold,fontSize: 22
                                          //
                                          //                         ),),
                                          //                       ],
                                          //                     ),
                                          //
                                          //                   )
                                          //
                                          //                 ],
                                          //
                                          //               ),
                                          //
                                          //             ),
                                          //           ),
                                          //
                                          //         ),
                                          //       ],
                                          //     ),
                                          //   ),
                                          // ),

//               Padding(
//
//                 padding: const EdgeInsets.all(8.0),
//
//                 child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Home Stay",style: TextStyle(
//
//
//
//                         color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
//
//
//
//                     ),),Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("See All",style: TextStyle(
//
//
//
//                           color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
//
//
//
//
//                       ),),
//                     ),
//                   ],
//                 ),
//
//               ),
//
//               Container(
//
//                 height: height/3.8,
//
//                 width: width,
//
//                 child:ListView.builder(
//
//
//
//                     shrinkWrap: true,
//
//                     itemCount: 5,
//
//                     scrollDirection: Axis.horizontal,
//
//                     itemBuilder: (_,index){
//
//                       return   Padding(
//
//                         padding: const EdgeInsets.all(8.0),
//
//                         child: InkWell(
//
//                             onTap: (){
//
//
//
//                               Navigator.push(context, MaterialPageRoute(builder: (_)=>details()));
//
//                             },
//
//                           child: Container(
//
// decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10),
//     border: Border.all(color: Colors.grey,width: 1)
// ),
//                             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//
//                               children: [
//
//                                 Container(
//
//                                   height: height/9,
//
//                                   width: width/2,
//
//
//
//                                   decoration: BoxDecoration(
//
//                                       borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
//
//                                       image: DecorationImage(
//
//                                           image: AssetImage('assets/images/r1.jpg'),
//
//                                           fit: BoxFit.cover
//
//                                       )
//
//                                   ),
//
//                                 ),
//
//                              Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: [
//                                    Text("Conveninent living ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
//                                    Text("in Basundhara",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
//
//                                    Row(
//                                      mainAxisAlignment: MainAxisAlignment.start,
//                                      children: [
//                                        Icon(Icons.location_pin,color: Colors.grey,),
//                                        Text("2.3 km away",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 12),),
//                                      ],
//                                    ),
//
//                                    Text("8.8 Reviews",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.w600,fontSize: 14),),
//
//                                  ],
//                                ),
//                              )
//                               ],
//
//                             ),
//
//                           ),
//
//                         ),
//
//                       );
//
//                     }),
//
//               ),
//               Padding(
//
//                 padding: const EdgeInsets.all(8.0),
//
//                 child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Sale Land/House Sale",style: TextStyle(
//
//
//
//                         color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
//
//
//
//                     ),),Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text("See All",style: TextStyle(
//
//
//
//                           color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500
//
//
//
//
//                       ),),
//                     ),
//                   ],
//                 ),
//
//               ),
//
//               Container(
//
//                 height: height/3.8,
//
//                 width: width,
//
//                 child:ListView.builder(
//
//
//
//                     shrinkWrap: true,
//
//                     itemCount: 5,
//
//                     scrollDirection: Axis.horizontal,
//
//                     itemBuilder: (_,index){
//
//                       return   Padding(
//
//                         padding: const EdgeInsets.all(8.0),
//
//                         child: InkWell(
//
//                             onTap: (){
//
//
//
//                               Navigator.push(context, MaterialPageRoute(builder: (_)=>details()));
//
//                             },
//
//                           child: Container(
//
//                             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//
//                               children: [
//
//                                 Container(
//
//                                   height: height/6,
//
//                                   width: width/2,
//
//
//
//                                   decoration: BoxDecoration(
//
//                                       borderRadius: BorderRadius.circular(10),
//
//                                       image: DecorationImage(
//
//                                           image: AssetImage('assets/images/r1.jpg'),
//
//                                           fit: BoxFit.cover
//
//                                       )
//
//                                   ),
//
//                                 ),
//
//                                 Text("Bangkok",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),),
//
//                                 Text("2.3 km away",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),),
//
//                                 Text("Resturent | Golf Club",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 14),),
//
//                               ],
//
//                             ),
//
//                           ),
//
//                         ),
//
//                       );
//
//                     }),
//
//               ),
                                        ],
                                      ),
                                    )


                                  : Text('No data');
                                  }
                              }
                              return Center(child: CircularProgressIndicator());
                            })),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sell your properties",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: height / 6,

                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/pack.jpeg'),
                                      fit: BoxFit.fitWidth)),
                            ),
                            Container(
                              width: width,
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sell properties",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            "Apply this code for sell your properties at minimum time.Apply this code for sell your properties at minimum timeApply this code for sell your properties at minimum ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 15,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: width / 4,
                                            height: height / 25,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.pinkAccent),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(4.0),
                                              child: Center(
                                                  child: Text(
                                                "Apply",
                                                style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 14),
                                              )),
                                            )),
                                        SizedBox(width: 15,),
                                        InkWell(
                                          onTap: (){
                                            showModalBottomSheet(
                                                backgroundColor: Colors.transparent,
                                                isScrollControlled: true,
                                                elevation: 10,
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return SingleChildScrollView(
                                                          child:                     Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: Container(
                                                              decoration: BoxDecoration(

                                                                color: Colors.white,
                                                                borderRadius: BorderRadius.circular(15),
                                                              ),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                    children: [
                                                                      IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close,color: Colors.pinkAccent,))
                                                                    ],
                                                                  ),
                                                                  Container(
                                                                    height: height / 6,

                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(10),
                                                                            topRight: Radius.circular(10)),
                                                                        image: DecorationImage(
                                                                            image:
                                                                            AssetImage('assets/images/pack.jpeg'),
                                                                            fit: BoxFit.fitWidth)),
                                                                  ),
                                                                  Container(
                                                                    width: width,
                                                                    color: Colors.white,
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Text(
                                                                            "Sell properties",
                                                                            style: TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),

                                                                        Row(
                                                                          mainAxisAlignment:
                                                                          MainAxisAlignment.start,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left: 8.0),
                                                                                child: Text(
                                                                                  "Apply this code for sell your properties at minimum time.Apply this code for sell your properties at minimum timeApply this code for sell your properties at minimum ",
                                                                                  style: TextStyle(
                                                                                      color: Colors.grey,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontSize: 12),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(height: 15,),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(8.0),
                                                                          child: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                  width: width / 4,
                                                                                  height: height / 25,
                                                                                  decoration: BoxDecoration(
                                                                                      border: Border.all(
                                                                                          color: Colors.pinkAccent),
                                                                                      borderRadius:
                                                                                      BorderRadius.circular(8)),
                                                                                  child: Padding(
                                                                                    padding:
                                                                                    const EdgeInsets.all(4.0),
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                          "Apply",
                                                                                          style: TextStyle(
                                                                                              color: Colors.pinkAccent,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 14),
                                                                                        )),
                                                                                  )),
                                                                              SizedBox(width: 15,),
                                                                              Container(
                                                                                  width: width / 4,
                                                                                  height: height / 25,
                                                                                  decoration: BoxDecoration(
                                                                                      color: Colors.pinkAccent,
                                                                                      borderRadius:
                                                                                      BorderRadius.circular(8)),
                                                                                  child: Padding(
                                                                                    padding:
                                                                                    const EdgeInsets.all(4.0),
                                                                                    child: Center(
                                                                                        child: Text(
                                                                                          "Details",
                                                                                          style: TextStyle(
                                                                                              color: Colors.white,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              fontSize: 14),
                                                                                        )),
                                                                                  )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),

                                                        );
                                                      });
                                                });

                                          },
                                          child : Container(
                                              width: width / 4,
                                              height: height / 25,
                                              decoration: BoxDecoration(
                                                  color: Colors.pinkAccent,
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Center(
                                                    child: Text(
                                                  "Details",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w600,
                                                      fontSize: 14),
                                                )),
                                              )),
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Auctions",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "View All",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          Container(

                            width: width,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ButtonsTabBar(
                                    backgroundColor: Colors.pinkAccent,
                                    unselectedBackgroundColor: Colors.white,
                                    unselectedLabelStyle:
                                    TextStyle(color: Colors.black),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    tabs: [
                                      Tab(
                                        text: "Ongoing Auctions",
                                      ),
                                      Tab(
                                        text: "Upcoming Auctions",
                                      ),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: height / 1,
                            child: TabBarView(
                              children: <Widget>[
                                ongoing_auctions(),upcoming_auction()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
  Widget bottomSheetProfileEdit() {
    var count=1;
    var sum=450;
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return                      Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 6,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                      image:
                      AssetImage('assets/images/pack.jpeg'),
                      fit: BoxFit.fitWidth)),
            ),
            Container(
              width: width,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Sell properties",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Apply this code for sell your properties at minimum time.Apply this code for sell your properties at minimum timeApply this code for sell your properties at minimum ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 4,
                            height: height / 25,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.pinkAccent),
                                borderRadius:
                                BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.all(4.0),
                              child: Center(
                                  child: Text(
                                    "Apply",
                                    style: TextStyle(
                                        color: Colors.pinkAccent,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                            )),
                        SizedBox(width: 15,),
                        Container(
                            width: width / 4,
                            height: height / 25,
                            decoration: BoxDecoration(
                                color: Colors.pinkAccent,
                                borderRadius:
                                BorderRadius.circular(8)),
                            child: Padding(
                              padding:
                              const EdgeInsets.all(4.0),
                              child: Center(
                                  child: Text(
                                    "Details",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  )),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }

}
