import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:unjukketrampilan/common/appbar.dart';
import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/modules/discover/bloc/bloc_discover.dart';
import 'package:unjukketrampilan/modules/discover/widget/widget_music_played.dart';

class VaultPage extends StatelessWidget {
  const VaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    final blocDiscover = context.read<DiscoverBloc>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppbar(
        appbarText: 'My Vault Playlist',
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              CustomColors.backgroundGradient1,
              CustomColors.backgroundGradient2,
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.queue_music,
                  color: CustomColors.white,
                  size: 104,
                ),
                Text(
                  'Start adding to this playlist',
                  style: TextStyle(color: CustomColors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Simply tap on the three-dots icon beside a track to add it ti a playlist',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: CustomColors.grey),
                ),
                SizedBox(height: 12),
                CustomButton(textButton: 'Go to My Music'),
              ],
            ),
            MusicPlayed(blocDiscover: blocDiscover)
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.textButton,
  }) : super(key: key);

  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: LinearGradient(
          colors: [
            CustomColors.secondary,
            CustomColors.purple,
            CustomColors.red
          ],
        ),
      ),
      child: Center(
          child: Text(
        textButton,
        style: TextStyle(
          color: CustomColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      )),
    );
  }
}
