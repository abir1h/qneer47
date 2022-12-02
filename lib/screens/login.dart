import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/screens/register.dart';
import 'package:oyo/utils/colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'mainHome.dart';
class login_screen extends StatefulWidget {
  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final _formKey = GlobalKey<FormState>();
  bool islogin=false;
  saveprefs(String token,String phone,String name,String email, )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('name', name);
    prefs.setString('email', email);



  }
  Future logoutApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return await http.post(
      Uri.parse(AppUrl.logout),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        'authorization': "Bearer $token",
      },
    );
  }
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController password=TextEditingController();
  Future login(String email,String password)async {
    Map<String, String> requestHeaders = {

      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest('POST',
      Uri.parse(AppUrl.login),

    );
    request.fields.addAll({
      'phone': email,
      'password': password,
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
            setState(() {
              islogin=false;
            });

            print(data['token']['plainTextToken']);
            print(data['data']['username']);
            saveprefs(data['token']['plainTextToken'], data['data']['phone'], data['data']['name'], data['data']['email'],);
            print("Success! ");
            Fluttertoast.showToast(

                msg: "Login Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                fontSize: 16.0);

            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome()));



          }else{
            var data = jsonDecode(response.body)['message'];

            setState(() {
              islogin=false;
            });
            print("Fail! ");
            Fluttertoast.showToast(

                msg: data,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        }else{
          print("Fail! ");
          var data = jsonDecode(response.body)['message'];

          setState(() {
            islogin=false;
          });

          print(jsonDecode(response.body));
          Fluttertoast.showToast(

              msg: "Unauthorized",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          return response.body;

        }

      });
    });
  }
  @override
  Widget build(BuildContext context) {


    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: (){Navigator.pop(context);},icon: Icon(Icons.clear,color: Colors.black,size: 30,),
            )
              ,),
            SizedBox(height: 60,),

            Text('Welcome Back',style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Continue your journey with Qneer',style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
            SizedBox(height: height/25,),
           Form(
             key: _formKey,
             child: Column(
               children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 18.0,right: 18),
                   child: Container(
                     height: height/15,
                     width: width,
                     decoration: BoxDecoration(
                         color: AppColors.TextField,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: TextFormField(
                       controller: phone,
                       validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           hintText: "phone",
                           prefixIcon: Icon(Icons.phone,color: Colors.grey,)
                       ),
                     ),
                   ),
                 ) , SizedBox(height: height/40,),
                 Padding(
                   padding: const EdgeInsets.only(left: 18.0,right: 18),
                   child: Container(
                     height: height/15,
                     width: width,
                     decoration: BoxDecoration(
                         color: AppColors.TextField,
                         borderRadius: BorderRadius.circular(10)
                     ),
                     child: TextFormField(
                       controller: password,
                       obscureText: true,
                       validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                       decoration: InputDecoration(
                           border: InputBorder.none,
                           hintText: "Password",
                           prefixIcon: Icon(Icons.lock,color: Colors.grey,)
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
              SizedBox(height: height/20,),
          islogin==false?  Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: InkWell(
                onTap: (){
                  if(_formKey.currentState!.validate()){
                    setState(() {
                      islogin=true;
                    });
                    login(phone.text,password.text);
                  }
                },
                child: Container(
                  height: height/15,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Login",style: TextStyle(
                      color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                    ),),
                  ),
                ),
              ),
            ):SpinKitThreeInOut(color: Colors.pinkAccent,size: 25,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Forget Password",style: TextStyle(
                  color: AppColors.forget,fontWeight: FontWeight.normal,fontSize: 18
              ),),
            ), Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Or",style: TextStyle(
                  color: AppColors.or,fontWeight: FontWeight.normal,fontSize: 20
              ),),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 18.0,right: 18),
            //   child: Container(
            //     height:height/15,
            //     width: width,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.grey)
            //     ),
            //     child: Container(
            //       height:height/15,
            //                       child: Row(
            //                         children: [
            //                           Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Image.asset('assets/images/go.png',height: 30,width: 30,),
            //                           ),
            //                           VerticalDivider(color: Colors.grey,),
            //                           Text("Continue with Google",style: TextStyle(
            //                               color: Colors.black,fontWeight: FontWeight.normal,fontSize: 20
            //                           ),),
            //                         ],
            //
            //       ),
            //     ),
            //   ),
            // )
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?",style: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
                ),),InkWell(
                  onTap: (){
                                         Navigator.push(context, MaterialPageRoute(builder: (_)=>register_screen()));

                  },
                  child: Text(" Create Account",style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                  ),),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
