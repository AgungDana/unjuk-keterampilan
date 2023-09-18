import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:unjukketrampilan/common/appbar.dart';
import 'package:unjukketrampilan/config/colors.dart';
import 'package:unjukketrampilan/modules/discover/screen/page_discover.dart';
import 'package:unjukketrampilan/modules/music/screen/page_music.dart';
import 'package:unjukketrampilan/modules/vault/screen/page_vault.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  final _screen = [
    const DiscoverPage(),
    const VaultPage(),
    const MusicPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_currentIndex],
      bottomNavigationBar: Container(
        color: CustomColors.background,
        padding: const EdgeInsets.all(8),
        child: BottomNavigationBar(
          selectedLabelStyle: TextStyle(color: CustomColors.secondary),
          currentIndex: _currentIndex,
          backgroundColor: CustomColors.background,
          unselectedItemColor: CustomColors.white,
          selectedItemColor: CustomColors.secondary,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/binocular_icon.png',
                width: 24,
                height: 24,
                color: CustomColors.white,
              ),
              activeIcon: Image.asset(
                'assets/binocular_icon.png',
                width: 24,
                height: 24,
                color: CustomColors.secondary,
              ),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/logo_white.png',
                width: 24,
                height: 24,
                color: CustomColors.white,
              ),
              activeIcon: Image.asset(
                'assets/logo_white.png',
                width: 24,
                height: 24,
                color: CustomColors.secondary,
              ),
              label: 'My Vault',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.music_note,
                size: 24,
              ),
              activeIcon: Icon(
                Icons.music_note,
                size: 24,
                color: CustomColors.secondary,
              ),
              label: 'My Music',
            ),
          ],
        ),
      ),
    );
  }
}
