import 'package:appbar_animated/appbar_animated.dart';
import 'package:flutter/material.dart';
class DetailPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ScaffoldLayoutBuilder(
          backgroundColorAppBar:

          const ColorBuilder(Colors.transparent, Colors.pinkAccent),
          textColorAppBar: const ColorBuilder(Colors.white),
          appBarHeight: MediaQuery.of(context).size.height/14,
          appBarBuilder: _appBar,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                
                Image.asset(
                  "assets/images/r3.jpg",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.36,
                  ),
                  height: 900,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(

                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(

                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.search),
                                border: InputBorder.none,
                                hintText: "Search fir a locality,area or city "
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context, ColorAnimated colorAnimated) {
    return AppBar(

      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "AppBar Animate",
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),

    );
  }
}