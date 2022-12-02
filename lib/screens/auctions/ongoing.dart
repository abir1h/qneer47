import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
class ongoing_auctions extends StatefulWidget {
  @override
  _ongoing_auctionsState createState() => _ongoing_auctionsState();
}

class _ongoing_auctionsState extends State<ongoing_auctions> {
  @override
  Widget build(BuildContext context) {    var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return Column(
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
                                Text("Valid Till - ",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w700),),
                                CountdownTimer(

                                  endTime: DateTime.now().millisecondsSinceEpoch +500000, textStyle: TextStyle(
                                    color: Colors.black,fontWeight: FontWeight.bold
                                ),
                                ),
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
                                        "Registration",
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
            }),
        SizedBox(height: 35,)
      ],
    );
  }
}
