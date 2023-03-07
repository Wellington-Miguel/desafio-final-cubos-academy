import 'package:flutter/material.dart';
import '../resources/colours.dart';

class Waves extends StatelessWidget {
  const Waves({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final waveTwoWidth = MediaQuery.of(context).size.width - 40;
    final waveOneWidth = MediaQuery.of(context).size.width - 160;
    
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: CustomPaint(
            size: Size(waveTwoWidth, (waveTwoWidth * 1.65).toDouble()),
            painter: WaveTwo(),
          ),
        ),
        Positioned(
          right: 0,
          child: CustomPaint(
            size: Size(waveOneWidth, (waveOneWidth * 3.375).toDouble()),
            painter: WaveOne(),
          ),
        ),
      ],
    );
  }
}

class WaveOne extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Path path0 = Path();
    path0.moveTo(width * 2.463284, height * -0.2547137);
    path0.cubicTo(width * 1.984111, height * -0.2731154, width * 1.732154,
        height * -0.1368268, width * 1.378567, height * -0.08497792);
    path0.cubicTo(width * 1.158072, height * -0.05266026, width * 1.043942,
        height * -0.06154858, width * 0.8876827, height * 0.002775043);
    path0.cubicTo(width * 0.8009327, height * 0.03848433, width * 0.7844760,
        height * 0.09290613, width * 0.7018077, height * 0.1240933);
    path0.cubicTo(width * 0.5579279, height * 0.1784373, width * 0.3192630,
        height * 0.2013590, width * 0.1801197, height * 0.2666966);
    path0.cubicTo(width * -0.2067702, height * 0.4485185, width * 0.1997337,
        height * 0.5468362, width * 0.5069808, height * 0.6855014);
    path0.cubicTo(width * 0.6328269, height * 0.7423789, width * 0.6503365,
        height * 0.8169943, width * 0.7875048, height * 0.8702464);
    path0.cubicTo(width * 1.112524, height * 0.9964772, width * 1.484673,
        height * 0.9225641, width * 1.908813, height * 0.9229929);
    path0.cubicTo(width * 2.203558, height * 0.9233048, width * 2.396803,
        height * 0.9733989, width * 2.674827, height * 0.9837293);
    path0.cubicTo(width * 2.726563, height * 0.9856396, width * 2.782115,
        height * 0.9878618, width * 2.836351, height * 0.9870043);
    path0.lineTo(width * 2.836351, height * -0.1995912);
    path0.cubicTo(width * 2.805284, height * -0.2073091, width * 2.773558,
        height * -0.2146382, width * 2.741303, height * -0.2214615);
    path0.cubicTo(width * 2.655082, height * -0.2397835, width * 2.563197,
        height * -0.2508547, width * 2.463284, height * -0.2547137);
    path0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =
        Colours.wavesFillColor.withOpacity(Colours.wavesColorOpacity);
    canvas.drawPath(path0, paint0Fill);

    Path path1 = Path();
    path1.moveTo(width * 1.379635, height * -0.08433960);
    path1.lineTo(width * 1.378688, height * -0.08490684);
    path1.lineTo(width * 1.379635, height * -0.08433960);
    path1.cubicTo(width * 1.468288, height * -0.09733917, width * 1.550505,
        height * -0.1156214, width * 1.631370, height * -0.1354114);
    path1.cubicTo(width * 1.661101, height * -0.1426866, width * 1.690625,
        height * -0.1501595, width * 1.720221, height * -0.1576510);
    path1.cubicTo(width * 1.771231, height * -0.1705613, width * 1.822452,
        height * -0.1835271, width * 1.875303, height * -0.1956254);
    path1.cubicTo(width * 2.042197, height * -0.2338362, width * 2.224332,
        height * -0.2631724, width * 2.462971, height * -0.2540085);
    path1.cubicTo(width * 2.562466, height * -0.2501652, width * 2.653981,
        height * -0.2391410, width * 2.739904, height * -0.2208818);
    path1.lineTo(width * 2.739909, height * -0.2208818);
    path1.cubicTo(width * 2.771808, height * -0.2141339, width * 2.803197,
        height * -0.2068889, width * 2.833947, height * -0.1992593);
    path1.lineTo(width * 2.833947, height * 0.9863276);
    path1.cubicTo(width * 2.783538, height * 0.9870442, width * 2.732024,
        height * 0.9851325, width * 2.683356, height * 0.9833276);
    path1.cubicTo(width * 2.680601, height * 0.9832251, width * 2.677861,
        height * 0.9831239, width * 2.675125, height * 0.9830228);
    path1.cubicTo(width * 2.551385, height * 0.9784245, width * 2.444490,
        height * 0.9659316, width * 2.337615, height * 0.9534402);
    path1.cubicTo(width * 2.324740, height * 0.9519359, width * 2.311865,
        height * 0.9504316, width * 2.298962, height * 0.9489402);
    path1.cubicTo(width * 2.179014, height * 0.9350812, width * 2.056663,
        height * 0.9224373, width * 1.908822, height * 0.9222806);
    path1.cubicTo(width * 1.802567, height * 0.9221724, width * 1.699606,
        height * 0.9267208, width * 1.599986, height * 0.9316182);
    path1.cubicTo(width * 1.588014, height * 0.9322066, width * 1.576096,
        height * 0.9328006, width * 1.564226, height * 0.9333917);
    path1.cubicTo(width * 1.477226, height * 0.9377222, width * 1.392851,
        height * 0.9419217, width * 1.310875, height * 0.9430840);
    path1.cubicTo(width * 1.217755, height * 0.9444031, width * 1.127899,
        height * 0.9417991, width * 1.041111, height * 0.9310242);
    path1.cubicTo(width * 0.9543365, height * 0.9202521, width * 0.8704615,
        height * 0.9012906, width * 0.7894183, height * 0.8698148);
    path1.lineTo(width * 0.7875048, height * 0.8702464);
    path1.lineTo(width * 0.7894183, height * 0.8698148);
    path1.cubicTo(width * 0.7211010, height * 0.8432934, width * 0.6825385,
        height * 0.8114345, width * 0.6452740, height * 0.7790043);
    path1.cubicTo(width * 0.6431538, height * 0.7771581, width * 0.6410337,
        height * 0.7753105, width * 0.6389183, height * 0.7734615);
    path1.cubicTo(width * 0.6038654, height * 0.7428675, width * 0.5685192,
        height * 0.7120157, width * 0.5089904, height * 0.6851111);
    path1.lineTo(width * 0.5089904, height * 0.6851111);
    path1.cubicTo(width * 0.4580587, height * 0.6621239, width * 0.4043692,
        height * 0.6402336, width * 0.3520553, height * 0.6189031);
    path1.cubicTo(width * 0.3254486, height * 0.6080541, width * 0.2991971,
        height * 0.5973504, width * 0.2738457, height * 0.5867208);
    path1.cubicTo(width * 0.1985966, height * 0.5551724, width * 0.1311952,
        height * 0.5242521, width * 0.08546538, height * 0.4920071);
    path1.cubicTo(width * 0.03974981, height * 0.4597707, width * 0.01570702,
        height * 0.4262194, width * 0.02715962, height * 0.3894060);
    path1.cubicTo(width * 0.03861337, height * 0.3525897, width * 0.08558510,
        height * 0.3124587, width * 0.1821524, height * 0.2670769);
    path1.cubicTo(width * 0.2514630, height * 0.2345313, width * 0.3455861,
        height * 0.2125328, width * 0.4406101, height * 0.1918462);
    path1.cubicTo(width * 0.4504697, height * 0.1896994, width * 0.4603404,
        height * 0.1875670, width * 0.4701942, height * 0.1854387);
    path1.cubicTo(width * 0.5552163, height * 0.1670698, width * 0.6390048,
        height * 0.1489687, width * 0.7036971, height * 0.1245333);
    path1.cubicTo(width * 0.7453365, height * 0.1088256, width * 0.7702356,
        height * 0.08729615, width * 0.7954904, height * 0.06535997);
    path1.lineTo(width * 0.7958894, height * 0.06501467);
    path1.cubicTo(width * 0.8210817, height * 0.04313362, width * 0.8467356,
        height * 0.02085085, width * 0.8896346, height * 0.003191140);
    path1.cubicTo(width * 0.9675192, height * -0.02886980, width * 1.034779,
        height * -0.04264601, width * 1.110005, height * -0.05245171);
    path1.cubicTo(width * 1.139591, height * -0.05630826, width * 1.170389,
        height * -0.05954886, width * 1.203644, height * -0.06304772);
    path1.cubicTo(width * 1.212779, height * -0.06400897, width * 1.222101,
        height * -0.06498960, width * 1.231635, height * -0.06600798);
    path1.cubicTo(width * 1.275822, height * -0.07072849, width * 1.324394,
        height * -0.07624302, width * 1.379635, height * -0.08433960);
    path1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color =
        Colours.wavesStrokeColor.withOpacity(Colours.wavesStrokeOpacity);
    canvas.drawPath(path1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class WaveTwo extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    Path path0 = Path();
    path0.moveTo(width * 1.910962, height * -0.1654984);
    path0.cubicTo(width * 1.567063, height * -0.1812812, width * 1.349994,
        height * -0.05069872, width * 1.067142, height * -0.008030990);
    path0.cubicTo(width * 0.9064717, height * 0.01618818, width * 0.8075377,
        height * 0.009674377, width * 0.6853585, height * 0.07336997);
    path0.cubicTo(width * 0.6246541, height * 0.1050209, width * 0.5964969,
        height * 0.1590113, width * 0.5407893, height * 0.1859409);
    path0.cubicTo(width * 0.4271321, height * 0.2408498, width * 0.2487236,
        height * 0.2503355, width * 0.1349802, height * 0.3182284);
    path0.cubicTo(width * -0.1729280, height * 0.5020144, width * 0.1711440,
        height * 0.5880927, width * 0.3891604, height * 0.7067396);
    path0.cubicTo(width * 0.4824969, height * 0.7575399, width * 0.5107390,
        height * 0.8304585, width * 0.6074340, height * 0.8781102);
    path0.cubicTo(width * 0.8523145, height * 0.9987684, width * 1.185365,
        height * 0.9344617, width * 1.479667, height * 0.9270304);
    path0.cubicTo(width * 1.696220, height * 0.9216086, width * 1.866792,
        height * 0.9741565, width * 2.075594, height * 0.9833802);
    path0.cubicTo(width * 2.115890, height * 0.9851725, width * 2.159113,
        height * 0.9872284, width * 2.201305, height * 0.9864409);
    path0.lineTo(width * 2.201305, height * -0.1143505);
    path0.cubicTo(width * 2.177110, height * -0.1214764, width * 2.152484,
        height * -0.1282960, width * 2.127343, height * -0.1346350);
    path0.cubicTo(width * 2.060094, height * -0.1516847, width * 1.988714,
        height * -0.1619585, width * 1.910962, height * -0.1654984);
    path0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color =
        Colours.wavesFillColor.withOpacity(Colours.wavesColorOpacity);
    canvas.drawPath(path0, paint0Fill);

    Path path1 = Path();
    path1.moveTo(width * 0.5418711, height * 0.1865192);
    path1.lineTo(width * 0.5407893, height * 0.1859409);
    path1.lineTo(width * 0.5418711, height * 0.1865192);
    path1.cubicTo(width * 0.5698899, height * 0.1729760, width * 0.5909434,
        height * 0.1526740, width * 0.6124465, height * 0.1319372);
    path1.lineTo(width * 0.6125912, height * 0.1317982);
    path1.cubicTo(width * 0.6342075, height * 0.1109540, width * 0.6563208,
        height * 0.08965463, width * 0.6864843, height * 0.07392732);
    path1.cubicTo(width * 0.7473711, height * 0.04218530, width * 0.8024119,
        height * 0.02795527, width * 0.8622767, height * 0.01862955);
    path1.cubicTo(width * 0.8910031, height * 0.01415450, width * 0.9208396,
        height * 0.01080888, width * 0.9530220, height * 0.007199712);
    path1.lineTo(width * 0.9572264, height * 0.006728115);
    path1.cubicTo(width * 0.9910063, height * 0.002937588, width * 1.027365,
        height * -0.001201684, width * 1.067591, height * -0.007265224);
    path1.lineTo(width * 1.067142, height * -0.008030990);
    path1.lineTo(width * 1.067591, height * -0.007265319);
    path1.cubicTo(width * 1.172085, height * -0.02302796, width * 1.267676,
        height * -0.05078450, width * 1.363796, height * -0.07869489);
    path1.cubicTo(width * 1.397956, height * -0.08861406, width * 1.432182,
        height * -0.09855272, width * 1.466903, height * -0.1079792);
    path1.cubicTo(width * 1.599415, height * -0.1439594, width * 1.739327,
        height * -0.1725735, width * 1.910821, height * -0.1647029);
    path1.cubicTo(width * 1.988384, height * -0.1611709, width * 2.059572,
        height * -0.1509246, width * 2.126642, height * -0.1339204);
    path1.lineTo(width * 2.126645, height * -0.1339196);
    path1.cubicTo(width * 2.151478, height * -0.1276580, width * 2.175814,
        height * -0.1209256, width * 2.199733, height * -0.1138901);
    path1.lineTo(width * 2.199733, height * 0.9856693);
    path1.cubicTo(width * 2.160022, height * 0.9863466, width * 2.119421,
        height * 0.9845351, width * 2.081157, height * 0.9828275);
    path1.cubicTo(width * 2.079343, height * 0.9827460, width * 2.077535,
        height * 0.9826645, width * 2.075730, height * 0.9825847);
    path1.lineTo(width * 2.075594, height * 0.9833802);
    path1.lineTo(width * 2.075730, height * 0.9825847);
    path1.cubicTo(width * 1.985997, height * 0.9786214, width * 1.903343,
        height * 0.9666422, width * 1.820893, height * 0.9546933);
    path1.cubicTo(width * 1.807588, height * 0.9527652, width * 1.794286,
        height * 0.9508371, width * 1.780959, height * 0.9489441);
    path1.cubicTo(width * 1.685123, height * 0.9353275, width * 1.588135,
        height * 0.9235144, width * 1.479591, height * 0.9262316);
    path1.lineTo(width * 1.479667, height * 0.9270304);
    path1.lineTo(width * 1.479588, height * 0.9262316);
    path1.cubicTo(width * 1.411072, height * 0.9279617, width * 1.340465,
        height * 0.9327716, width * 1.269437, height * 0.9376102);
    path1.cubicTo(width * 1.264110, height * 0.9379728, width * 1.258780,
        height * 0.9383355, width * 1.253450, height * 0.9386965);
    path1.cubicTo(width * 1.177006, height * 0.9438866, width * 1.100211,
        height * 0.9488450, width * 1.024978, height * 0.9498051);
    path1.cubicTo(width * 0.8745440, height * 0.9517268, width * 0.7305503,
        height * 0.9376597, width * 0.6085283, height * 0.8775367);
    path1.cubicTo(width * 0.5603931, height * 0.8538163, width * 0.5292642,
        height * 0.8237907, width * 0.4984371, height * 0.7932412);
    path1.cubicTo(width * 0.4973145, height * 0.7921310, width * 0.4961950,
        height * 0.7910192, width * 0.4950723, height * 0.7899058);
    path1.cubicTo(width * 0.4654057, height * 0.7604760, width * 0.4354497,
        height * 0.7307636, width * 0.3903082, height * 0.7061949);
    path1.cubicTo(width * 0.3498742, height * 0.6841901, width * 0.3050953,
        height * 0.6632971, width * 0.2609884, height * 0.6427188);
    path1.cubicTo(width * 0.2455865, height * 0.6355335, width * 0.2302670,
        height * 0.6283850, width * 0.2152434, height * 0.6212428);
    path1.cubicTo(width * 0.1571462, height * 0.5936198, width * 0.1034484,
        height * 0.5660511, width * 0.06617264, height * 0.5364808);
    path1.cubicTo(width * 0.02891833, height * 0.5069265, width * 0.008114025,
        height * 0.4754089, width * 0.01570170, height * 0.4398690);
    path1.cubicTo(width * 0.02329267, height * 0.4043131, width * 0.05932390,
        height * 0.3646182, width * 0.1361777, height * 0.3187460);
    path1.cubicTo(width * 0.1928132, height * 0.2849409, width * 0.2655748,
        height * 0.2656565, width * 0.3385943, height * 0.2479361);
    path1.cubicTo(width * 0.3456101, height * 0.2462332, width * 0.3526289,
        height * 0.2445447, width * 0.3596384, height * 0.2428594);
    path1.cubicTo(width * 0.4254748, height * 0.2270240, width * 0.4903082,
        height * 0.2114313, width * 0.5418711, height * 0.1865192);
    path1.close();

    Paint paint1Stroke = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    paint1Stroke.color =
        Colours.wavesStrokeColor.withOpacity(Colours.wavesStrokeOpacity);
    canvas.drawPath(path1, paint1Stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
