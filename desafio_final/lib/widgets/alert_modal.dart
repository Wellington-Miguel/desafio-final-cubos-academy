import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../resources/colours.dart';
import 'button.dart';

class AlertModal extends StatelessWidget {
  const AlertModal({
    Key? key,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    final double alertWidth;
    if (isDesktop) {
      alertWidth = width * 0.9 > 600 ? 600 : width * 0.9;
    } else {
      alertWidth = width * 0.9;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: SizedBox(
        height: 257,
        width: alertWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: alertWidth * 0.875,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colours.textColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Button(
              isAlertButton: true,
              onPressed: onPressed ?? () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}