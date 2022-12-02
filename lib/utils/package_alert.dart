import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/screens/oreder_page.dart';
import 'package:oyo/utils/colors.dart';

class package_alert extends StatefulWidget {
  final String title, iamge, des, price;
  package_alert(
      {required this.title,
      required this.iamge,
      required this.des,
      required this.price});

  @override
  _package_alertState createState() => _package_alertState();
}

class _package_alertState extends State<package_alert> {
  var c_name;
  Future? myFuture, group_;
  var val;
  String? _mySelection, group_selection;
  List shots = [];
  var _myJson;
  var class_id;
  List<String> countries = ["Nepal", "India", "USA"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var active;

  final _formKey = GlobalKey<FormState>();
  bool issave = false;
  TextEditingController class_name = TextEditingController();
  TextEditingController class_fee = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Wrap(
        children: [
          contentBox(context),
        ],
      ),
    );
  }

  contentBox(context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(top: 20, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Package Details",
                  style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
              CircleAvatar(
                  radius: 40,
                  child: Image.network(
                    widget.iamge,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),

              // Html(data:  widget.des,shrinkWrap: true,
              //
              //   style: {
              //     "body": Style(
              //
              //         color:Colors.white,
              //         fontSize: FontSize.percent(2)
              //     ),
              //   },
              // ),
              Html(data:  widget.des,shrinkWrap: true,

                style: {
                  "body": Style(

                  ),
                },
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Price : ' + widget.price + ' BDT',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>orderPage(price: widget.price,title: widget.title,image: widget.iamge,des: widget.des,)));
                  },
                  child: Container(
                    width: width/3.5,
                    height: height / 20,
                    decoration: BoxDecoration(
                        // gradient: LinearGradient(
                        //   begin: Alignment.topRight,
                        //   end: Alignment.bottomLeft,
                        //   colors: [
                        //     Colors.pinkAccent,
                        //     Colors.orangeAccent,
                        //   ],
                        // ),
                      border: Border.all(color: Colors.pinkAccent),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      'Order Now',
                      style: TextStyle(
                          color: Colors.pinkAccent, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 25,
          width: MediaQuery.of(context).size.width / .7,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: Colors.pinkAccent,
              radius: 15,
              child: Icon(Icons.clear),
            ),
          ),
        )
      ],
    );
  }
}
