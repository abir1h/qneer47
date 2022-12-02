import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/screens/login.dart';
import 'package:oyo/utils/colors.dart';
import 'package:http/http.dart' as http;

import 'otp_screen.dart';
class register_screen extends StatefulWidget {
  @override
  _register_screenState createState() => _register_screenState();
}

class _register_screenState extends State<register_screen> {bool value = false;
final _formKey = GlobalKey<FormState>();
TextEditingController name=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController phone=TextEditingController();
TextEditingController password=TextEditingController();
Future registerApi(String name,String email,String phone_,String password ) async {
  Map mapData = {
    'name': name,
    'email': email,
    'phone': phone_,
    'password': password,
  };

  // ignore: unnecessary_brace_in_string_interps
  print("JsonData ${mapData}");

  var res = await http.post(
      Uri.parse(AppUrl.reg),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: json.encode(mapData));

  print("registerApi api loaded");

  if (res.statusCode==201) {
    Fluttertoast.showToast(

        msg: "Otp Sent  Successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0);
    print("navigate");
    Navigator.push(context, MaterialPageRoute(builder: (_)=>Otp(phone:phone.text)));
  }else{
    var data = jsonDecode(res.body);
    Fluttertoast.showToast(

        msg: data['message'],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

  }

}

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Align(alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: (){Navigator.pop(context);},icon: Icon(Icons.clear,color: Colors.black,size: 30,),
                )
                ,),
              Text('Create Account',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
              ),), Text('Continue your journey with Qneer starts here',style: TextStyle(
                  color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
              ),),
              SizedBox(height: height/25,),
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
                    controller: name,
                    validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        prefixIcon: Icon(Icons.person,color: Colors.grey,)
                    ),
                  ),
                ),
              ) ,SizedBox(height: height/25,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: Container(
                  height: height/15,
                  width: width,
                  decoration: BoxDecoration(
                      color: AppColors.TextField,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextFormField(                    validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                    controller: email,

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.grey,)
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(                    validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                      controller: phone,

                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Phone",

                          prefixIcon: Icon(Icons.call_outlined,color: Colors.grey,)
                      ),
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
                  child: TextFormField(                    validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                    controller: password,
obscureText: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
                        prefixIcon: Icon(Icons.lock,color: Colors.grey,)
                    ),
                  ),
                ),
              ),

              SizedBox(height: height/40,),
              Row(
                children: [
                  Checkbox(
                    value: this.value,
                    activeColor: Colors.blue
                    , //The color to use when this checkbox is checked.
                    checkColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "By creating this account you are agreeing",style: TextStyle(
                          color: Colors.grey
                      ),
                      ),
                      Row(
                        children: [
                          Text(
                            "to our ",style: TextStyle(
                              color: Colors.grey
                          ),
                          ),Text(
                            "Terms & Condition ",style: TextStyle(
                              decoration:TextDecoration.underline,
                              color: Colors.blue
                          ),
                          ),
                        ],
                      )

                    ],
                  ) ,



                ],
              ),

              SizedBox(height: height/20,),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18),
                child: InkWell(
                  onTap: (){
if(_formKey.currentState!.validate())  {

  registerApi(name.text,email.text,phone.text,password.text);

}                },
                  child: Container(
                    height: height/15,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text("Register",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                      ),),
                    ),
                  ),
                ),
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
              SizedBox(height: height/25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account ?",style: TextStyle(
                      color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
                  ),),InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>login_screen()));

                    },
                    child: Text(" Let's Login",style: TextStyle(
                        color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20
                    ),),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
