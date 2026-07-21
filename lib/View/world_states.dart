import 'package:covid_tracker/Model/world_states_model.dart';
import 'package:covid_tracker/Services/States_Services.dart';
import 'package:covid_tracker/Services/Utilities/resuseable_row.dart';
import 'package:covid_tracker/View/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStateScreen extends StatefulWidget {
  const WorldStateScreen({Key? key}) : super(key: key);

  @override
  State<WorldStateScreen> createState() => _WorldStateScreenState();
}

class _WorldStateScreenState extends State<WorldStateScreen>
    with TickerProviderStateMixin {
  late final _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285f4), //
    const Color(0xff1aa260), //
    const Color(0xffde5246), //
  ];

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: FutureBuilder<WorldStatesModel>(
            future: statesServices.fetchWorldStatesRecords(),
            builder: (context, snapshot) {
              // Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 50.0,
                    controller: _controller,
                  ),
                );
              }

              // Error
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    "Error: ${snapshot.error}",
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }

              // Data Loaded
              final data = snapshot.data!;

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .02,
                    ),
                    PieChart(
                      dataMap: {
                        "Total": data.cases!.toDouble(),
                        "Recovered": data.recovered!.toDouble(),
                        "Deaths": data.deaths!.toDouble(),
                      },
                      chartRadius: MediaQuery.of(context).size.width / 3.2,
                      chartType: ChartType.ring,
                      animationDuration: const Duration(milliseconds: 1200),
                      colorList: colorList,
                      legendOptions: const LegendOptions(
                        legendPosition: LegendPosition.left,
                      ),
                      chartValuesOptions: const ChartValuesOptions(
                        showChartValuesInPercentage: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .06,
                      ),
                      child: Card(
                        child: Column(
                          children: [
                            ReuseAbleRow(
                              title: "Total",
                              value: data.cases.toString(),
                            ),
                            ReuseAbleRow(
                              title: "Recovered",
                              value: data.recovered.toString(),
                            ),
                            ReuseAbleRow(
                              title: "Deaths",
                              value: data.deaths.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CountriesListScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Text(
                            'Track Countries',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
