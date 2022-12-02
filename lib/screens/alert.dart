import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class alert_dialogs extends StatefulWidget {
  @override
  _alert_dialogsState createState() => _alert_dialogsState();
}

class _alert_dialogsState extends State<alert_dialogs> {
  YoutubePlayerController? _controller;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: '4pUg_jMktl8',
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );

  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller!.dispose();

  }
  var name;
  var val;
  var class_name;
  var group_name;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 0,
      backgroundColor:  Colors.white,

      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
    height: 350,
    decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(12))),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
    YoutubePlayerBuilder(
        onExitFullScreen: () {
          // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
        },
        onEnterFullScreen: (){
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        },
        player: YoutubePlayer(
          controller: _controller!,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,aspectRatio: 2,
          topActions: <Widget>[
            const SizedBox(width: 8.0),
            Expanded(
              child: Text(
                _controller!.metadata.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            // IconButton(
            //   icon: const Icon(
            //     Icons.settings,
            //     color: Colors.white,
            //     size: 25.0,
            //   ),
            //   onPressed: () {
            //     log('Settings Tapped!');
            //   },
            // ),
          ],
          onReady: () {
            _isPlayerReady = true;
          },
          onEnded: (data) {

          },
        ),
        builder: (context, player) =>Container()
    )
      ],
    ),
  );

}
