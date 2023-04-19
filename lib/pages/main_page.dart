import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/main_bloc/main_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedSegmentIndex = -1;
  final GlobalKey _chartKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page with pie chart'),
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is MainLoaded) {
            return Center(
              child: PieChart(
                PieChartData(
                    pieTouchData: PieTouchData(
                      enabled: true,
                      touchCallback: (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            selectedSegmentIndex = -1;
                            return;
                          }
                          selectedSegmentIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                          BlocProvider.of<MainBloc>(context).add(ChooseCompany(
                              state.companies[selectedSegmentIndex]));
                          Navigator.pushNamed(context, '/details');
                        });
                      },
                    ),
                    sections: state.companies
                        .map((e) => PieChartSectionData(
                            value: e.marketCapitalization.toDouble(),
                            showTitle: true,
                            title: e.symbol))
                        .toList()),
                key: _chartKey,
              ),
            );
          } else {
            return const Center(
              child: Text('Ошибка'),
            );
          }
        },
      ),
    );
  }
}
