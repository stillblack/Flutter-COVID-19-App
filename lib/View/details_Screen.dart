import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String name;
  String image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  DetailsScreen(
      {Key? key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test})
      : super(key: key);
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Stack(children: [
            Card(
                child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
                ListTile(
                  title: const Text('Total Cases'),
                  subtitle: Text(widget.totalCases.toString()),
                ),
                ListTile(
                  title: const Text('Total Deaths'),
                  subtitle: Text(widget.totalDeaths.toString()),
                ),
                ListTile(
                  title: const Text('Total Recovered'),
                  subtitle: Text(widget.totalRecovered.toString()),
                ),
                ListTile(
                  title: const Text('Active'),
                  subtitle: Text(widget.active.toString()),
                ),
                ListTile(
                  title: const Text('Critical'),
                  subtitle: Text(widget.critical.toString()),
                ),
                ListTile(
                  title: const Text('Today Recovered'),
                  subtitle: Text(widget.todayRecovered.toString()),
                ),
                ListTile(
                  title: const Text('Tests'),
                  subtitle: Text(widget.test.toString()),
                ),
              ],
            ))
          ])
        ],
      ),
    );
  }
}
