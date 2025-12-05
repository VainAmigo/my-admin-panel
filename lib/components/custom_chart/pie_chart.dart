import 'package:admin_panel/themes/theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(show: false),
            sectionsSpace: 0,
            centerSpaceRadius: 100,
            sections: showingSections(),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final radius = isTouched ? 70.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.primary,
            value: 1,
            radius: radius,
            showTitle: isTouched ? true : false,
            title: '20',
            titleStyle: AppTypography.grey14w500.copyWith(
              color: AppColors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.primary25,
            value: 20,
            radius: radius,
            showTitle: isTouched ? true : false,
            title: '234',
            titleStyle: AppTypography.grey14w500.copyWith(
              color: AppColors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.primary50,
            value: 30,
            radius: radius,
            showTitle: isTouched ? true : false,
            title: '345',
            titleStyle: AppTypography.grey14w500.copyWith(
              color: AppColors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.primary75,
            value: 50,
            radius: radius,
            showTitle: isTouched ? true : false,
            title: '456',
            titleStyle: AppTypography.grey14w500.copyWith(
              color: AppColors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
