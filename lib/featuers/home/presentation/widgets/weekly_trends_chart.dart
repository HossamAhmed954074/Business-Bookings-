import 'package:flutter/material.dart';

class WeeklyTrendsChart extends StatelessWidget {
  const WeeklyTrendsChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data points for the week
    final dataPoints = <Map<String, dynamic>>[
      {'day': 'Mon', 'value': 150},
      {'day': 'Tue', 'value': 150},
      {'day': 'Wed', 'value': 140},
      {'day': 'Thu', 'value': 185},
      {'day': 'Fri', 'value': 200},
      {'day': 'Sat', 'value': 100},
      {'day': 'Sun', 'value': 80},
    ];

    return Container(
      height: 250,
      padding: const EdgeInsets.all(16),
      child: CustomPaint(
        painter: ChartPainter(dataPoints: dataPoints),
        child: Container(),
      ),
    );
  }
}

class ChartPainter extends CustomPainter {
  ChartPainter({required this.dataPoints});
  final List<Map<String, dynamic>> dataPoints;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3B82F6)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final gridPaint = Paint()
      ..color = const Color(0xFFE5E7EB)
      ..strokeWidth = 0.5;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Calculate dimensions
    final chartWidth = size.width - 60;
    final chartHeight = size.height - 40;
    const maxValue = 200.0;
    final stepX = chartWidth / (dataPoints.length - 1);

    // Draw horizontal grid lines
    for (var i = 0; i <= 4; i++) {
      final y = 20 + (chartHeight / 4 * i);
      canvas.drawLine(Offset(40, y), Offset(size.width - 20, y), gridPaint);

      // Draw Y-axis labels
      final value = maxValue - (maxValue / 4 * i);
      textPainter.text = TextSpan(
        text: value.toInt().toString(),
        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(5, y - textPainter.height / 2));
    }

    // Draw chart line
    final path = Path();
    for (var i = 0; i < dataPoints.length; i++) {
      final x = 40 + (i * stepX);
      final value = dataPoints[i]['value'] as num;
      final y = 20 + chartHeight - (value / maxValue * chartHeight);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw day labels
      textPainter.text = TextSpan(
        text: dataPoints[i]['day'] as String,
        style: const TextStyle(color: Color(0xFF9CA3AF), fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, size.height - 20),
      );
    }

    canvas.drawPath(path, paint);

    // Draw data points
    final pointPaint = Paint()
      ..color = const Color(0xFF3B82F6)
      ..style = PaintingStyle.fill;

    for (var i = 0; i < dataPoints.length; i++) {
      final x = 40 + (i * stepX);
      final value = dataPoints[i]['value'] as num;
      final y = 20 + chartHeight - (value / maxValue * chartHeight);

      canvas.drawCircle(Offset(x, y), 4, pointPaint);
      canvas.drawCircle(
        Offset(x, y),
        6,
        Paint()
          ..color = const Color(0xFF3B82F6).withOpacity(0.2)
          ..style = PaintingStyle.fill,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
