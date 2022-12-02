import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:http/http.dart'as http;
import 'package:http/http.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:oyo/Appurl/Appurl.dart';
import 'package:oyo/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mainHome.dart';
import 'hostreg_2.dart';
class DynamicWidget extends StatelessWidget {
  TextEditingController resturentname = new TextEditingController();


  @override
  Widget build(BuildContext context) {  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Container(
                    height: height/15,
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.TextField,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      controller: resturentname,
                      validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Resturent Name",
                          prefixIcon: Icon(Icons.home,color: Colors.grey,)
                      ),
                    ),
                  ),
                ) ,
            ),

          ],
        ),
      ),
    );
  }
}
class shooping_dynamic extends StatelessWidget {
  TextEditingController shop = new TextEditingController();


  @override
  Widget build(BuildContext context) {  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Container(
                    height: height/15,
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.TextField,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      controller: shop,
                      validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Shopping Mall Name",
                          prefixIcon: Icon(Icons.local_mall,color: Colors.grey,)
                      ),
                    ),
                  ),
                ) ,
            ),

          ],
        ),
      ),
    );
  }
}
class transport_dynamic extends StatelessWidget {
  TextEditingController transport = new TextEditingController();


  @override
  Widget build(BuildContext context) {  var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18.0,right: 18),
                  child: Container(
                    height: height/15,
                    width: width,
                    decoration: BoxDecoration(
                        color: AppColors.TextField,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: TextFormField(
                      controller: transport,
                      validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Transport",
                          prefixIcon: Icon(Icons.bus_alert,color: Colors.grey,)
                      ),
                    ),
                  ),
                ) ,
            ),

          ],
        ),
      ),
    );
  }
}

class host_reg2 extends StatefulWidget {
  final String id;
  host_reg2({required this.id});
  @override
  _host_reg2State createState() => _host_reg2State();
}

class _host_reg2State extends State<host_reg2> {
  TextEditingController nid=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController alt_phone_number =TextEditingController();
  TextEditingController guarantor_name =TextEditingController();
  TextEditingController guarantor_phone_number =TextEditingController();
  TextEditingController person   =TextEditingController();
  TextEditingController rent  =TextEditingController();
  TextEditingController location_by_local  =TextEditingController();
  TextEditingController room_details   =TextEditingController();
  TextEditingController room_name   =TextEditingController();
  _uploadImageFun() async {
    print("Note - _getImagePaths called");
    List<File> fileImageArray = [];
    images.forEach((imageAsset) async {
      final filePath =
      await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);

      File tempFile = File(filePath);
      print(filePath);
      print("filePath.length  - ${filePath.length}");
      print(tempFile);
      print("tempFile.length() - ${tempFile.lengthSync()}");

      if (tempFile.existsSync()) {

        DateTime now = DateTime.now();

        final dir = await getTemporaryDirectory();
        final targetPath =
            dir.absolute.path + "/lookaptPostImage${now.microsecond}.jpg";

        File? imgFile =
        await testCompressAndGetFile(File(tempFile.path), targetPath);

        print("Compressed image");
        print(imgFile!.lengthSync());
        fileImageArray.add(imgFile); //with image compress
      }
      if (fileImageArray.length == images.length) {
        await  uploadMultipleImage(files: fileImageArray);
      }
    });
    print("Test Prints");
    print(fileImageArray.length);

    return fileImageArray;
  }
  Future<File?> testCompressAndGetFile(File file, String targetPath) async {
    print("testCompressAndGetFile");
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 30,
      minWidth: 1024,
      minHeight: 1024,
      // rotate: 90,
    );
    print(file.lengthSync());

    return result;
  }

  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
