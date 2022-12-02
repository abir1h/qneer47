import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:oyo/Appurl/Appurl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


class Otp extends StatefulWidget {
  final String phone;
  Otp({required this.phone});
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  saveprefs(String token,String phone,String name,String email, )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('name', name);
    prefs.setString('email', email);



  }


  Future otpconfirm(String otp)async{

    Map<String, String> requestHeaders = {

      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest('POST',
      Uri.parse(AppUrl.otp),

    );
    request.fields.addAll({
      'otp': otp,
      'phone':widget.phone
    });

    request.headers.addAll(requestHeaders);

    request.send().then((result) async {
      http.Response.fromStream(result)
          .then((response) {
        if (response.statusCode == 200) {

          var data = jsonDecode(response.body);
          print(data['status_code']);
          print('response.body ' + data.toString());
          if(data['status_code']==200){


            saveprefs(data['token']['plainTextToken'], data['data']['phone'], data['data']['name'], data['data']['email'],);

            Fluttertoast.showToast(

                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);

            Navigator.push(context, MaterialPageRoute(builder: (_)=>login_screen()));



          }else{
            print("Fail! ");
            Fluttertoast.showToast(

                msg: data['message'],
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }else{
          print("Fail! ");

          return response.body;

        }

      });
    });
  }


  var role_of;
  getdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var picture_ = prefs.getString('school');
    var role = prefs.getString('role');
    print('tr');
    print(picture_);
    print(role);
    setState(() {
      role_of = role;
    });
    print(role_of);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Fluttertoast.showToast(
            msg: "Can't go back at this stage",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xfff7f6fb),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.topLeft,
                //   child: GestureDetector(
                //     onTap: () => Navigator.pop(context),
                //     child: Icon(
                //       Icons.arrow_back,
                //       size: 32,
                //       color: Colors.black54,
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 18,
                ),
                Container(
                  width: width / 2,
                  height: height / 7,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/otp.png',
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Enter your OTP code number",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: _textFieldOTP(
                                  first: true,
                                  last: false,
                                  controller_: otp_1)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller_: otp_2)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: _textFieldOTP(
                                  first: false,
                                  last: false,
                                  controller_: otp_3)),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: _textFieldOTP(
                                  first: false,
                                  last: true,
                                  controller_: otp_4)),
                        ],
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // role_of=='teacher'?otpconfirm_teacher()
                            print('u');
                          otpconfirm(otp_1.text +
                                otp_2.text +
                                otp_3.text +
                                otp_4.text);
                          },
                          style: ButtonStyle(
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Verify',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Didn't you receive any code?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextEditingController otp_1 = TextEditingController();
  TextEditingController otp_2 = TextEditingController();
  TextEditingController otp_3 = TextEditingController();
  TextEditingController otp_4 = TextEditingController();
  Widget _textFieldOTP(
      {required bool first, last, required TextEditingController controller_}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: TextField(
          controller: controller_,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.black12),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Colors.purple),
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
    );
  }
}
