import 'package:flutter/material.dart';
import 'background_waves.dart';
import '../widgets/rounded_white_background.dart';
import '../resources/colours.dart';

class SecondaryScreen extends StatelessWidget {
  const SecondaryScreen({
    Key? key,
    this.isSplash = false,
    this.isRegister = false,
    this.children = const [],
  }) : super(key: key);
  final bool isSplash;
  final bool isRegister;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(color: Colours.loginBackground),
          const Waves(),
          SafeArea(
            child: isSplash
                ? Center(
                    child: SingleChildScrollView(
                      child: Column(children: children),
                    ),
                )
                : SingleChildScrollView(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        SizedBox(height: height, width: width),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            color: Colours.white,
                            height: 400,
                            width: width,
                          ),
                        ),
                        CustomPaint(
                          size: Size(width, 600),
                          painter: RoundedWhiteBackground(),
                        ),
                        Column(children: children),
                      ],
                    ),
                  ),
          )
        ],
      ),
    );
  }
}