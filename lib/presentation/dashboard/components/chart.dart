import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../presentation/resources/color_manager.dart';
import '../../../presentation/resources/constants_manager.dart';

class Chart extends StatelessWidget {
  const Chart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: paiChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: defaultPadding),
                Text(
                  "29.1",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                const Text("of 128GB")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: ColorManager.primaryColor,
    value: 25,
    showTitle: false,
    radius: 25,
  ),
  PieChartSectionData(
    color: ColorManager.cyan,
    value: 20,
    showTitle: false,
    radius: 22,
  ),
  PieChartSectionData(
    color:ColorManager.yellow,
    value: 10,
    showTitle: false,
    radius: 19,
  ),
  PieChartSectionData(
    color: ColorManager.red,
    value: 15,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: ColorManager.primaryColor.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