bool uploading=false;
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
  Future uploadMultipleImage({required List<File> files}) async {
// string to uri
    listDynamic.forEach((widget) => data.add(widget.resturentname.text));
    shopping.forEach((widget) => days_data.add(widget.shop.text));
    transport.forEach((widget) => when_eats_data.add(widget.transport.text));
    var uri = Uri.parse(AppUrl.host_create);
    print("image upload URL - $uri");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
// create multipart request
    var request = new http.MultipartRequest("POST", uri);
    List<MultipartFile> newList = [];

    for (var file in files) {
      String fileName = file.path.split("/").last;
      var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));

      // get file length

      var length = await file.length(); //imageFile is your image file
      print("File lenght - $length");
      print("fileName - $fileName");
      // multipart that takes file
      var multipartFileSign = new http.MultipartFile('image[]', stream, length,
        filename: fileName,
      );
      newList.add(multipartFileSign);
      print(newList);


    }

    //   for(int i =0;i<files.length;i++){
    //     var file;
    //     String fileName = files[i].path.split("/").last;
    //     var stream = new http.ByteStream(DelegatingStream.typed(file.openRead()));
    //
    //       // get file length
    //
    //       var length = await file.length(); //imageFile is your image file
    //       print("File lenght - $length");
    //       print("fileName - $fileName");
    // var multipartFileSign = new http.MultipartFile('image', stream, length,
    //           filename: fileName);
    //
    //     newList.add(multipartFileSign);
    //   }

    String p = selected_items.toString();
    String newplayer = p.substring(1, p.length - 1);
    print(newplayer);
    String r_name = data.toString();
    String resturent = r_name.substring(1, r_name.length - 1);
    String shop = days_data.toString();
    String shooppping = shop.substring(1, shop.length - 1);
    String transportw = when_eats_data.toString();
    String transe = transportw.substring(1, transportw.length - 1);
    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };
    // ignore this headers if there is no authentication
    print("headers - $requestHeaders}");
//add headers
    request.fields.addAll({
      'category_id ':widget.id,
      'checkout_time':_selectedTime.toString(),
      'checkin_time':_selectedTime2.toString(),
      'person':person.text,
      'rent':rent.text,
      'room_details':room_details.text,
      'room_name':room_name.text,
      'location_by_local':location_by_local.text,
      //step2
      'amenities':newplayer,
      'restaurant':resturent,
      'shopping_mall':shooppping,
      'transport':transe,
    });    request.headers.addAll(requestHeaders);
    request.files.addAll(newList);



