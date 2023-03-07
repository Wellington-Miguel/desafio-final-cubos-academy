import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../resources/colours.dart';
import '../resources/strings.dart';

class BigCard extends StatelessWidget {
  const BigCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.image,
      this.details = false,
      this.onPressed})
      : super(key: key);
  final String title;
  final String description;
  final String image;
  final bool details;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.875;

    final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS ||
        kIsWeb;

    final double size;
    if (isDesktop) {
      size = width > 500 ? 500 : width;
    } else {
      size = width;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size * 0.66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colours.textColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              description,
              maxLines: !details ? 3 : null,
              overflow: !details ? TextOverflow.ellipsis : null,
              style: const TextStyle(
                  color: Colours.colorDescription, fontSize: 14),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 15,
            ),
            if (!details)
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 17),
                  child: TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                    child: Text(
                      Strings.detailButton,
                      style: TextStyle(
                          color: Colours.textColor.withOpacity(0.8),
                          fontSize: 14),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}