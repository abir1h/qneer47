import 'package:flutter/material.dart';
import 'package:oyo/screens/order_tabs/recent_orders.dart';
import 'package:oyo/utils/colors.dart';
class booking extends StatefulWidget {
  @override
  _bookingState createState() => _bookingState();
}

class _bookingState extends State<booking> with SingleTickerProviderStateMixin{
  TabController? _controller;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = new TabController(length: 2, vsync: this);

}
  @override
  Widget build(BuildContext context) {var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Icon(Icons.ac_unit_rounded,color: Colors.transparent,),
        title: Text("Orders",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: width,
                color: Colors.white,
                child: TabBar(padding: EdgeInsets.only(left: 20,right: 10),
                  controller: _controller,
                  indicatorColor: Colors.pinkAccent,
                  tabs: [
                    // Tab(icon: Icon(Icons.flight,color: Colors.white,)),
                    Tab(
                      child: Text(
                        "Recent Orders",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Track Order',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Container(
              height: height / 1.3,
              width: width,
              child: TabBarView(
                controller: _controller,
                children: [
                  recent_orders(),
                 Center(child: Text('test'),),
                ],
              ),
            ),
          ],
        ),
      ),

    ));
  }
}