// send
    var response = await request.send();

    print(response.statusCode);

    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print("Item form is statuscode 200");
      print(res.body);

      var responseDecode = json.decode(res.body);
      setState(() {
        uploading=false;
      });
      Fluttertoast.showToast(

          msg: "Uplaoded Successfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      Navigator.pop(context);

      if (responseDecode['status'] == 200) {
        print(res.body);

        return res.body;
      } else {
        print(res.body);

        return res.body;
      }
    }else{
      print(res.body);

    }


  }

  Future host_registrataion( )
  async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };
    var request = await http.MultipartRequest('POST',
      Uri.parse(AppUrl.hsot_reg),

    );
    String p = selected_items.toString();
    String newplayer = p.substring(1, p.length - 1);
    print(newplayer);
    request.fields.addAll({
//step 1
    'category_id ':widget.id,
    'checkout_time':_selectedTime.toString(),
    'checkin_time':_selectedTime2.toString(),
    'person':person.text,
    'rent':rent.text,
    'room_details':room_details.text,
    'room_name':room_name.text,
    'location_by_local':location_by_local.text,
      //step2
      'amenities':newplayer,


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

            Navigator.push(context, MaterialPageRoute(builder: (_)=>host_reg2(id: '1',)));



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
  DateTime _dateTime = DateTime.now();
  String? _selectedTime;
  String? _selectedTime2;


  // We don't need to pass a context to the _show() function
  // You can safety use context as below
  Future<void> _show() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime = result.format(context);
      });
    }
  }  Future<void> _show2() async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      setState(() {
        _selectedTime2 = result.format(context);
      });
    }
  }
  bool step1=false;
  bool step2=false;
  bool step3=false;List selected_items=[];
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
  List facilites_name=[];
  List<Asset> images = [];
  String _error = "";
  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AssetThumb(
                asset: asset,
                width: 300,
                height: 300,
              ),
            ),
            Positioned(
                left: MediaQuery.of(context).size.width/5,
                child:             IconButton(icon:Icon(Icons.close,color: Colors.red,),onPressed: (){
                  setState(() {
                    images.removeAt(index);

                  });
                },)
            )
          ],
        );
      }),
    );
  }

  Future<void> loadAssets() async {
    setState(() {
      images = <Asset>[];
    });

    List<Asset> resultList=[];
    String error='';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,

      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;

      if (error == null) _error = 'Selected images';
    });
  }
  // Future<File> testCompressAndGetFile(File file, String targetPath) async {
  //   print("testCompressAndGetFile");
  //   final result = await FlutterImageCompress.compressAndGetFile(
  //     file.absolute.path,
  //     targetPath,
  //     quality: 30,
  //     minWidth: 1024,
  //     minHeight: 1024,
  //     // rotate: 90,
  //   );
  //   print(file.lengthSync());
  //   print(result.lengthSync());
  //
  //   return result;
  // }
  //
  // _uploadImageFun() async {
  //   print("Note - _getImagePaths called");
  //   List<File> fileImageArray = [];
  //   images.forEach((imageAsset) async {
  //     final filePath =
  //     await FlutterAbsolutePath.getAbsolutePath(imageAsset.identifier);
  //
  //     File tempFile = File(filePath);
  //     print(filePath);
  //     print("filePath.length  - ${filePath.length}");
  //     print(tempFile);
  //     print("tempFile.length() - ${tempFile.lengthSync()}");
  //
  //     if (tempFile.existsSync()) {
  //
  //       DateTime now = DateTime.now();
  //
  //       final dir = await getTemporaryDirectory();
  //       final targetPath =
  //           dir.absolute.path + "/lookaptPostImage${now.microsecond}.jpg";
  //
  //       File imgFile =
  //       await testCompressAndGetFile(File(tempFile.path), targetPath);
  //
  //       print("Compressed image");
  //       print(imgFile.lengthSync());
  //       fileImageArray.add(imgFile); //with image compress
  //     }
  //     if (fileImageArray.length == images.length) {
  //       await  uploadMultipleImage(files: fileImageArray);
  //     }
  //   });
  //   print("Test Prints");
  //   print(fileImageArray.length);
  //
  //   return fileImageArray;
  // }
  List<DynamicWidget> listDynamic = [];
  List<shooping_dynamic> shopping = [];
  List<transport_dynamic> transport = [];
  List<String> data = [];
  List<String> days_data = [];
  List<String> when_eats_data = [];
  List<String> quantity = [];
  addDynamic() {


    listDynamic.add(new DynamicWidget());

    setState(() {});
  }
  addshopping() {


    shopping.add(new shooping_dynamic());

    setState(() {});
  }
  remove(int index) {


    listDynamic.removeAt(index);

    setState(() {});
  }removeshopping(int index) {


    shopping.removeAt(index);

    setState(() {});
  }
  addtransport() {


    transport.add(new transport_dynamic());

    setState(() {});
  }
  removetransport(int index) {


    transport.removeAt(index);

    setState(() {});
  }
  submitData() async {

    listDynamic.forEach((widget) => data.add(widget.resturentname.text));

    setState(() {});

    print('test');
    print(data);



    String p = data.toString();
    String newplayer = p.substring(1, p.length - 1);
    print(newplayer);

    print('item_name'+newplayer);


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addDynamic();
    addshopping();
    addtransport();
  }
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
        child: step1==false && step2==false && step3==false?
        Column(
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
            Text('Step 1',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Few more steps to host your places',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
            SizedBox(height: height/40,),
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
                  controller: room_name,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Room Details",
                      prefixIcon: Icon(Icons.home,color: Colors.grey,)
                  ),
                ),
              ),
            ) ,SizedBox(height: height/40,),
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
                  controller: room_details,

                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Room Details",
                      prefixIcon: Icon(Icons.details,color: Colors.grey,)
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
                    controller: rent,

                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Room Rent",

                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FaIcon(FontAwesomeIcons.moneyBill,color: Colors.grey,),
                        ),
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(                    validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                    controller: location_by_local,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Location",

                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(child: FaIcon(FontAwesomeIcons.locationArrow,color: Colors.grey)),
                      ),
                    ),
                  ),
                ),
              ),
            ) ,SizedBox(height: height/40,),
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
                    controller: person,
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Persons",

                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(FontAwesomeIcons.personBooth,color: Colors.grey),
                      ),
                    ),
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
                child: _selectedTime==null?
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.access_time,color: Colors.grey,),
                          Text(" Check-in Time : "),
                          InkWell(

                            onTap: _show,
                            child: Text("Pick a time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ):
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time,color: Colors.grey,),

                      Text(" Check-in Time : "),
                      InkWell(

                        onTap: _show,
                        child: Text(_selectedTime.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ),
            ),SizedBox(height: height/40,), Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Container(
                height: height/15,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.TextField,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: _selectedTime2==null?
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.access_time,color: Colors.grey,),
                          Text(" Check-out Time : "),
                          InkWell(

                            onTap: _show2,
                            child: Text("Pick a time",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ):
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.access_time,color: Colors.grey,),

                      Text(" Check-out Time : "),
                      InkWell(

                        onTap: _show2,
                        child: Text(_selectedTime2.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                )
              ),
            ),SizedBox(height: height/40,),

            // Row(
            //   children: [
            //     Checkbox(
            //       value: this.value,
            //       activeColor: Colors.blue
            //       , //The color to use when this checkbox is checked.
            //       checkColor: Colors.black,
            //       onChanged: (value) {
            //         setState(() {
            //           this.value = value!;
            //         });
            //       },
            //     ),
            //
            //     Column(crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           "By creating this account you are agreeing",style: TextStyle(
            //             color: Colors.grey
            //         ),
            //         ),
            //         Row(
            //           children: [
            //             Text(
            //               "to our ",style: TextStyle(
            //                 color: Colors.grey
            //             ),
            //             ),Text(
            //               "Terms & Condition ",style: TextStyle(
            //                 decoration:TextDecoration.underline,
            //                 color: Colors.blue
            //             ),
            //             ),
            //           ],
            //         )
            //
            //       ],
            //     ) ,
            //
            //
            //
            //   ],
            // ),

            SizedBox(height: height/20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate())  {

                        // registerApi(name.text,email.text,phone.text,password.text);
                        setState(() {
                          step1=false;
                          step2=true;
                          step1=false;
                        });
                        // host_registrataion(nid.text,address.text,alt_phone_number.text,guarantor_name.text,guarantor_phone_number.text,relation_with_guarantor.text);
                      }                },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Next",style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ):step1==false && step2==true && step3==false?
        Column(
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
            Text('Step 2',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Choose your facilites',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
            SizedBox(height: height/40,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:  GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:150,
                      childAspectRatio: 4/3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 10),
                  itemCount: im.length,
                  itemBuilder: (BuildContext ctx, index) {
                    // return ebook_tile(topicname:snapshot.data[index]['name'],imag:snapshot.data[index]['image']['base_path'] ,id: snapshot.data[index]['id'],author:snapshot.data[index]['author'] ,titile: snapshot.data[index]['title'],
                    //   pdf: snapshot.data[index]['file']['url'],class_: widget.class_,group_: widget.group_,
                    // );
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            if(selected_items.contains(index) ){
                              setState((){
                                selected_items.remove(index);

                              });
                            }else{
                              setState((){
                                selected_items.add(index);
                                facilites_name.add(names[index]);
                              });
                            }
                          },
                          child: Container(
                            height: height/15,
                            width: width/5,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color:selected_items.contains(index)?Colors.pinkAccent:Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),],
                                borderRadius: BorderRadius.circular(10)
                            ),child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(height: 10,),
                                Image.asset(im[index],height: 30,width: 40,),
                                Expanded(child: Text(names[index],style: TextStyle(fontWeight: FontWeight.bold),)),
                              ],
                            ),
                          ),
                          ),
                        )
                    );
                  }),
            ),
