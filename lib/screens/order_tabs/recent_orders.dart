import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import 'Delivery_info.dart';
class recent_orders extends StatefulWidget {
  @override
  _recent_ordersState createState() => _recent_ordersState();
}

class _recent_ordersState extends State<recent_orders> {
  @override
  Widget build(BuildContext context) {var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Order List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white,

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
                ),
                child: Column(
                  children: [
                    Divider(color: Colors.pinkAccent,height: 5,thickness: 5,),
                    Row(
                      children: [
                        CircleAvatar(
                          radius:25,
                          backgroundImage: AssetImage(
                            'assets/images/pack.jpeg'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("NID Verification",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                              Text("Details goes here",style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.normal),),
                              Text("Price 599 BDT",style: TextStyle(color: Colors.pinkAccent,fontSize: 12,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment Method",style: TextStyle(color: Colors.black,),),
                                  Text("Bkash",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              SizedBox(height: 10 ,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Investment",style: TextStyle(color: Colors.black,),),
                                  Text("2000 BDT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                          Column(                                crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Status",style: TextStyle(color: Colors.black,),),
                                  Text("Pending",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                              SizedBox(height: 10 ,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Earning",style: TextStyle(color: Colors.black,),),
                                  Text("2000 BDT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DottedBorder(  color: Colors.pinkAccent,
                          strokeWidth: 1,
                          child: Container(
                            height: height/15,
                            width: width,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)


                            ),
                            child: Center(child: InkWell(
                              onTap: (){
                                // open==false?setState(() {
                                //   open=true;
                                // }):setState(() {
                                //   open=false;
                                // });
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>delivery_info()));
                                // uploadfile();
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Delivery Information",style: TextStyle(color: Colors.pinkAccent,fontSize: 18,fontWeight: FontWeight.w500),),
                                  // open==false?IconButton(onPressed: (){
                                  //   setState(() {
                                  //     open=true;
                                  //   });
                                  // }, icon: Icon(Icons.arrow_drop_down)):IconButton(onPressed: (){setState(() {
                                  //   open=false;
                                  // });}, icon: Icon(Icons.arrow_drop_up_sharp))
                                ],
                              ),
                            ),),
                          )),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),),
    ));
  }
}
