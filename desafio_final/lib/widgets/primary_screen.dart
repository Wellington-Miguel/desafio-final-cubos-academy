import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'background_waves.dart';
import 'custom_app_bar.dart';
import '../resources/strings.dart';
import '../resources/colours.dart';

class PrimaryScreen extends StatelessWidget {
  const PrimaryScreen({
    Key? key,
    this.avatar = '',
    this.title = '',
    this.subtitle = '',
    this.onPressed,
    this.children = const [],
  }) : super(key: key);
  final String avatar;
  final String title;
  final String subtitle;
  final List<Widget> children;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.9;
    final double contentWidth;

    final bool isDesktop =
        defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS || kIsWeb;

    if (isDesktop) {
      contentWidth = width > 800 ? 800 : width;
    } else if (avatar != '' && title == '') {
      contentWidth = MediaQuery.of(context).size.width;
    } else {
      contentWidth = width;
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(
        context,
        avatar: avatar,
        title: title,
        subtitle: subtitle,
        onPressed: onPressed,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Waves(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  const SizedBox(width: double.maxFinite),
                  SizedBox(
                    width: contentWidth,
                    child: Column(
                      children: title == Strings.myHistory && children.isEmpty
                          ? [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(height: MediaQuery.of(context).size.height * 0.7),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.highlight_off,
                                      size: 72,
                                      color: Colours.wavesFillColor.withOpacity(0.3),
                                    ),
                                    const SizedBox(height: 25),
                                    const Text(
                                      Strings.emptyHistory,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Colours.textColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ]
                          : children,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}