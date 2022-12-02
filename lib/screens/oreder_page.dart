import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oyo/screens/alert.dart';
import 'package:oyo/utils/colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record_mp3/record_mp3.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;
import 'package:audio_wave/audio_wave.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'mainHome.dart';
class orderPage extends StatefulWidget {
  final String price,title,image,des;
  orderPage({required this.price,required this.image,required this.title,required this.des});
  @override
  _orderPageState createState() => _orderPageState();
}

class _orderPageState extends State<orderPage> {
  bool step1=true,step2=true,step3=false;
  var file_;
  Future uploadfile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      setState(() {
        file_ = File(file.path);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Can not chose file",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
  YoutubePlayerController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _controller = YoutubePlayerController(
      initialVideoId: 'iLnmTe5Q2Qw',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }
  bool open=false;
  @override
  Widget build(BuildContext context) {    var height = MediaQuery.of(context).size.height;
  var width = MediaQuery.of(context).size.width;
    return SafeArea(child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: step1==true && step2==true && step3==false?Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            setState(() {
              // submited=true;
              step1=true;
              step2=true;
              step3=true;
            });
            print('tapped');
            // submit();
          },
          child: Container(
            width: width,
            height: height/16,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8),

            ),child: Center(
            child: Text('Order Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ),
          ),
        ),
      ):Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: (){
            // setState(() {
            //   submited=true;
            //   step1=true;
            //   step2=true;
            //   step3=true;
            // });
            // submit();
            Navigator.push(context, MaterialPageRoute(builder: (_)=>MainHome()));
          },
          child: Container(
            width: width,
            height: height/16,
            decoration: BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.circular(8),

            ),child: Center(
            child: Text('Order Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: step1==true && step2==true && step3==false?
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: height/25,),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pinkAccent  ,
                                  child: Icon(Icons.check,color:Colors.white),
                                ),

                              ],
                            ),
                            Expanded(
                              child: Container(
                                width: width,
                                height: 5,
                                child: LinearProgressIndicator(
                                  value: 1,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text('Select Pack',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.pinkAccent  ,
                              child: Icon(Icons.check,color:Colors.white),
                            ),
                            Expanded(
                              child: Container(
                                width: width,
                                height: 5,
                                child: LinearProgressIndicator(
                                  value: 1,
                                  color: Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),                                                                Text('Upload Files',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),)


                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey  ,
                              child: Icon(Icons.check,color:Colors.white),
                            ),

                          ],
                        ),                                                 Text('Payment',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),)


                      ],
                    ),
                  ),
                ],
              ),
            ),            SizedBox(height: height/25,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your choosen package",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: width,
                height: height/7,
                decoration: BoxDecoration(
                  color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0,
                        3), // changes position of shadow
                  ),
                ],
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width/4,
                        height: height/7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),
                            boxShadow: [
                          BoxShadow(
                            color: Colors.grey
                                .withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0,
                                3), // changes position of shadow
                          ),

                        ],
                            borderRadius: BorderRadius.circular(10)
                        ),

                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                            Html(data:  widget.des,shrinkWrap: true,

                              style: {
                                "body": Style(
                                    maxLines: 2,

                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: FontSize.small
                                ),
                              },
                            ),                          Text(widget.price+ " BDT",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 18),),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DottedBorder(  color: Colors.pinkAccent,
                  strokeWidth: 1,
                  child: Container(
                    height: height/15,
                    width: width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10)


                    ),
                    child: Center(child: InkWell(
                      onTap: (){
                       open==false?setState(() {
                         open=true;
                       }):setState(() {
                         open=false;
                       });
                        // uploadfile();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.video_collection_rounded,color: Colors.pinkAccent,size: 30,),
                          Text("  Quick Tutorial ",style: TextStyle(color: Colors.pinkAccent,fontSize: 22,fontWeight: FontWeight.w500),),
                          open==false?IconButton(onPressed: (){
                            setState(() {
                              open=true;
                            });
                          }, icon: Icon(Icons.arrow_drop_down)):IconButton(onPressed: (){setState(() {
                            open=false;
                          });}, icon: Icon(Icons.arrow_drop_up_sharp))
                        ],
                      ),
                    ),),
                  )),
            ),
            open==true?Padding(
              padding: const EdgeInsets.all(16.0),
              child: YoutubePlayer(
                controller: _controller!,
                showVideoProgressIndicator: true,

              ),
            ):Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Upload PDF ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: DottedBorder(  color: Colors.pinkAccent,
              strokeWidth: 1,
              child: file_!=null?Container(
                height: height/10,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)


                ),
                child: Center(child: InkWell(
                  onTap: (){
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.attachment,color: Colors.pinkAccent,size: 30,),
                      Text("File Selected",style: TextStyle(color: Colors.pinkAccent,fontSize: 22,fontWeight: FontWeight.w500),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(onPressed: (){}, icon: Icon(Icons.clear)),
                      )
                    ],
                  ),
                ),),
              ):Container(
                height: height/10,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10)


                ),
              child: Center(child: InkWell(
                onTap: (){
                  uploadfile();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.attachment,color: Colors.pinkAccent,size: 30,),
                    Text("  Upload PDF ",style: TextStyle(color: Colors.pinkAccent,fontSize: 22,fontWeight: FontWeight.w500),),
                  ],
                ),
              ),),
              )),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Record Audio Statements",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child:  statusText=='Recording'?SpinKitThreeInOut(color: Colors.pinkAccent,size: 20,):GestureDetector(
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(color: Colors.red.shade300,shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          'start',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () async {
                      startRecord();
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(color: Colors.blue.shade300,shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          RecordMp3.instance.status == RecordStatus.PAUSE
                              ? 'resume'
                              : 'pause',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      pauseRecord();
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    child: Container(
                      height: 48.0,
                      decoration: BoxDecoration(color: Colors.green.shade300,shape: BoxShape.circle),
                      child: Center(
                        child: Text(
                          'stop',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    onTap: () {
                      stopRecord();
                    },
                  ),
                ),
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,right: 10),
                  child: Text(
                    statusText,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ),
                statusText=='Recording'?  Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: AudioWave(
                    height: 32,
                    width: 88,animation: true,
                    spacing: 2.5,
                    bars: [
                      AudioWaveBar(heightFactor: .1, color: Colors.lightBlueAccent),
                      AudioWaveBar(heightFactor: .3, color: Colors.blue),
                      AudioWaveBar(heightFactor:.4, color: Colors.black),
                      AudioWaveBar(heightFactor: .5),
                      AudioWaveBar(heightFactor: .9, color: Colors.orange),
                    ],
                  ),
                ):Container()
              ],
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isplay==false?InkWell(
                  onTap: (){
                    setState(() {
                      isplay=true;
                    });
                    play();
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 100,
                    height: 50,
                    child: isComplete && recordFilePath != null
                        ? Icon(Icons.play_arrow
                    )
                        : Container(),
                  ),
                ):InkWell(
                  onTap: (){
                    setState(() {
                      isplay=false;
                    });
                    play();

                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    width: 100,
                    height: 50,
                    child: isComplete && recordFilePath != null
                        ? Icon(Icons.pause
                    )
                        : Container(),
                  ),
                ),
                isComplete && recordFilePath != null? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AudioWave(
                    height: 32,
                    width: 88,animation: false,
                    spacing: 2.5,
                    bars: [
                      AudioWaveBar(heightFactor: .1, color: Colors.lightBlueAccent),
                      AudioWaveBar(heightFactor: .3, color: Colors.blue),
                      AudioWaveBar(heightFactor:.4, color: Colors.black),
                      AudioWaveBar(heightFactor: .5),
                      AudioWaveBar(heightFactor: .9, color: Colors.orange),

                    ],
                  ),
                ):Container(


                ),

              ],
            ),






          ],
        ):
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: height/25,),
            Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.pinkAccent  ,
                                  child: Icon(Icons.check,color:Colors.white),
                                ),

                              ],
                            ),
                            Expanded(
                              child: Container(
                                width: width,
                                height: 5,
                                child: LinearProgressIndicator(
                                  value: 1,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            )
                          ],
                        ),
                        Text('Select Pack',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.pinkAccent  ,
                              child: Icon(Icons.check,color:Colors.white),
                            ),
                            Expanded(
                              child: Container(
                                width: width,
                                height: 5,
                                child: LinearProgressIndicator(
                                  value: 1,
                                  color: Colors.pinkAccent,
                                ),
                              ),
                            )
                          ],
                        ),

                        Text('Upload Files',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),)


                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.pinkAccent  ,
                              child: Icon(Icons.check,color:Colors.white),
                            ),

                          ],
                        ),                                                 Text('Payment',style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500),)


                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your choosen package",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: width,
                height: height/7,
                decoration: BoxDecoration(
                    color: Colors.white, boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0,
                        3), // changes position of shadow
                  ),
                ],
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width/4,
                        height: height/7,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(image: NetworkImage(widget.image),fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0,
                                    3), // changes position of shadow
                              ),

                            ],
                            borderRadius: BorderRadius.circular(10)
                        ),

                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
                            Html(data:  widget.des,shrinkWrap: true,

                              style: {
                                "body": Style(
                                    maxLines: 2,

                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: FontSize.small
                                ),
                              },
                            ),                          Text(widget.price+ " BDT",style: TextStyle(color: Colors.pinkAccent,fontWeight: FontWeight.w500,fontSize: 18),),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Payment Method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  selected==false?setState((){
                    selected=true;
                  }):setState((){
                    selected=false;
                  });
                },
                child: Container(
                  height: height/10,
                  width: width,
                  decoration: BoxDecoration(
                      border: Border.all(color: selected==false?Colors.white:Colors.pinkAccent),
                  image:DecorationImage(image: AssetImage('assets/images/bk.jpg')) ,
                  color: Colors.white,borderRadius: BorderRadius.circular(8),
                ),),
              ),
            )
          ],
        )
      ),
    ));
  }bool submited=false;
  bool isplay=false;
  String statusText = "";
