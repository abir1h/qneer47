import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
class delivery_info extends StatefulWidget {
  @override
  _delivery_infoState createState() => _delivery_infoState();
}

class _delivery_infoState extends State<delivery_info> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.ac_unit_rounded,color: Colors.transparent,),
        title: Text("Delivery Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

      ),
      body: SingleChildScrollView(
        child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Timeline.tileBuilder(
            shrinkWrap: true,
          builder: TimelineTileBuilder.fromStyle(
            contentsAlign: ContentsAlign.alternating,
            contentsBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text('Timeline Event $index'),
            ),
            itemCount: 10,
          )),
        )
        ],),
      ),
    ));

  }
}