Text(facilites_name.toString()),
            Text('Upload Photos',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: ListView(
            shrinkWrap: true,
            children: [

              SizedBox(height: 10,),
              Container(
                child: Column(
                  children: [

                    InkWell(
                      onTap: loadAssets,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          color: Colors.grey.shade400,
                          child: ListTile(
                              leading: Icon(
                                Icons.add_box_outlined,
                                size: 30,
                                color: Colors.black,
                              ),
                              trailing:Text("Pick Images",style: TextStyle(color: Colors.black),)
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: 20,),
                    Container(
                      child: buildGridView(),
                      width: MediaQuery.of(context).size.width ,
                    ),
                    // images.length>0?ElevatedButton(onPressed: (){
                    //   print('tapp');
                    //   setState(() {
                    //     uploading=true;
                    //   });
                    //   _uploadImageFun();
                    // }, child: Text(
                    //     'Upload'
                    // )):Container()
                  ],
                ),
              )

            ],
          ),
        ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        if(_formKey.currentState!.validate())  {

                          // registerApi(name.text,email.text,phone.text,password.text);
                          setState(() {
                            step1=true;
                            step2=false;
                            step1=false;
                          });
                          // host_registrataion(nid.text,address.text,alt_phone_number.text,guarantor_name.text,guarantor_phone_number.text,relation_with_guarantor.text);
                        }                },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Previous",style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate())  {

                        // registerApi(name.text,email.text,phone.text,password.text);
                        setState(() {
                          step1=false;
                          step2=false;
                          step1=true;
                        });
                        // host_registrataion(nid.text,address.text,alt_phone_number.text,guarantor_name.text,guarantor_phone_number.text,relation_with_guarantor.text);
                      }                },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Next",style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ):Column(
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
            Text('Step 3',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Few more steps to host your places',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
            SizedBox(height: height/40,),
            Padding(
              padding: const EdgeInsets.only(left:28.0,bottom: 10),
              child: Row(
                children: [
                  Text("Add Nearby Resturents",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listDynamic.length,
              itemBuilder: (_, index) => Container(
                height: height/15,
                width: width,
                child: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: listDynamic[index]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            print('tr');
                            remove(index);                          // addDynamic();
                          },
                          child: Icon(Icons.remove_circle,color: Colors.red,)),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: InkWell(
                  onTap: (){
                    print('tr');
                    addDynamic();
                  },
                  child: Icon(Icons.add_circle)),
            )
            ,
            Padding(
              padding: const EdgeInsets.only(left:28.0,bottom: 10),
              child: Row(
                children: [
                  Text("Add Nearby Shopping Malls",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,              physics: NeverScrollableScrollPhysics(),

              itemCount: shopping.length,
              itemBuilder: (_, index) => Container(
                height: height/15,
                width: width,
                child: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: shopping[index]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            print('tr');
                            removeshopping(index);                          // addDynamic();
                          },
                          child: Icon(Icons.remove_circle,color: Colors.red,)),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: InkWell(
                  onTap: (){
                    print('tr');
                    addshopping();
                  },
                  child: Icon(Icons.add_circle)),
            )
            , Padding(
              padding: const EdgeInsets.only(left:28.0,bottom: 10),
              child: Row(
                children: [
                  Text("Add Nearby Transports",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,              physics: NeverScrollableScrollPhysics(),

              itemCount: transport.length,
              itemBuilder: (_, index) => Container(
                height: height/15,
                width: width,
                child: Row(mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(child: transport[index]),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: (){
                            print('tr');
                            removetransport(index);                          // addDynamic();
                          },
                          child: Icon(Icons.remove_circle,color: Colors.red,)),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: InkWell(
                  onTap: (){
                    print('tr');
                    addtransport();
                  },
                  child: Icon(Icons.add_circle)),
            )
            ,




            SizedBox(height: height/20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          step1=false;
                          step2=true;
                          step1=false;
                        });
                        },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.pinkAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Previous",style: TextStyle(
                                color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                            ),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  uploading==false?InkWell(
                    onTap: (){
                      if(_formKey.currentState!.validate())  {

                        // registerApi(name.text,email.text,phone.text,password.text);
                        // setState(() {
                        //   step1=false;
                        //   step2=false;
                        //   step1=true;
                        // });
                        // host_registrataion(nid.text,address.text,alt_phone_number.text,guarantor_name.text,guarantor_phone_number.text,relation_with_guarantor.text);
                        _uploadImageFun();

                      }                },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pinkAccent,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text("Submit",style: TextStyle(
                              color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20
                          ),),
                        ),
                      ),
                    ),
                  ):SpinKitThreeInOut(color: Colors.pinkAccent,),
                ],
              ),
            ),

          ],
        ),
      ),
    ),
  ));
  }

}
