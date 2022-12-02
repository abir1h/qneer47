import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/screens/Bottom_Navbar/booking.dart';
import 'package:oyo/screens/Bottom_Navbar/offer.dart';
import 'package:oyo/screens/Bottom_Navbar/profile.dart';
import 'package:oyo/screens/login.dart';
import 'package:http/http.dart' as http;
import 'package:oyo/screens/register.dart';
import 'package:oyo/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bottom_Navbar/home.dart';
import 'home_beta.dart';
class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int current_tab=0;
  final _formKey = GlobalKey<FormState>();
  bool islogin=false;
  saveprefs(String token,String phone,String name,String email, )async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);

    prefs.setString('phone', phone);
    prefs.setString('name', name);
    prefs.setString('email', email);



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
  final List<Widget> screens=[

    home(),
    booking(),
    offer(),profile()
  ];
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=home();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get();

  }
  var tokens;
  get()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
setState(() {
  tokens=token;
});
tokens!=null?null:Future.delayed(const Duration(seconds: 10), () {Show();});
  }
  show() {
    showModalBottomSheet(

        context: (context), builder: (builder) => bottomSheetProfileEdit());
  }  Show(){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        elevation: 10,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return SingleChildScrollView(
                  child: Container(
                    height: height/1.5,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Align(alignment: Alignment.topLeft,
                          child: IconButton(
                            onPressed: (){Navigator.pop(context);},icon: Icon(Icons.clear,color: Colors.black,size: 30,),
                          )
                          ,),
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
                );
              });
        });
  }

  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        current_tab==1?Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome()))
            :current_tab==2?Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome())):current_tab==3?Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome())):
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Confirm Exit"),
                content: Text("Are you sure you want to exit?"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("YES"),
                    onPressed: () {
                      exit(0);
                    },
                  ),
                  FlatButton(
                    child: Text("NO"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            }
        );
        return true;
      },
      child: Scaffold(
key: _scaffoldKey,
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              //  UserAccountsDrawerHeader(
              //
              //   currentAccountPicture: CircleAvatar(
              //     backgroundImage: NetworkImage(
              //       'https://i1.rgstatic.net/ii/profile.image/654463341694976-1533047628075_Q512/Abir-Rahman.jpg'
              //     )
              //   ),
              //   accountEmail: Text('Abir1@example.com'),
              //   accountName: InkWell(
              //     onTap: (){
              //       Navigator.push(context, MaterialPageRoute(builder: (_)=>school_profile()));
              //
              //     },
              //     child: Text(
              //       'Abir Rahman',
              //       style: TextStyle(fontSize: 14),
              //     ),
              //   ),
              //   decoration: BoxDecoration(
              //     color: Colors.black87,
              //   ),
              // ),

              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 14),
                ),
                onTap: () async {
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  prefs.clear();

                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => login_screen()));
                },
              ),

              // ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Class',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>class_screen()));
              //
              //
              //   },
              // ),ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Section',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>section_screen()));
              //
              //
              //   },
              // )
              //
              // ,ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Group',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>group_screen()));
              //
              //
              //   },
              // )
              // ,
              // ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Subject',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>subject_screen()));
              //
              //
              //   },
              // )
              // ,
              // ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Department',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>dept_screen()));
              //
              //
              //   },
              // )
              // ,ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Teacher',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>teacher_screen()));
              //
              //
              //   },
              // )
              // ,ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Students',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>student_screen()));
              //
              //
              //   },
              // )
              // ,
              // ListTile(
              //   leading: const Icon(Icons.house),
              //   title: const Text(
              //     'Result',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>result()));
              //
              //
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.apartment),
              //   title: const Text(
              //     'Attendance',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>attendence()));
              //
              //   },
              // ), ListTile(
              //   leading: const Icon(Icons.apartment),
              //   title: const Text(
              //     'Announcements',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>announcements()));
              //
              //
              //   },
              // ),ListTile(
              //   leading: const Icon(Icons.apartment),
              //   title: const Text(
              //     'Assignments',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () {
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>assignments()));
              //
              //   },
              // ),
              // ListTile(
              //   leading: const Icon(Icons.logout),
              //   title: const Text(
              //     'Logout',
              //     style: TextStyle(fontSize: 14),
              //   ),
              //   onTap: () async{
              //     SharedPreferences prefs = await SharedPreferences.getInstance();
              //
              //     Navigator.push(context, MaterialPageRoute(builder: (_)=>login_screen()));
              //
              //   },
              // ),
              // Container(
              //     // This align moves the children to the bottom
              //     child: Align(
              //         alignment: FractionalOffset.bottomCenter,
              //         // This container holds all the children that will be aligned
              //         // on the bottom and should not scroll with the above ListView
              //         child: Container(
              //           height: height / 10,
              //           decoration: BoxDecoration(
              //             color: Colors.black54,
              //           ),
              //         )))
            ],
          ),
        ),

        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.pinkAccent,
        //   onPressed: () {
        //
        //     setState(() {
        //       currentScreen=home();
        //     });
        //   },
        //   child: Icon(Icons.home,color:Colors.white),
        //
        //
        // ),
        bottomNavigationBar: BottomAppBar(
          color:Colors.white,

          child: Container(
            height: MediaQuery.of(context).size.height/12,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(

                    child: MaterialButton(
                      minWidth: 20,
                      onPressed: (){
                        setState(() {
                          currentScreen=home();
                          current_tab=0;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                              Icons.home,
                              color:  current_tab==0?Colors.pinkAccent:Colors.grey,
                              size:20

                          ),
                          Text(
                              "Home",
                              style:TextStyle(
                                fontSize: 11,
                                color:  current_tab==0?Colors.pinkAccent:Colors.grey,
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MaterialButton(

                      minWidth: 20,

                      onPressed: (){
                        setState(() {
                          currentScreen=booking();
                          current_tab=1;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.account_balance_wallet_sharp,
                              color:  current_tab==1?Colors.pinkAccent:Colors.grey,
                              size:20

                          ),
                           Text(
                              "Order",
                              style:TextStyle(
                                fontSize: 10,
                                color:  current_tab==1?Colors.pinkAccent:Colors.grey,
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MaterialButton(

                      minWidth: 20,

                      onPressed: (){
                        setState(() {
                          currentScreen=booking();
                          current_tab=2;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.search,
                              color:  current_tab==2?Colors.pinkAccent:Colors.grey,
                              size:20

                          ),
                           Text(
                              "Search",
                              style:TextStyle(
                                fontSize: 11,
                                color:  current_tab==2?Colors.pinkAccent:Colors.grey,
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      minWidth: 20,

                      onPressed: (){
                        setState(() {
                          currentScreen=offer();
                          current_tab=3;
                        });

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                              Icons.account_balance_wallet_outlined,
                              color:  current_tab==3?Colors.pinkAccent:Colors.grey,
                              size:20

                          ),
                           Text(
                              "Offer",
                              style:TextStyle(
                                fontSize: 11,
                                color:  current_tab==3?Colors.pinkAccent:Colors.grey,
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                ),
                // MaterialButton(                    minWidth: 20,
                //
                //   onPressed: (){
                //
                //
                //   },
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //
                //       Padding(
                //         padding: const EdgeInsets.only(top: 25.0),
                //         child: Text(
                //           "Best Aid",
                //           style: GoogleFonts.lato(
                //               fontSize: 18,
                //               fontWeight: FontWeight.w600,
                //
                //               color: Colors.white
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                //
                // ),
                Expanded(
                  child: Container(
                    child: MaterialButton(                    minWidth: 20,

                      onPressed: (){
                       tokens!=null?  setState(() {
                         currentScreen=profile();
                         current_tab=4;
                       }):
       Navigator.push(context, MaterialPageRoute(builder: (_)=>login_screen()));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Icon(
                              Icons.person,
                              color:  current_tab==4?Colors.pinkAccent:Colors.grey,
                              size:20

                          ),
                          Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 11,
                                color:  current_tab==4?Colors.pinkAccent:Colors.grey,
                              )
                          )
                        ],
                      ),

                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  Widget bottomSheetProfileEdit() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height ,
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(30.0),
          topRight: const Radius.circular(30.0),
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Align(alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: (){Navigator.pop(context);},icon: Icon(Icons.clear,color: Colors.black,size: 30,),
              )
              ,),
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
    );
  }
}
