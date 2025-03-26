import 'package:figner_print_auth/core/utils/constants/styles.dart';
import 'package:figner_print_auth/core/utils/resources/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
                       context.go(AppRouter.homeView);
                      },
                      child: Text(
                        'Start The Fun',
                        style: Styles.textStyle20.copyWith(
                          color: Colors.green,
                        ),
                      )),
                ),
              ),
            )));
  }
}