bool selected=false;
  Future<bool> checkPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.microphone,
      Permission.storage,
    ].request();
    print(statuses[Permission.location]);
    return statuses[Permission.microphone] == PermissionStatus.granted;
  }
  bool show_record=false;

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      statusText = "Recording";
      recordFilePath = await getFilePath();
      isComplete = false;
      RecordMp3.instance.start(recordFilePath!, (type) {
        statusText = "te--->$type";
        setState(() {});
      });
    } else {
      statusText = "Start again";
    }
    setState(() {});
  }

  void pauseRecord() {
    if (RecordMp3.instance.status == RecordStatus.PAUSE) {
      bool s = RecordMp3.instance.resume();
      if (s) {
        statusText = "Recording Resumed...";
        setState(() {});
      }
    } else {
      bool s = RecordMp3.instance.pause();
      if (s) {
        statusText = "Recording Paused...";
        setState(() {});
      }
    }
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      statusText = "Recording Stopped";
      isComplete = true;
      setState(() {


      });
    }
  }

  void resumeRecord() {
    bool s = RecordMp3.instance.resume();
    if (s) {
      statusText = "Recording Resumed...";
      setState(() {});
    }
  }

  String? recordFilePath;
  File? p;

  void play() {
    if (recordFilePath != null && File(recordFilePath!).existsSync()) {
      AudioPlayer audioPlayer = AudioPlayer();
      audioPlayer.play(recordFilePath!, isLocal: true);
    }
  }

  int i = 0;
  bool isComplete = false;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test_${i++}.mp3";
  }
}
