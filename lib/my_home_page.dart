
import 'package:flutter/material.dart';
import 'package:oyo/sliver_scaffold.dart';

import 'config.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ColoredBox(
        color: primaryColor,
        child: SliverScaffold(
          body: Text('Body')
        ),
      ),
    );
  }
}
