import '../../../../export.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardChart extends StatelessWidget {
  const DashboardChart({
    super.key,
    required this.data,
    required this.lineColor,
  });

  final List<(DateTime, double)> data;
  final Color lineColor;

  @override
  Widget build(BuildContext context) {
    final spots = data.asMap().entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.$2);
    }).toList();

    final yValues = data.map((e) => e.$2).toList();
    final minYValue = yValues.reduce((a, b) => a < b ? a : b);
    final maxYValue = yValues.reduce((a, b) => a > b ? a : b);

    final minY = (minYValue ~/ 5) * 5 - 5;
    final maxY = ((maxYValue / 5).ceil() * 5) + 5;

    return LineChart(
      LineChartData(
        minX: 0,
        maxX: (data.length - 1).toDouble(),
        minY: minY.toDouble(),
        maxY: maxY.toDouble(),
        lineBarsData: [
          /// Grafikteki veri çizgisi ve altındaki gradient renk
          LineChartBarData(
            spots: spots,
            dotData: const FlDotData(show: false),
            color: lineColor,
            barWidth: 1,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  lineColor.withValues(alpha: 0.2),
                  lineColor.withValues(alpha: 0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],

        /// Dokunma (touch nokta) ve tooltip ayarları
        lineTouchData: LineTouchData(
          /// Dokunulan noktada aşağı doğru inen çizgi (touch line)
          /// çizgi grafiğin en altından başlar çizgi grafiğin en üstüne kadar gider
          getTouchLineStart: (_, __) => 0,
          getTouchLineEnd: (_, __) => maxY.toDouble(),
          getTouchedSpotIndicator: (barData, spotIndexes) {
            // Dokunulan noktadaki dairenin görünümü
            return spotIndexes.map((spotIndex) {
              return TouchedSpotIndicatorData(
                /// dokunduğunda dikey noktalı çizgiler
                FlLine(
                  color: lineColor.withValues(alpha: 0.7),
                  strokeWidth: 2,
                  dashArray: [5, 5],
                ),
                FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    /// nokta özellikleri
                    return FlDotCirclePainter(
                      radius: 6,
                      color: Color(0xff4880FF),
                    );
                  },
                ),
              );
            }).toList();
          },

          // Tooltip tasarımı
          touchTooltipData: LineTouchTooltipData(
            tooltipBorderRadius: BorderRadius.circular(4),
            tooltipPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 4,
            ),
            tooltipMargin: 16,
            getTooltipColor: (spot) => Color(0xff4880FF),
            tooltipBorder: BorderSide(color: Color(0xff4880FF), width: 1),
            getTooltipItems: (touchedSpots) {
              return touchedSpots.map((barSpot) {
                final price = barSpot.y;

                /// final date = data[barSpot.x.toInt()].$1;
                return LineTooltipItem(
                  price.toStringAsFixed(2),
                  const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                );
              }).toList();
            },
          ),
        ),

        /// X eksini değerleri
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 32,
              interval: 1,
              getTitlesWidget: (value, meta) {
                final intIndex = value.toInt();
                if (intIndex < 0 || intIndex >= data.length) {
                  return const SizedBox();
                }
                final date = data[intIndex].$1;
                return SideTitleWidget(
                  meta: meta,
                  child: Text(
                    '${date.month}/${date.day}',
                    style: const TextStyle(fontSize: 12, color: Colors.black87),
                  ),
                );
              },
            ),
          ),

          /// Y ekseni değerleri
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: 5,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                );
              },
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),

        /// yatay çizgiler
        gridData: FlGridData(
          show: true,
          drawHorizontalLine: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            if (value % 5 == 0) {
              return FlLine(color: Colors.grey.shade300, strokeWidth: 1);
            }
            return FlLine(strokeWidth: 0);
          },
        ),
        borderData: FlBorderData(show: false),
      ),
    );
  }
}
