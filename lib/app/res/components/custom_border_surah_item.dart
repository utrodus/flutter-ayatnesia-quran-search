import 'package:flutter/material.dart';
//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size = Size(100, (100*1).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter = RPSCustomPainter(),
// )

//Copy this CustomPainter code to the Bottom of the File
class CustomBorderSurahItem extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8632806, size.height * 0.3506083);
    path_0.lineTo(size.width * 0.8632806, size.height * 0.1660156);
    path_0.cubicTo(
        size.width * 0.8632806,
        size.height * 0.1498358,
        size.width * 0.8501639,
        size.height * 0.1367189,
        size.width * 0.8339833,
        size.height * 0.1367189);
    path_0.lineTo(size.width * 0.6493917, size.height * 0.1367189);
    path_0.lineTo(size.width * 0.5206722, size.height * 0.008537111);
    path_0.cubicTo(
        size.width * 0.5092389,
        size.height * -0.002845694,
        size.width * 0.4907583,
        size.height * -0.002845694,
        size.width * 0.4793250,
        size.height * 0.008537111);
    path_0.lineTo(size.width * 0.3506083, size.height * 0.1367189);
    path_0.lineTo(size.width * 0.1660156, size.height * 0.1367189);
    path_0.cubicTo(
        size.width * 0.1498358,
        size.height * 0.1367189,
        size.width * 0.1367186,
        size.height * 0.1498358,
        size.width * 0.1367186,
        size.height * 0.1660156);
    path_0.lineTo(size.width * 0.1367186, size.height * 0.3506083);
    path_0.lineTo(size.width * 0.008537111, size.height * 0.4793278);
    path_0.cubicTo(
        size.width * -0.002845722,
        size.height * 0.4907611,
        size.width * -0.002845722,
        size.height * 0.5092417,
        size.width * 0.008537111,
        size.height * 0.5206750);
    path_0.lineTo(size.width * 0.1367186, size.height * 0.6493917);
    path_0.lineTo(size.width * 0.1367186, size.height * 0.8339833);
    path_0.cubicTo(
        size.width * 0.1367186,
        size.height * 0.8501639,
        size.width * 0.1498358,
        size.height * 0.8632806,
        size.width * 0.1660156,
        size.height * 0.8632806);
    path_0.lineTo(size.width * 0.3506083, size.height * 0.8632806);
    path_0.lineTo(size.width * 0.4793250, size.height * 0.9914639);
    path_0.cubicTo(
        size.width * 0.4850417,
        size.height * 0.9971556,
        size.width * 0.4925222,
        size.height,
        size.width * 0.5000000,
        size.height);
    path_0.cubicTo(
        size.width * 0.5074778,
        size.height,
        size.width * 0.5149583,
        size.height * 0.9971556,
        size.width * 0.5206722,
        size.height * 0.9914639);
    path_0.lineTo(size.width * 0.6493917, size.height * 0.8632806);
    path_0.lineTo(size.width * 0.8339833, size.height * 0.8632806);
    path_0.cubicTo(
        size.width * 0.8501639,
        size.height * 0.8632806,
        size.width * 0.8632806,
        size.height * 0.8501639,
        size.width * 0.8632806,
        size.height * 0.8339833);
    path_0.lineTo(size.width * 0.8632806, size.height * 0.6493917);
    path_0.lineTo(size.width * 0.9914639, size.height * 0.5206750);
    path_0.cubicTo(
        size.width * 1.002844,
        size.height * 0.5092417,
        size.width * 1.002844,
        size.height * 0.4907611,
        size.width * 0.9914639,
        size.height * 0.4793278);
    path_0.lineTo(size.width * 0.8632806, size.height * 0.3506083);
    path_0.close();
    path_0.moveTo(size.width * 0.8132250, size.height * 0.6166194);
    path_0.cubicTo(
        size.width * 0.8077583,
        size.height * 0.6221111,
        size.width * 0.8046861,
        size.height * 0.6295417,
        size.width * 0.8046861,
        size.height * 0.6372917);
    path_0.lineTo(size.width * 0.8046861, size.height * 0.8046889);
    path_0.lineTo(size.width * 0.6372917, size.height * 0.8046889);
    path_0.cubicTo(
        size.width * 0.6295444,
        size.height * 0.8046889,
        size.width * 0.6221111,
        size.height * 0.8077583,
        size.width * 0.6166222,
        size.height * 0.8132250);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.9293583);
    path_0.lineTo(size.width * 0.3833806, size.height * 0.8132250);
    path_0.cubicTo(
        size.width * 0.3778889,
        size.height * 0.8077583,
        size.width * 0.3704583,
        size.height * 0.8046889,
        size.width * 0.3627083,
        size.height * 0.8046889);
    path_0.lineTo(size.width * 0.1953125, size.height * 0.8046889);
    path_0.lineTo(size.width * 0.1953125, size.height * 0.6372917);
    path_0.cubicTo(
        size.width * 0.1953125,
        size.height * 0.6295444,
        size.width * 0.1922422,
        size.height * 0.6221111,
        size.width * 0.1867753,
        size.height * 0.6166222);
    path_0.lineTo(size.width * 0.07064250, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.1867753, size.height * 0.3833806);
    path_0.cubicTo(
        size.width * 0.1922422,
        size.height * 0.3778889,
        size.width * 0.1953125,
        size.height * 0.3704583,
        size.width * 0.1953125,
        size.height * 0.3627083);
    path_0.lineTo(size.width * 0.1953125, size.height * 0.1953125);
    path_0.lineTo(size.width * 0.3627083, size.height * 0.1953125);
    path_0.cubicTo(
        size.width * 0.3704556,
        size.height * 0.1953125,
        size.width * 0.3778889,
        size.height * 0.1922422,
        size.width * 0.3833778,
        size.height * 0.1867753);
    path_0.lineTo(size.width * 0.5000000, size.height * 0.07064250);
    path_0.lineTo(size.width * 0.6166222, size.height * 0.1867753);
    path_0.cubicTo(
        size.width * 0.6221139,
        size.height * 0.1922422,
        size.width * 0.6295444,
        size.height * 0.1953125,
        size.width * 0.6372917,
        size.height * 0.1953125);
    path_0.lineTo(size.width * 0.8046861, size.height * 0.1953125);
    path_0.lineTo(size.width * 0.8046861, size.height * 0.3627083);
    path_0.cubicTo(
        size.width * 0.8046861,
        size.height * 0.3704556,
        size.width * 0.8077583,
        size.height * 0.3778889,
        size.width * 0.8132250,
        size.height * 0.3833778);
    path_0.lineTo(size.width * 0.9293583, size.height * 0.5000000);
    path_0.lineTo(size.width * 0.8132250, size.height * 0.6166194);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = const Color(0xff16A885).withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
