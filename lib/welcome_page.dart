import 'package:audioplayers/audioplayers.dart';
import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/app_router.dart';
import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    playStartupSound();
  }

  Future<void> playStartupSound() async {
    try {
      await _audioPlayer.play(AssetSource('sounds/smokin.mp3'));
    } catch (e) {
      print('Audio error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        context.go(AppRouter.navbarview);
                      },
                      child: Text(
                        'Start The Fun',
                        style: Styles.textStyle20.copyWith(
                          color: ColorManager.mainColor,
                        ),
                      )),
                ),
              ),
            )));
  }
}
