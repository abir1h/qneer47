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
// This widget is reusable
class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Land Type'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}class land_unit extends StatefulWidget {
  final List<String> items;
  const land_unit({Key? key, required this.items}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _land_unitState();
}

class _land_unitState extends State<land_unit> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

// This function is triggered when a checkbox is checked or unchecked
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the Cancel button is pressed
  void _cancel() {
    Navigator.pop(context);
  }

// this function is called when the Submit button is tapped
  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Land Size Unit'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
            value: _selectedItems.contains(item),
            title: Text(item),
            controlAffinity: ListTileControlAffinity.leading,
            onChanged: (isChecked) => _itemChange(item, isChecked!),
          ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: _cancel,
        ),
        ElevatedButton(
          child: const Text('Submit'),
          onPressed: _submit,
        ),
      ],
    );
  }
}

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

class builder_registration2 extends StatefulWidget {

  @override
  _builder_registration2State createState() => _builder_registration2State();
}

class _builder_registration2State extends State<builder_registration2> {
  List<String> _selectedItems = [];
  List<String> land_sizes = [];

  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
    final List<String> _items = [
      'Agricultural',
      'Commercial',
      'Resdential',
      'Java',
      'Others',

    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: _items);
      },
    );

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }
  void land_unit_() async {
    // a list of selectable items
    // these items can be hard-coded or dynamically fetched from a database/API
  final List<String> land_unit_size = [
      'Katha',
      'Acres',
      'Shotok',
      'Decimal',

    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return land_unit(items: land_unit_size);
      },
    );


    // Update UI
    if (results != null) {
      setState(() {
        land_sizes = results;
      });
    }
  }
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
  TextEditingController land_size   =TextEditingController();
  TextEditingController title   =TextEditingController();
  TextEditingController description   =TextEditingController();
  TextEditingController adress   =TextEditingController();
  TextEditingController price   =TextEditingController();

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

    var uri = Uri.parse(AppUrl.create_add);
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

    String p = _selectedItems.toString();
    String newplayer = p.substring(1, p.length - 1);
    print(newplayer);

    Map<String, String> requestHeaders = {
      'Accept': 'application/json',
      'authorization': "Bearer $token"
    };
    // ignore this headers if there is no authentication
    print("headers - $requestHeaders}");
//add headers
    request.fields.addAll({
      'title':title.text,
      'description':description.text,
      'location':adress.text,
      'land_type':newplayer,
      'land_size':land_size.text,
      'land_size_unit':_mySelection!,
      'price':price.text,
      'price_unit':priceunit!,
      'type':"Builder"


    });    request.headers.addAll(requestHeaders);
    request.files.addAll(newList);



// send
    var response = await request.send();

    print(response.statusCode);

    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      print("Item form is statuscode 200");
      print(res.body);

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
      Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome()));

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

            Navigator.push(context, MaterialPageRoute(builder: (_)=>builder_registration2()));



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
  String? _mySelection,priceunit='Total Price';
  @override
  Widget build(BuildContext context) {    var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
  return SafeArea(child: Scaffold(
    backgroundColor: Colors.white,
    // appBar: AppBar(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   title: Text("Host Registration",style: TextStyle(color: CoDlors.black),),
    //   leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black,),onPressed: (){Navigator.pop(context);},),
    // ),
    body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: step1==false && step2==false?
        Column(
          children: [
            SizedBox(height: 30,),
            Text('Step 1',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Few more steps to add your land/flat',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18
            ),),
            SizedBox(height: height/40,),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Select Land Type",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              ),
            ),


            Align(
              alignment: Alignment.topLeft,

              child: InkWell(
                onTap: _showMultiSelect,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Select Your Land Type',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                ),
              ),
            ),

            // display selected items
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align (
                alignment: Alignment.topLeft,

                child: Wrap(
                  children: _selectedItems
                      .map((e) => Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Chip(
                    label: Text(e),
                  ),
                      ))
                      .toList(),
                ),
              ),
            ),
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
                  controller: land_size,
                  keyboardType: TextInputType.number,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Land Size",
                      prefixIcon: Icon(Icons.landscape,color: Colors.grey,)
                  ),
                ),
              ),
            ),            SizedBox(height: height/40,),


            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: width,

                child: Align(
                    alignment: Alignment.topLeft,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Land Size Unit",style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(
                          child: new DropdownButton<String>(
                            isExpanded: true, //Add this property

                            hint:_mySelection==null?Text("Select Land Size Unit ",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey)):Text(_mySelection!,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey)),

                            items:  <String>[
                              'Katha',
                              'Acres',
                              'Shotok',
                              'Decimal',

                            ]
                                .map<DropdownMenuItem<String>>((value) =>
                            new DropdownMenuItem<String>(

                              value: value,
                              child: new Text(value),
                            )
                            ).toList(),

                            onChanged: (value) {

                              setState(() {
                                _mySelection= value;


                              });


                            },
                            underline: DropdownButtonHideUnderline(child: Container()),

                          ),
                        ),
                      ],
                    )

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
                child: TextFormField(
                  controller: adress,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Address",
                      prefixIcon: Icon(Icons.location_pin,color: Colors.grey,)
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
                child: TextFormField(
                  controller: title,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Title",
                      prefixIcon: Icon(Icons.title,color: Colors.grey,)
                  ),
                ),
              ),
            ),SizedBox(height: height/40,),

            Padding(
              padding: const EdgeInsets.only(left: 18.0,right: 18),
              child: Container(
                height: height/9,
                width: width,
                decoration: BoxDecoration(
                    color: AppColors.TextField,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: TextFormField(
                  controller: description,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Description",
                      prefixIcon: Icon(Icons.description,color: Colors.grey,)
                  ),
                ),
              ),
            ),            SizedBox(height: height/40,),

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
                  controller: price,
                  keyboardType: TextInputType.number,
                  validator: (v)=>v!.isEmpty?"Field can't be empty":null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Price",
                      prefixIcon: Icon(Icons.money,color: Colors.grey,)
                  ),
                ),
              ),
            ),
            SizedBox(height: height/40,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: width,

                child: Align(
                    alignment: Alignment.topLeft,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Select Price Unit",style: TextStyle(fontWeight: FontWeight.bold),),
                        Container(
                          child: new DropdownButton<String>(
                            isExpanded: true, //Add this property

                            hint:priceunit==null?Text("Select Price Unit",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey)):Text(priceunit!,style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.grey)),

                            items:  <String>[
                              'Total Price',
                              'Per Bigha',
                              'Per Katha',
                              'Per Acres',
                              'Per Shotok',
                              'Per Decimal',

                            ]
                                .map<DropdownMenuItem<String>>((value) =>
                            new DropdownMenuItem<String>(

                              value: value,
                              child: new Text(value),
                            )
                            ).toList(),

                            onChanged: (value) {

                              setState(() {
                                priceunit= value;


                              });


                            },
                            underline: DropdownButtonHideUnderline(child: Container()),

                          ),
                        ),
                      ],
                    )

                ),
              ),
            ),SizedBox(height: height/40,),

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
        ):Column(
          children: [
            SizedBox(height: 30,),
            Text('Final Step',style: TextStyle(
                color: Colors.black,fontWeight: FontWeight.bold,fontSize: 24
            ),), Text('Uplaod Pictures',style: TextStyle(
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
                        _uploadImageFun();

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
                          child: Text("Submit",style: TextStyle(
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
        )
      ),
    ),
  ));
  }

}
