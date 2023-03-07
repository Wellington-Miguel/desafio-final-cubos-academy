import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.isMenuButton = false,
      this.isCardButton = false,
      this.isAlertButton = false,
      required this.onPressed,
      this.child = const SizedBox(),
      this.disabledText = const Text(Strings.awaitButton, style: TextStyle(
        color: Colours.white, fontSize: 16, fontWeight: FontWeight.w500))
      }) : super(key: key);

  final bool isMenuButton;
  final bool isCardButton;
  final bool isAlertButton;
  final void Function()? onPressed;
  final Widget child;
  final Widget disabledText;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cardWidth = width * 0.7;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    double radius = 2;
    Color color = Colours.buttonColor;
    
    final Size size;
    if (isMenuButton) {
      size = const Size(164, 89);
      radius = 0;
      color = Colours.appBarColor;
    } else if (isCardButton) {
      if (isDesktop) {
        size = cardWidth > 400
            ? const Size(400 * 0.684, 400 * 0.132)
            : Size(cardWidth * 0.684, cardWidth * 0.132);
      } else {
        size = Size(cardWidth * 0.684, cardWidth * 0.132);
      }
      color = Colours.cardButtonColor;
    } else if (isAlertButton) {
      size = const Size(100, 50);
    } else {
      size = const Size(260, 50);
    }

    return ElevatedButton(
      onPressed: onPressed,
      child: !isCardButton
          ? !isAlertButton
              ? onPressed == null
                  ? disabledText
                  : child
              : const Text(
                  Strings.okButton,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                  ),
                )
          : Text(
              Strings.findOutButton,
              style: TextStyle(
                fontSize: size.width * 0.094,
                fontWeight: FontWeight.w500,
              ),
            ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(size),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            } else if (states.contains(MaterialState.disabled)) {
              return Colours.disabledButtonColor;
            }
            return color;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}