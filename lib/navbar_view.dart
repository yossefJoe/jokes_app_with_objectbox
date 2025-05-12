import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:figner_print_auth/features/Jokes/presentation/views/pages/jokes_view.dart';
import 'package:figner_print_auth/features/home/presentation/pages/home_screen.dart';
import 'package:figner_print_auth/features/profile/presentation/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBarView extends StatefulWidget {
  const BottomNavBarView({super.key});
  @override
  State<BottomNavBarView> createState() => _BottomNavBarViewState();
}

class _BottomNavBarViewState extends State<BottomNavBarView> {
  List<Widget> bottomNavBarPages = [
    const HomeScreen(),
    const JokesView(),
    const ProfilePage(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          unselectedItemColor: ColorManager.grey,
          selectedItemColor: ColorManager.mainColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.smile),
              label: 'Jokes',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
      body: bottomNavBarPages.elementAt(currentIndex),
    );
  }
}
