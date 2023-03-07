import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../resources/colours.dart';

PreferredSize customAppBar(
  BuildContext context, {
  String avatar = '',
  String title = '',
  String subtitle = '',
  void Function()? onPressed,
}) {
  final bool isHomePage = avatar != '' && title == '';
  final bool isDataPage = avatar != '' && title != '';
  final double safeAreaSize = MediaQuery.of(context).padding.top;
  final double appBarHeight;

  final bool isDesktop = defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.linux ||
      defaultTargetPlatform == TargetPlatform.macOS ||
      kIsWeb;

  final double avatarSize;
  final double neededHeight;
  final double imageThresholdHeight;
  if (isDesktop) {
    avatarSize = 180;
    neededHeight = 0;
    imageThresholdHeight = 76;
  } else {
    avatarSize = 138;
    neededHeight = 25;
    imageThresholdHeight = 60;
  }

  if (isDataPage) {
    appBarHeight = 175 - neededHeight + safeAreaSize;
  } else if (isHomePage) {
    appBarHeight = 130 - neededHeight + safeAreaSize;
  } else if (title != '' && subtitle != '') {
    appBarHeight = 110 + safeAreaSize;
  } else {
    appBarHeight = 90 + safeAreaSize;
  }

  final double appBarImageThreshold = avatar == '' ? 0 : imageThresholdHeight;
  final double dataPageAvatarPosition = isDataPage ? 45 : 0;
  final double appBarFullSize =
      appBarHeight + appBarImageThreshold - safeAreaSize;

  return PreferredSize(
    preferredSize: Size.fromHeight(appBarFullSize),
    child: Stack(alignment: Alignment.topCenter, children: [
      CustomPaint(
        size: Size(MediaQuery.of(context).size.width, appBarHeight),
        painter: AppBarShape(),
      ),
      Padding(
        padding: EdgeInsets.only(top: 10 + safeAreaSize, left: 10, right: 10),
        child: Stack(alignment: Alignment.topCenter, children: [
          Positioned(
            top: subtitle == '' && !isDataPage ? 10 : 0,
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26,
                color: Colours.white,
              ),
            ),
          ),
          Positioned(
            top: 40,
            child: Text(
              subtitle,
              style: const TextStyle(
                fontSize: 20,
                color: Colours.white,
              ),
            ),
          ),
          if (!isHomePage)
            Positioned(
              top: 15,
              left: 0,
              child: RotatedBox(
                quarterTurns: 3,
                child: IconButton(
                  onPressed: onPressed,
                  icon: const Icon(
                    Icons.expand_less,
                    size: 50,
                    color: Colours.white,
                  ),
                ),
              ),
            ),
        ]),
      ),
      if (avatar != '')
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(
                top: 10 + dataPageAvatarPosition + safeAreaSize,
                right: avatarSize * 0.1944),
            child: CustomPaint(
              size:
                  Size(avatarSize, (avatarSize * 1.015075376884422).toDouble()),
              painter: AvatarBackgroundStroke(),
            ),
          ),
        ),
      if (avatar != '')
        Positioned(
          top: 20 + dataPageAvatarPosition + safeAreaSize,
          child: ClipPath(
            clipper: ImageShape(),
            child: Image.network(
              avatar,
              width: avatarSize,
              height: avatarSize * 1.03523,
              fit: BoxFit.cover,
              errorBuilder: (a, b, c) {
                return Container(
                  color: const Color(0xFFCCD5DE),
                  width: avatarSize,
                  height: avatarSize * 1.03523,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Positioned(
                        top: avatarSize * 0.3,
                        child: Container(
                          width: avatarSize * 0.35,
                          height: avatarSize * 0.35,
                          decoration: const BoxDecoration(
                              color: Color(0xFF637684), shape: BoxShape.circle),
                        ),
                      ),
                      Container(
                        width: avatarSize * 0.6,
                        height: avatarSize * 0.32,
                        decoration: const BoxDecoration(
                          color: Color(0xFF637684),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
    ]),
  );
}

class AppBarShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 44, width, height);
    path.lineTo(width, 0);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = Colours.appBarColor;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class ImageShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;

    final path = Path();
    path.moveTo(width * 0.8217286, height * 0.1812743);
    path.lineTo(width * 0.8217337, height * 0.1812748);
    path.cubicTo(width * 0.9974472, height * 0.2366198, width * 1.046437,
        height * 0.4586559, width * 0.9098794, height * 0.5808812);
    path.lineTo(width * 0.9149497, height * 0.5863762);
    path.lineTo(width * 0.9098794, height * 0.5808812);
    path.lineTo(width * 0.5209246, height * 0.9290594);
    path.cubicTo(width * 0.3844136, height * 1.051262, width * 0.1647070,
        height * 0.9820198, width * 0.1255236, height * 0.8044059);
    path.lineTo(width * 0.01396392, height * 0.2985104);
    path.lineTo(width * 0.01396377, height * 0.2985094);
    path.cubicTo(width * -0.02521854, height * 0.1208980, width * 0.1454518,
        height * -0.03187218, width * 0.3211899, height * 0.02351624);
    path.lineTo(width * 0.8217286, height * 0.1812743);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AvatarBackgroundStroke extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(width * 0.6879121, height * 0.9787847);
    path.lineTo(width * 0.6879113, height * 0.9787847);
    path.lineTo(width * 0.1846645, height * 0.8443542);
    path.cubicTo(width * 0.01053993, height * 0.7978472, width * -0.04813787,
        height * 0.5805396, width * 0.07967518, height * 0.4531035);
    path.lineTo(width * 0.4480567, height * 0.08586667);
    path.lineTo(width * 0.4480574, height * 0.08586597);
    path.cubicTo(width * 0.5757787, height * -0.04147910, width * 0.7936170,
        height * 0.01685049, width * 0.8403121, height * 0.1906000);
    path.lineTo(width * 0.9751560, height * 0.6923076);
    path.lineTo(width * 0.9751560, height * 0.6923097);
    path.cubicTo(width * 1.021943, height * 0.8662569, width * 0.8622057,
        height * 1.025347, width * 0.6879121, height * 0.9787847);
    path.close();

    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = width * 0.02;
    paintStroke.color = Colours.blue;
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}