import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart'as http;
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/utils/colors.dart';

import '../mainHome.dart';
import 'hostreg_2.dart';
class broker_registration2 extends StatefulWidget {
  @override
  _broker_registration2State createState() => _broker_registration2State();
}

class _broker_registration2State extends State<broker_registration2> {
  TextEditingController nid=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController alt_phone_number =TextEditingController();
  TextEditingController guarantor_name =TextEditingController();
  TextEditingController guarantor_phone_number =TextEditingController();
  TextEditingController relation_with_guarantor  =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;

  // Determines whether the stepper's orientation is vertical or horizontal
  // This variable can be changed by using the switch below
  bool _isVerticalStepper = true;

  // This function will be triggered when a step is tapped
  _stepTapped(int step) {
    setState(() => _currentStep = step);
  }

  // This function will be called when the continue button is tapped
  _stepContinue() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  // This function will be called when the cancel button is tapped
  _stepCancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
  bool islogin=false;
  bool value=false;
  Future host_registrataion(String nid ,String address,String alt_phone_number ,String guarantor_name  ,String guarantor_phone_number  ,String relation_with_guarantor  )
  async {
    Map<String, String> requestHeaders = {

      'Accept': 'application/json',
    };
    var request = await http.MultipartRequest('POST',
      Uri.parse(AppUrl.broker_reg),

    );
    request.fields.addAll({
      'nid':nid,
      'address':address,
      'guarantor_name ':guarantor_name,
      'alt_phone_number ':alt_phone_number,
      'guarantor_phone_number':guarantor_phone_number,
      'relation_with_guarantor':relation_with_guarantor,
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



            Fluttertoast.showToast(

                msg: "Registered Successfully",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black54,
                textColor: Colors.white,
                fontSize: 16.0);

            Navigator.push(context, MaterialPageRoute(builder: (_)=>broker_registration2()));



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

              msg: "Error occured",
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
  List selected_items=[];
  List Selected=[];
  List im = [
    'assets/images/a1.png',
    'assets/images/a2.png',
    'assets/images/a3.png',
    'assets/images/a4.png',
    'assets/images/a5.png',
    'assets/images/a6.png',
    'assets/images/a7.png',
    'assets/images/a8.png',
    'assets/images/a9.png',
    'assets/images/a10.png',
  ]; List names = [
    'Ac'
    ,'Fan'
    ,'Tv'
    , 'Wifi'
    , 'Kitchen'
    , 'Power'
    , 'Fridge'
    , 'Bathroom'
    , 'Geyser'
    , 'Parking'
  ];
  @override
  Widget build(BuildContext context) {    var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SafeArea(child: Scaffold(
    backgroundColor: Colors.white,
    // appBar: AppBar(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   title: Text("Host Registration",style: TextStyle(color: Colors.black),),
    //   leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
    // ),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Container(
            //   width: width,
            //   height: height/1,
            //   child: Stepper(
            //     // vertical or horizontial
            //     type:StepperType.horizontal,
            //     physics: const ScrollPhysics(),
            //     currentStep: _currentStep,
            //     onStepTapped: (step) => step>_currentStep?setState((){
            //       _currentStep=step;
            //     }):_stepTapped(step),
            //     onStepContinue: _stepContinue,
            //     onStepCancel: _stepCancel,
            //     steps: [
            //       // The first step: Name
            //       Step(
            //         title: const Text('Name'),
            //         content: Column(
            //           children: [
            //             TextFormField(
            //               decoration:
            //               const InputDecoration(labelText: 'Your name'),
            //             ),
            //           ],
            //         ),
            //         isActive: _currentStep >= 0,
            //         state: _currentStep >= 0
            //             ? StepState.complete
            //             : StepState.disabled,
            //       ),
            //       // The second step: Phone number
            //       Step(
            //         title: const Text('Phone'),
            //         content: Column(
            //           children: [
            //             TextFormField(
            //               decoration: const InputDecoration(
            //                   labelText: 'You mobile number'),
            //             ),
            //           ],
            //         ),
            //         isActive: _currentStep >= 0,
            //         state: _currentStep >= 1
            //             ? StepState.complete
            //             : StepState.disabled,
            //       ),
            //       // The third step: Verify phone number
            //       Step(
            //         title: const Text('Verify'),
            //         content: Column(
            //           children: <Widget>[
            //             TextFormField(
            //               decoration: const InputDecoration(
            //                   labelText: 'Verification code'),
            //             ),
            //           ],
            //         ),
            //         isActive: _currentStep >= 0,
            //         state: _currentStep >= 2
            //             ? StepState.complete
            //             : StepState.disabled,
            //       ),
            //     ],
            //   ),
            // ),
            SizedBox(height: 30,),
            Text('Broker Registration ',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Continue your journey with Qneer becoming an host',style: TextStyle(
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
                  controller: nid,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "NID number",
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
                  controller: address,

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                      prefixIcon: Icon(Icons.location_pin,color: Colors.grey,)
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
                    controller: alt_phone_number,

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Alternative phone",

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
                  controller: guarantor_name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Grantor Name",
                      prefixIcon: Icon(Icons.person,color: Colors.grey,)
                  ),
                ),
              ),
            ),SizedBox(height: height/40,),
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
                  controller: guarantor_phone_number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Grantor Phone Number",
                      prefixIcon: Icon(Icons.call,color: Colors.grey,)
                  ),
                ),
              ),
            ),SizedBox(height: height/40,),
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
                  controller: relation_with_guarantor,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Relation With Grantor",
                      prefixIcon: Icon(Icons.receipt_long_outlined,color: Colors.grey,)
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
            islogin==false? Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: InkWell(
                onTap: (){
                  if(_formKey.currentState!.validate())  {

                    // registerApi(name.text,email.text,phone.text,password.text);
                    setState(() {
                      islogin=true;
                    });
                    host_registrataion(nid.text,address.text,alt_phone_number.text,guarantor_name.text,guarantor_phone_number.text,relation_with_guarantor.text);
                  }                },
                child: Container(
                  height: height/15,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text("Submit",style: TextStyle(
                        color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                    ),),
                  ),
                ),
              ),
            ):SpinKitThreeInOut(color: Colors.pinkAccent,size: 20,),

          ],
        ),
      ),
    ),
  ));
  }
}
