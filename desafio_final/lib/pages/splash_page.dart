import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../widgets/secondary_screen.dart';
import '../widgets/logo.dart';
import '../widgets/button.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SecondaryScreen(
      isSplash: true,
      children: [
        const Logo(),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            Strings.splashTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colours.splashTitleColor
                  .withOpacity(Colours.splashTitleOpacity),
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 85),
        Button(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Strings.routeLogin, (route) => false);
          },
          child: const Text(
            Strings.loginButton,
            style: TextStyle(
              color: Colours.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 15),
        RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                text: Strings.accountCreation,
                style: TextStyle(
                  color: Colours.textColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: Strings.createHere,
                recognizer: TapGestureRecognizer()..onTap = () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Strings.routeRegistration, (route) => false);
                },
                style: const TextStyle(
                  color: Colours.blue,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 75),
      ],
    );
  }
}