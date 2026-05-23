import 'package:flutter/material.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              PieChart(
                dataMap: const {
                  "Total": 20,
                  "Recoverd": 15,
                  "Deaths": 5,
                },
                chartRadius: MediaQuery.of(context).size.width / 3.2,
                legendOptions:
                    const LegendOptions(legendPosition: LegendPosition.left),
                animationDuration: const Duration(milliseconds: 1200),
                chartType: ChartType.ring,
                colorList: colorList,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.06),
                child: const Card(
                  child: Column(
                    children: [
                      ReuseAbleRow(title: "Total", value: '200'),
                      ReuseAbleRow(title: "Recoverd", value: "15"),
                      ReuseAbleRow(title: "Deaths", value: "5")
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child:
                    const Center(child: Center(child: Text('Track Countries'))),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseAbleRow extends StatefulWidget {
  final String title, value;
  const ReuseAbleRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  State<ReuseAbleRow> createState() => _ReuseAbleRowState();
}

class _ReuseAbleRowState extends State<ReuseAbleRow> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title),
          Text(widget.value),
        ],
      ),
      const SizedBox(height: 5),
      const Divider(),
    ]);
  }
}
