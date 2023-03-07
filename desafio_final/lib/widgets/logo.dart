import 'package:flutter/material.dart';
import '../resources/colours.dart';
import 'dart:ui' as ui;

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 214,
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 10,
            child: CustomPaint(
              size: Size(200, (200 * 1.0100502512562815).toDouble()),
              painter: LogoStroke(),
            ),
          ),
          CustomPaint(
            size: Size(200, (200 * 0.9952153110047847).toDouble()),
            painter: LogoShape(),
          ),
          Positioned(
            left: 35,
            bottom: 70,
            child: CustomPaint(
              size: Size(143, (143 * 0.6330935251798561).toDouble()),
              painter: LogoLas(),
            ),
          ),
        ],
      ),
    );
  }
}

class LogoLas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1292144, size.height * 0.8403318);
    path.lineTo(size.width * 0.1779022, size.height * 0.8403318);
    path.cubicTo(
        size.width * 0.2171612,
        size.height * 0.8403318,
        size.width * 0.2367906,
        size.height * 0.8620602,
        size.width * 0.2367906,
        size.height * 0.9055170);
    path.cubicTo(
        size.width * 0.2367906,
        size.height * 0.9353023,
        size.width * 0.2298353,
        size.height * 0.9584966,
        size.width * 0.2159245,
        size.height * 0.9750977);
    path.cubicTo(
        size.width * 0.2023230,
        size.height * 0.9916989,
        size.width * 0.1831576,
        size.height,
        size.width * 0.1584273,
        size.height);
    path.lineTo(size.width * 0.07496259, size.height);
    path.cubicTo(
        size.width * 0.05208712,
        size.height,
        size.width * 0.03400317,
        size.height * 0.9914545,
        size.width * 0.02071065,
        size.height * 0.9743648);
    path.cubicTo(
        size.width * 0.007418201,
        size.height * 0.9572750,
        size.width * 0.0007719424,
        size.height * 0.9343261,
        size.width * 0.0007719424,
        size.height * 0.9055170);
    path.cubicTo(
        size.width * 0.0007719424,
        size.height * 0.8903807,
        size.width * 0.005254295,
        size.height * 0.8652341,
        size.width * 0.01421899,
        size.height * 0.8300784);
    path.lineTo(size.width * 0.2015504, size.height * 0.1020508);
    path.lineTo(size.width * 0.2066511, size.height * 0.08227534);
    path.cubicTo(
        size.width * 0.2208705,
        size.height * 0.02758784,
        size.width * 0.2435921,
        size.height * 0.0002441409,
        size.width * 0.2748137,
        size.height * 0.0002441409);
    path.cubicTo(
        size.width * 0.2877971,
        size.height * 0.0002441409,
        size.width * 0.2987712,
        size.height * 0.007080080,
        size.width * 0.3077360,
        size.height * 0.02075193);
    path.cubicTo(
        size.width * 0.3170094,
        size.height * 0.03442386,
        size.width * 0.3216468,
        size.height * 0.05078125,
        size.width * 0.3216468,
        size.height * 0.06982420);
    path.cubicTo(
        size.width * 0.3216468,
        size.height * 0.08447261,
        size.width * 0.3193281,
        size.height * 0.1010742,
        size.width * 0.3146914,
        size.height * 0.1196284);
    path.lineTo(size.width * 0.3095906, size.height * 0.1394045);
    path.lineTo(size.width * 0.1292144, size.height * 0.8403318);
    path.close();
    path.moveTo(size.width * 0.5738950, size.height * 0.8403318);
    path.lineTo(size.width * 0.6249007, size.height * 0.8403318);
    path.cubicTo(
        size.width * 0.6638511,
        size.height * 0.8403318,
        size.width * 0.6833259,
        size.height * 0.8618159,
        size.width * 0.6833259,
        size.height * 0.9047852);
    path.cubicTo(
        size.width * 0.6833259,
        size.height * 0.9345705,
        size.width * 0.6763705,
        size.height * 0.9580080,
        size.width * 0.6624597,
        size.height * 0.9750977);
    path.cubicTo(
        size.width * 0.6485489,
        size.height * 0.9916989,
        size.width * 0.6293835,
        size.height,
        size.width * 0.6049619,
        size.height);
    path.lineTo(size.width * 0.5456094, size.height);
    path.cubicTo(
        size.width * 0.5190245,
        size.height,
        size.width * 0.5009403,
        size.height * 0.9836420,
        size.width * 0.4913576,
        size.height * 0.9509273);
    path.cubicTo(
        size.width * 0.4681727,
        size.height * 0.9836420,
        size.width * 0.4457612,
        size.height,
        size.width * 0.4241223,
        size.height);
    path.lineTo(size.width * 0.3712612, size.height);
    path.cubicTo(
        size.width * 0.3372576,
        size.height,
        size.width * 0.3097453,
        size.height * 0.9809568,
        size.width * 0.2887245,
        size.height * 0.9428716);
    path.cubicTo(
        size.width * 0.2680129,
        size.height * 0.9042966,
        size.width * 0.2576568,
        size.height * 0.8540034,
        size.width * 0.2576568,
        size.height * 0.7919920);
    path.cubicTo(
        size.width * 0.2576568,
        size.height * 0.6982420,
        size.width * 0.2780597,
        size.height * 0.6145023,
        size.width * 0.3188640,
        size.height * 0.5407716);
    path.cubicTo(
        size.width * 0.3599784,
        size.height * 0.4665523,
        size.width * 0.4063475,
        size.height * 0.4294432,
        size.width * 0.4579719,
        size.height * 0.4294432);
    path.cubicTo(
        size.width * 0.4975403,
        size.height * 0.4294432,
        size.width * 0.5264439,
        size.height * 0.4511716,
        size.width * 0.5446820,
        size.height * 0.4946284);
    path.cubicTo(
        size.width * 0.5601388,
        size.height * 0.4580080,
        size.width * 0.5803863,
        size.height * 0.4396977,
        size.width * 0.6054259,
        size.height * 0.4396977);
    path.cubicTo(
        size.width * 0.6190273,
        size.height * 0.4396977,
        size.width * 0.6303108,
        size.height * 0.4465330,
        size.width * 0.6392755,
        size.height * 0.4602045);
    path.cubicTo(
        size.width * 0.6485489,
        size.height * 0.4738773,
        size.width * 0.6531856,
        size.height * 0.4907227,
        size.width * 0.6531856,
        size.height * 0.5107420);
    path.cubicTo(
        size.width * 0.6531856,
        size.height * 0.5244136,
        size.width * 0.6507129,
        size.height * 0.5407716,
        size.width * 0.6457669,
        size.height * 0.5598148);
    path.lineTo(size.width * 0.6406662, size.height * 0.5795898);
    path.lineTo(size.width * 0.5738950, size.height * 0.8403318);
    path.close();
    path.moveTo(size.width * 0.4055748, size.height * 0.8439943);
    path.lineTo(size.width * 0.4171669, size.height * 0.8439943);
    path.cubicTo(
        size.width * 0.4425151,
        size.height * 0.8439943,
        size.width * 0.4593626,
        size.height * 0.8276364,
        size.width * 0.4677094,
        size.height * 0.7949216);
    path.lineTo(size.width * 0.5001676, size.height * 0.6682125);
    path.cubicTo(
        size.width * 0.5044957,
        size.height * 0.6516114,
        size.width * 0.5066597,
        size.height * 0.6376955,
        size.width * 0.5066597,
        size.height * 0.6264648);
    path.cubicTo(
        size.width * 0.5066597,
        size.height * 0.6132818,
        size.width * 0.5024863,
        size.height * 0.6018068,
        size.width * 0.4941396,
        size.height * 0.5920409);
    path.cubicTo(
        size.width * 0.4861022,
        size.height * 0.5822750,
        size.width * 0.4763647,
        size.height * 0.5773920,
        size.width * 0.4649273,
        size.height * 0.5773920);
    path.cubicTo(
        size.width * 0.4423612,
        size.height * 0.5773920,
        size.width * 0.4204129,
        size.height * 0.5981443,
        size.width * 0.3990827,
        size.height * 0.6396489);
    path.cubicTo(
        size.width * 0.3777532,
        size.height * 0.6811523,
        size.width * 0.3670885,
        size.height * 0.7241216,
        size.width * 0.3670885,
        size.height * 0.7685545);
    path.cubicTo(
        size.width * 0.3670885,
        size.height * 0.8188477,
        size.width * 0.3799173,
        size.height * 0.8439943,
        size.width * 0.4055748,
        size.height * 0.8439943);
    path.close();
    path.moveTo(size.width * 0.8558201, size.height * 0.6396489);
    path.lineTo(size.width * 0.8470072, size.height * 0.6733398);
    path.cubicTo(
        size.width * 0.8334101,
        size.height * 0.7216795,
        size.width * 0.8140863,
        size.height * 0.7458500,
        size.width * 0.7890504,
        size.height * 0.7458500);
    path.cubicTo(
        size.width * 0.7763741,
        size.height * 0.7458500,
        size.width * 0.7649353,
        size.height * 0.7390136,
        size.width * 0.7547338,
        size.height * 0.7253420);
    path.cubicTo(
        size.width * 0.7448417,
        size.height * 0.7111818,
        size.width * 0.7398993,
        size.height * 0.6950682,
        size.width * 0.7398993,
        size.height * 0.6770023);
    path.cubicTo(
        size.width * 0.7398993,
        size.height * 0.6599125,
        size.width * 0.7443813,
        size.height * 0.6372068,
        size.width * 0.7533453,
        size.height * 0.6088864);
    path.lineTo(size.width * 0.8150144, size.height * 0.4111330);
    path.cubicTo(
        size.width * 0.8301583,
        size.height * 0.3637693,
        size.width * 0.8490216,
        size.height * 0.3400875,
        size.width * 0.8715827,
        size.height * 0.3400875);
    path.cubicTo(
        size.width * 0.8836403,
        size.height * 0.3400875,
        size.width * 0.8940000,
        size.height * 0.3464352,
        size.width * 0.9026547,
        size.height * 0.3591307);
    path.cubicTo(
        size.width * 0.9113094,
        size.height * 0.3713375,
        size.width * 0.9156331,
        size.height * 0.3859864,
        size.width * 0.9156331,
        size.height * 0.4030761);
    path.cubicTo(
        size.width * 0.9156331,
        size.height * 0.4074705,
        size.width * 0.9147050,
        size.height * 0.4169920,
        size.width * 0.9128561,
        size.height * 0.4316409);
    path.cubicTo(
        size.width * 0.9116187,
        size.height * 0.4423830,
        size.width * 0.9110000,
        size.height * 0.4519045,
        size.width * 0.9110000,
        size.height * 0.4602045);
    path.cubicTo(
        size.width * 0.9110000,
        size.height * 0.4909670,
        size.width * 0.9182662,
        size.height * 0.5224614,
        size.width * 0.9327914,
        size.height * 0.5546875);
    path.lineTo(size.width * 0.9592230, size.height * 0.6125489);
    path.cubicTo(
        size.width * 0.9861151,
        size.height * 0.6716307,
        size.width * 0.9995612,
        size.height * 0.7287602,
        size.width * 0.9995612,
        size.height * 0.7839352);
    path.cubicTo(
        size.width * 0.9995612,
        size.height * 0.8454591,
        size.width * 0.9850360,
        size.height * 0.8969727,
        size.width * 0.9559784,
        size.height * 0.9384761);
    path.cubicTo(
        size.width * 0.9269209,
        size.height * 0.9794920,
        size.width * 0.8907482,
        size.height,
        size.width * 0.8474748,
        size.height);
    path.lineTo(size.width * 0.7505612, size.height);
    path.cubicTo(
        size.width * 0.7113022,
        size.height,
        size.width * 0.6916727,
        size.height * 0.9785159,
        size.width * 0.6916727,
        size.height * 0.9355466);
    path.cubicTo(
        size.width * 0.6916727,
        size.height * 0.9057614,
        size.width * 0.6986281,
        size.height * 0.8825682,
        size.width * 0.7125381,
        size.height * 0.8659670);
    path.cubicTo(
        size.width * 0.7264460,
        size.height * 0.8488773,
        size.width * 0.7456187,
        size.height * 0.8403318,
        size.width * 0.7700360,
        size.height * 0.8403318);
    path.lineTo(size.width * 0.8238273, size.height * 0.8403318);
    path.cubicTo(
        size.width * 0.8667914,
        size.height * 0.8403318,
        size.width * 0.8882806,
        size.height * 0.8156739,
        size.width * 0.8882806,
        size.height * 0.7663580);
    path.cubicTo(
        size.width * 0.8882806,
        size.height * 0.7482909,
        size.width * 0.8842590,
        size.height * 0.7270511,
        size.width * 0.8762230,
        size.height * 0.7026364);
    path.lineTo(size.width * 0.8558201, size.height * 0.6396489);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.color = Colours.white;
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LogoShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.9682679, size.height * 0.6611106);
    path.lineTo(size.width * 0.8387464, size.height * 0.1754375);
    path.cubicTo(
        size.width * 0.7918565,
        size.height * -0.0004280894,
        size.width * 0.5730526,
        size.height * -0.05932212,
        size.width * 0.4449679,
        size.height * 0.06942788);
    path.lineTo(size.width * 0.09114019, size.height * 0.4249563);
    path.cubicTo(
        size.width * -0.03699397,
        size.height * 0.5537067,
        size.width * 0.02161847,
        size.height * 0.7735144,
        size.width * 0.1966426,
        size.height * 0.8206298);
    path.lineTo(size.width * 0.6799426, size.height * 0.9507740);
    path.cubicTo(
        size.width * 0.8549665,
        size.height * 0.9978894,
        size.width * 1.015158,
        size.height * 0.8369279,
        size.width * 0.9682679,
        size.height * 0.6611106);
    path.lineTo(size.width * 0.8387464, size.height * 0.1754375);
    path.cubicTo(
        size.width * 0.7918565,
        size.height * -0.0004280894,
        size.width * 0.5730526,
        size.height * -0.05932212,
        size.width * 0.4449679,
        size.height * 0.06942788);
    path.lineTo(size.width * 0.09114019, size.height * 0.4249563);
    path.cubicTo(
        size.width * -0.03699397,
        size.height * 0.5537067,
        size.width * 0.02161847,
        size.height * 0.7735144,
        size.width * 0.1966426,
        size.height * 0.8206298);
    path.lineTo(size.width * 0.6799426, size.height * 0.9507740);
    path.cubicTo(
        size.width * 0.8549665,
        size.height * 0.9978894,
        size.width * 1.015158,
        size.height * 0.8369279,
        size.width * 0.9682679,
        size.height * 0.6611106);
    path.close();

    Paint paintFill = Paint()..style = PaintingStyle.fill;
    paintFill.shader = ui.Gradient.linear(
        Offset(size.width * 0.02204909, size.height * 0.4795322),
        Offset(size.width * 0.9765167, size.height * 0.4795322), [
      const Color(0xff29A9E1).withOpacity(1),
      const Color(0xff2977E1).withOpacity(1)
    ], [0, 1]);
    canvas.drawPath(path, paintFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class LogoStroke extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.8217286, size.height * 0.1791557);
    path.lineTo(size.width * 0.8217337, size.height * 0.1791562);
    path.cubicTo(
        size.width * 0.9974472,
        size.height * 0.2347761,
        size.width * 1.046437,
        size.height * 0.4579174,
        size.width * 0.9098794,
        size.height * 0.5807512);
    path.lineTo(size.width * 0.9149497, size.height * 0.5862736);
    path.lineTo(size.width * 0.9098794, size.height * 0.5807512);
    path.lineTo(size.width * 0.5209246, size.height * 0.9306617);
    path.cubicTo(
        size.width * 0.3844136,
        size.height * 1.053473,
        size.width * 0.1647070,
        size.height * 0.9838856,
        size.width * 0.1255236,
        size.height * 0.8053881);
    path.lineTo(size.width * 0.01396392, size.height * 0.2969746);
    path.lineTo(size.width * 0.01396377, size.height * 0.2969741);
    path.cubicTo(
        size.width * -0.02521854,
        size.height * 0.1184786,
        size.width * 0.1454518,
        size.height * -0.03505154,
        size.width * 0.3211899,
        size.height * 0.02061244);
    path.lineTo(size.width * 0.8217286, size.height * 0.1791557);
    path.close();

    Paint paintStroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01507538;
    paintStroke.color = Colours.blue;
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}