import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'button.dart';
import '../resources/colours.dart';

class SmallCard extends StatelessWidget {
  const SmallCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.onPressed,
  }) : super(key: key);
  final String title;
  final String subTitle;
  final String image;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.7;

    final bool isDesktop =
        defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || kIsWeb;

    final double size;
    if (isDesktop) {
      size = width > 500 ? 500 : width;
    } else {
      size = width;
    }

    final double sizeTitle = size * 0.088;
    final double sizeSubtitle = size * 0.064;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                Colours.blue,
                Colours.loginBackground.withOpacity(0)
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: sizeTitle, color: Colours.loginBackground),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subTitle,
                    style: TextStyle(
                        fontSize: sizeSubtitle, color: Colours.loginBackground),
                  ),
                  const SizedBox(height: 10),
                  Button(
                    isCardButton: true,
                    onPressed: onPressed,
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}