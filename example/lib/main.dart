import 'package:ad_utils/ad_utils.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List list = [
    1,
    2,
    3,
    4,
    5,
    6,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AdUtils Homepage")),
      body: AdUtils(
        crossAxisCount: 4,
        itemCount: list.length,
        adUtilsType: AdUtilsType.custom,
        adIndex: 3,
        itemMainAspectRatio: 1 / 1,
        adWidget: Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          color: Colors.blue,
          child: const Center(
              child: Text(
            "Native Ad",
            style: TextStyle(fontSize: 60),
          )),
        ),
        itemWidget: (context, index) {
          return Container(
            height: 150,
            width: 160,
            margin: const EdgeInsets.all(5),
            color: Colors.blueGrey.shade100,
            child: Center(
              child: Text(
                "${list[index]}",
                style: const TextStyle(fontSize: 30),
              ),
            ),
          );
        },
      ),
    );
  }
}
