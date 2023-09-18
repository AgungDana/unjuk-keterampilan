import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:unjukketrampilan/common/appbar.dart';
import 'package:unjukketrampilan/config/colors.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: CustomAppbar(
        appbarText: 'appbarText',
        action: Icon(
          Icons.settings,
          size: 34,
          color: CustomColors.white,
        ),
        isHome: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColors.backgroundGradient1,
              CustomColors.backgroundGradient2,
            ])),
        child: Column(),
      ),
    );
    ;
  }
}
