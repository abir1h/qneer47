import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
class upcoming_auction extends StatefulWidget {
  @override
  _upcoming_auctionState createState() => _upcoming_auctionState();
}

class _upcoming_auctionState extends State<upcoming_auction> {
  @override
  Widget build(BuildContext context) {    var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SafeArea(child: Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(

              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_,index){

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Ariyaan Properties",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.bold),),
                          Text("Start from - 30 lakhs ",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w700),),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Start from - ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                                  Text(" 25th may,2020 ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),

                                ],
                              ),
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
                                          "Opening soon",
                                          style: TextStyle(
                                              color: Colors.pinkAccent,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        )),
                                  )),

                            ],
                          ),


                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    ),
  ));
  }
}
