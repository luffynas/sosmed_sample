import 'package:flutter/material.dart';

class HeaderBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width, size.height * 0.004187770);
    path_0.lineTo(0, size.height * 0.004187770);
    path_0.lineTo(0, size.height * 0.9393876);
    path_0.cubicTo(
        size.width * 0.2157778,
        size.height * 0.9765837,
        size.width * 0.4241389,
        size.height * 1.002675,
        size.width * 0.6033056,
        size.height * 0.9971005);
    path_0.cubicTo(
        size.width * 0.7240833,
        size.height * 0.9933349,
        size.width * 0.8590556,
        size.height * 0.9749617,
        size.width,
        size.height * 0.9486555);
    path_0.lineTo(size.width, size.height * 0.004187770);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffDDEEFF).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width, size.height * 0.004187770);
    path_1.lineTo(0, size.height * 0.004187770);
    path_1.lineTo(0, size.height * 0.9393876);
    path_1.cubicTo(
        size.width * 0.2157778,
        size.height * 0.9765837,
        size.width * 0.4241389,
        size.height * 1.002675,
        size.width * 0.6033056,
        size.height * 0.9971005);
    path_1.cubicTo(
        size.width * 0.7240833,
        size.height * 0.9933349,
        size.width * 0.8590556,
        size.height * 0.9749617,
        size.width,
        size.height * 0.9486555);
    path_1.lineTo(size.width, size.height * 0.004187770);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xffE9F4FF).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.06935250, size.height * 0.6146411);
    path_2.cubicTo(
        size.width * 0.1349689,
        size.height * 0.7047321,
        size.width * 0.1974950,
        size.height * 0.8008517,
        size.width * 0.2686208,
        size.height * 0.8801053);
    path_2.cubicTo(
        size.width * 0.3033333,
        size.height * 0.9187943,
        size.width * 0.3399250,
        size.height * 0.9528947,
        size.width * 0.3791167,
        size.height * 0.9785215);
    path_2.cubicTo(
        size.width * 0.4161583,
        size.height * 1.002713,
        size.width * 0.4548111,
        size.height * 1.015278,
        size.width * 0.4946722,
        size.height * 1.020014);
    path_2.cubicTo(
        size.width * 0.5001389,
        size.height * 1.020660,
        size.width * 0.5056472,
        size.height * 1.020732,
        size.width * 0.5111111,
        size.height * 1.021737);
    path_2.lineTo(size.width * -0.08888889, size.height * 1.021737);
    path_2.lineTo(size.width * -0.08888889, size.height * 0.4293603);
    path_2.cubicTo(
        size.width * -0.06344833,
        size.height * 0.4526909,
        size.width * -0.03926222,
        size.height * 0.4791100,
        size.width * -0.01597161,
        size.height * 0.5059569);
    path_2.cubicTo(
        size.width * 0.01354467,
        size.height * 0.5399809,
        size.width * 0.04176194,
        size.height * 0.5768086,
        size.width * 0.06935250,
        size.height * 0.6146411);
    path_2.close();
    path_2.moveTo(size.width * -0.06564306, size.height * 0.6526842);
    path_2.cubicTo(
        size.width * -0.06277667,
        size.height * 0.6574258,
        size.width * -0.05959667,
        size.height * 0.6617321,
        size.width * -0.05646139,
        size.height * 0.6659665);
    path_2.cubicTo(
        size.width * -0.05337083,
        size.height * 0.6701292,
        size.width * -0.04992194,
        size.height * 0.6760144,
        size.width * -0.04615972,
        size.height * 0.6784545);
    path_2.cubicTo(
        size.width * -0.04105389,
        size.height * 0.6818325,
        size.width * -0.03487278,
        size.height * 0.6728565,
        size.width * -0.03850083,
        size.height * 0.6646746);
    path_2.cubicTo(
        size.width * -0.04105361,
        size.height * 0.6590048,
        size.width * -0.04526389,
        size.height * 0.6549091,
        size.width * -0.04871278,
        size.height * 0.6507464);
    path_2.cubicTo(
        size.width * -0.05225111,
        size.height * 0.6464402,
        size.width * -0.05587917,
        size.height * 0.6422057,
        size.width * -0.05968611,
        size.height * 0.6385455);
    path_2.cubicTo(
        size.width * -0.06201528,
        size.height * 0.6363206,
        size.width * -0.06506083,
        size.height * 0.6382584,
        size.width * -0.06649417,
        size.height * 0.6414880);
    path_2.cubicTo(
        size.width * -0.06806167,
        size.height * 0.6451483,
        size.width * -0.06747944,
        size.height * 0.6495981,
        size.width * -0.06564306,
        size.height * 0.6526842);
    path_2.close();
    path_2.moveTo(size.width * 0.1429414, size.height * 0.8179378);
    path_2.cubicTo(
        size.width * 0.1385072,
        size.height * 0.8093923,
        size.width * 0.1329533,
        size.height * 0.8027177,
        size.width * 0.1273100,
        size.height * 0.7964019);
    path_2.cubicTo(
        size.width * 0.1253392,
        size.height * 0.7941770,
        size.width * 0.1231444,
        size.height * 0.7938182,
        size.width * 0.1212186,
        size.height * 0.7963301);
    path_2.cubicTo(
        size.width * 0.1195614,
        size.height * 0.7984833,
        size.width * 0.1189344,
        size.height * 0.8030766,
        size.width * 0.1203228,
        size.height * 0.8059474);
    path_2.cubicTo(
        size.width * 0.1243986,
        size.height * 0.8144211,
        size.width * 0.1287433,
        size.height * 0.8235359,
        size.width * 0.1341181,
        size.height * 0.8299952);
    path_2.cubicTo(
        size.width * 0.1364917,
        size.height * 0.8328660,
        size.width * 0.1394481,
        size.height * 0.8331531,
        size.width * 0.1417769,
        size.height * 0.8300670);
    path_2.cubicTo(
        size.width * 0.1437925,
        size.height * 0.8274833,
        size.width * 0.1447778,
        size.height * 0.8215263,
        size.width * 0.1429414,
        size.height * 0.8179378);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xff269BF0).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(size.width * 0.6538250, size.height * -0.02609900);
    path_3.lineTo(size.width * 0.6444444, size.height * -0.01703593);
    path_3.cubicTo(
        size.width * 0.6497917,
        size.height * -0.009578134,
        size.width * 0.6540472,
        size.height * 0.0007389952,
        size.width * 0.6568694,
        size.height * 0.01204273);
    path_3.cubicTo(
        size.width * 0.6631639,
        size.height * 0.03729215,
        size.width * 0.6602861,
        size.height * 0.06453158,
        size.width * 0.6574444,
        size.height * 0.09060048);
    path_3.cubicTo(
        size.width * 0.6524667,
        size.height * 0.1360995,
        size.width * 0.6504361,
        size.height * 0.1745589,
        size.width * 0.6639639,
        size.height * 0.2166804);
    path_3.cubicTo(
        size.width * 0.6728167,
        size.height * 0.2442708,
        size.width * 0.6848111,
        size.height * 0.2704900,
        size.width * 0.7023222,
        size.height * 0.2825459);
    path_3.cubicTo(
        size.width * 0.7234333,
        size.height * 0.2971440,
        size.width * 0.7481750,
        size.height * 0.2918598,
        size.width * 0.7697250,
        size.height * 0.2834990);
    path_3.cubicTo(
        size.width * 0.7971694,
        size.height * 0.2729311,
        size.width * 0.8243806,
        size.height * 0.2369134,
        size.width * 0.8530639,
        size.height * 0.2426488);
    path_3.cubicTo(
        size.width * 0.8800306,
        size.height * 0.2480330,
        size.width * 0.9047139,
        size.height * 0.2825627,
        size.width * 0.9156861,
        size.height * 0.3241493);
    path_3.cubicTo(
        size.width * 0.9226333,
        size.height * 0.3505689,
        size.width * 0.9268694,
        size.height * 0.3786780,
        size.width * 0.9300139,
        size.height * 0.4070541);
    path_3.cubicTo(
        size.width * 0.9321111,
        size.height * 0.4260833,
        size.width * 0.9327833,
        size.height * 0.4461325,
        size.width * 0.9372556,
        size.height * 0.4640746);
    path_3.cubicTo(
        size.width * 0.9444083,
        size.height * 0.4927703,
        size.width * 0.9593222,
        size.height * 0.5110287,
        size.width * 0.9771333,
        size.height * 0.5158421);
    path_3.cubicTo(
        size.width * 0.9955806,
        size.height * 0.5207943,
        size.width * 1.014778,
        size.height * 0.5128995,
        size.width * 1.031292,
        size.height * 0.4987368);
    path_3.cubicTo(
        size.width * 1.045961,
        size.height * 0.4862153,
        size.width * 1.058494,
        size.height * 0.4669507,
        size.width * 1.075553,
        size.height * 0.4650780);
    path_3.cubicTo(
        size.width * 1.076822,
        size.height * 0.4649105,
        size.width * 1.078208,
        size.height * 0.4648435,
        size.width * 1.079664,
        size.height * 0.4647766);
    path_3.lineTo(size.width * 1.074050, size.height * 0.4477545);
    path_3.cubicTo(
        size.width * 1.073172,
        size.height * 0.4479383,
        size.width * 1.072322,
        size.height * 0.4480885,
        size.width * 1.071483,
        size.height * 0.4482392);
    path_3.cubicTo(
        size.width * 1.041383,
        size.height * 0.4543091,
        size.width * 1.020831,
        size.height * 0.4997751,
        size.width * 0.9888944,
        size.height * 0.4997895);
    path_3.cubicTo(
        size.width * 0.9738056,
        size.height * 0.4998086,
        size.width * 0.9587861,
        size.height * 0.4912967,
        size.width * 0.9501583,
        size.height * 0.4687732);
    path_3.cubicTo(
        size.width * 0.9422222,
        size.height * 0.4481220,
        size.width * 0.9420278,
        size.height * 0.4212507,
        size.width * 0.9393056,
        size.height * 0.3977402);
    path_3.cubicTo(
        size.width * 0.9342472,
        size.height * 0.3539804,
        size.width * 0.9266556,
        size.height * 0.3062072,
        size.width * 0.9079833,
        size.height * 0.2734665);
    path_3.cubicTo(
        size.width * 0.8934722,
        size.height * 0.2481335,
        size.width * 0.8727306,
        size.height * 0.2273153,
        size.width * 0.8517278,
        size.height * 0.2247732);
    path_3.cubicTo(
        size.width * 0.8237056,
        size.height * 0.2214124,
        size.width * 0.7991111,
        size.height * 0.2528153,
        size.width * 0.7728861,
        size.height * 0.2642694);
    path_3.cubicTo(
        size.width * 0.7430500,
        size.height * 0.2772957,
        size.width * 0.7072111,
        size.height * 0.2838167,
        size.width * 0.6851833,
        size.height * 0.2395718);
    path_3.cubicTo(
        size.width * 0.6755000,
        size.height * 0.2201416,
        size.width * 0.6672444,
        size.height * 0.1951766,
        size.width * 0.6641806,
        size.height * 0.1701445);
    path_3.cubicTo(
        size.width * 0.6607333,
        size.height * 0.1418014,
        size.width * 0.6653806,
        size.height * 0.1141273,
        size.width * 0.6682389,
        size.height * 0.08635311);
    path_3.cubicTo(
        size.width * 0.6718889,
        size.height * 0.05102057,
        size.width * 0.6726028,
        size.height * 0.01637364,
        size.width * 0.6598556,
        size.height * -0.01399258);
    path_3.cubicTo(
        size.width * 0.6580306,
        size.height * -0.01840708,
        size.width * 0.6560000,
        size.height * -0.02245368,
        size.width * 0.6538250,
        size.height * -0.02609900);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(size.width * 0.6758806, size.height * -0.04745459);
    path_4.lineTo(size.width * 0.6666583, size.height * -0.03852531);
    path_4.cubicTo(
        size.width * 0.6819333,
        size.height * -0.01053359,
        size.width * 0.6875056,
        size.height * 0.03620301,
        size.width * 0.6873972,
        size.height * 0.07091675);
    path_4.cubicTo(
        size.width * 0.6873000,
        size.height * 0.1083727,
        size.width * 0.6798444,
        size.height * 0.1487220,
        size.width * 0.6896528,
        size.height * 0.1844053);
    path_4.cubicTo(
        size.width * 0.7082944,
        size.height * 0.2524450,
        size.width * 0.7535806,
        size.height * 0.2286837,
        size.width * 0.7843444,
        size.height * 0.2055411);
    path_4.cubicTo(
        size.width * 0.8119472,
        size.height * 0.1847900,
        size.width * 0.8383667,
        size.height * 0.1765464,
        size.width * 0.8677333,
        size.height * 0.1921641);
    path_4.cubicTo(
        size.width * 0.8917444,
        size.height * 0.2050230,
        size.width * 0.9099083,
        size.height * 0.2356402,
        size.width * 0.9231139,
        size.height * 0.2713072);
    path_4.cubicTo(
        size.width * 0.9354000,
        size.height * 0.3044656,
        size.width * 0.9437944,
        size.height * 0.3409187,
        size.width * 0.9517972,
        size.height * 0.3775383);
    path_4.cubicTo(
        size.width * 0.9580139,
        size.height * 0.4058646,
        size.width * 0.9651972,
        size.height * 0.4366823,
        size.width * 0.9828917,
        size.height * 0.4487053);
    path_4.cubicTo(
        size.width * 1.001094,
        size.height * 0.4610957,
        size.width * 1.018303,
        size.height * 0.4472670,
        size.width * 1.034778,
        size.height * 0.4340737);
    path_4.cubicTo(
        size.width * 1.044186,
        size.height * 0.4265158,
        size.width * 1.053439,
        size.height * 0.4192254,
        size.width * 1.063317,
        size.height * 0.4150947);
    path_4.lineTo(size.width * 1.058239, size.height * 0.3996943);
    path_4.cubicTo(
        size.width * 1.034142,
        size.height * 0.4134397,
        size.width * 1.006814,
        size.height * 0.4508957,
        size.width * 0.9839083,
        size.height * 0.4304952);
    path_4.cubicTo(
        size.width * 0.9631389,
        size.height * 0.4119679,
        size.width * 0.9581222,
        size.height * 0.3541282,
        size.width * 0.9493583,
        size.height * 0.3198493);
    path_4.cubicTo(
        size.width * 0.9407972,
        size.height * 0.2862895,
        size.width * 0.9303556,
        size.height * 0.2535656,
        size.width * 0.9159500,
        size.height * 0.2262761);
    path_4.cubicTo(
        size.width * 0.8868056,
        size.height * 0.1712120,
        size.width * 0.8408250,
        size.height * 0.1530024,
        size.width * 0.8001944,
        size.height * 0.1765967);
    path_4.cubicTo(
        size.width * 0.7774333,
        size.height * 0.1897900,
        size.width * 0.7549667,
        size.height * 0.2166612,
        size.width * 0.7300194,
        size.height * 0.2127986);
    path_4.cubicTo(
        size.width * 0.6924056,
        size.height * 0.2069459,
        size.width * 0.6942889,
        size.height * 0.1427187,
        size.width * 0.6967694,
        size.height * 0.09461100);
    path_4.cubicTo(
        size.width * 0.6990722,
        size.height * 0.05001483,
        size.width * 0.6943972,
        size.height * -0.01055029,
        size.width * 0.6758806,
        size.height * -0.04745459);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(size.width * 0.6965944, size.height * -0.06747033);
    path_5.lineTo(size.width * 0.6875167, size.height * -0.05869187);
    path_5.cubicTo(
        size.width * 0.6931083,
        size.height * -0.05013014,
        size.width * 0.6981639,
        size.height * -0.04058230,
        size.width * 0.7022444,
        size.height * -0.02949593);
    path_5.cubicTo(
        size.width * 0.7123361,
        size.height * -0.002173057,
        size.width * 0.7132722,
        size.height * 0.02765809,
        size.width * 0.7145028,
        size.height * 0.05894402);
    path_5.cubicTo(
        size.width * 0.7158583,
        size.height * 0.09277129,
        size.width * 0.7188167,
        size.height * 0.1332206,
        size.width * 0.7378972,
        size.height * 0.1517148);
    path_5.cubicTo(
        size.width * 0.7707306,
        size.height * 0.1836359,
        size.width * 0.8113806,
        size.height * 0.1252110,
        size.width * 0.8453556,
        size.height * 0.1272177);
    path_5.cubicTo(
        size.width * 0.8742167,
        size.height * 0.1289737,
        size.width * 0.9018472,
        size.height * 0.1536378,
        size.width * 0.9219611,
        size.height * 0.1883014);
    path_5.cubicTo(
        size.width * 0.9438056,
        size.height * 0.2260416,
        size.width * 0.9524028,
        size.height * 0.2765407,
        size.width * 0.9670528,
        size.height * 0.3220397);
    path_5.cubicTo(
        size.width * 0.9760722,
        size.height * 0.3499981,
        size.width * 0.9874500,
        size.height * 0.3822871,
        size.width * 1.007772,
        size.height * 0.3867684);
    path_5.cubicTo(
        size.width * 1.019572,
        size.height * 0.3893268,
        size.width * 1.029869,
        size.height * 0.3808995,
        size.width * 1.039931,
        size.height * 0.3715689);
    path_5.cubicTo(
        size.width * 1.042283,
        size.height * 0.3693612,
        size.width * 1.044558,
        size.height * 0.3671541,
        size.width * 1.046822,
        size.height * 0.3650306);
    path_5.lineTo(size.width * 1.041844, size.height * 0.3499311);
    path_5.cubicTo(
        size.width * 1.035489,
        size.height * 0.3562182,
        size.width * 1.029253,
        size.height * 0.3631077,
        size.width * 1.022128,
        size.height * 0.3669201);
    path_5.cubicTo(
        size.width * 0.9893167,
        size.height * 0.3846282,
        size.width * 0.9730167,
        size.height * 0.3053684,
        size.width * 0.9625333,
        size.height * 0.2664574);
    path_5.cubicTo(
        size.width * 0.9416861,
        size.height * 0.1891206,
        size.width * 0.9080639,
        size.height * 0.1235392,
        size.width * 0.8561389,
        size.height * 0.1114325);
    path_5.cubicTo(
        size.width * 0.8364444,
        size.height * 0.1068344,
        size.width * 0.8186528,
        size.height * 0.1136732,
        size.width * 0.8002333,
        size.height * 0.1248766);
    path_5.cubicTo(
        size.width * 0.7822556,
        size.height * 0.1357789,
        size.width * 0.7555722,
        size.height * 0.1562464,
        size.width * 0.7386778,
        size.height * 0.1313646);
    path_5.cubicTo(
        size.width * 0.7170611,
        size.height * 0.09961053,
        size.width * 0.7274944,
        size.height * 0.03218962,
        size.width * 0.7189056,
        size.height * -0.01008230);
    path_5.cubicTo(
        size.width * 0.7142389,
        size.height * -0.03295727,
        size.width * 0.7063056,
        size.height * -0.05160191,
        size.width * 0.6965944,
        size.height * -0.06747033);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Colors.white.withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
