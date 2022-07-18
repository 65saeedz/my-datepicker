import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String todayString;
  late final DateTime now;
  DateTime? newDate;

  final DateFormat formatter = DateFormat('yyyy/MM/dd');
  @override
  void initState() {
    now = DateTime.now();
    final String formatted = formatter.format(now);
    // print(formatted); // something like 2013-04-20
    todayString = formatted;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Container(
          height: 500,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 100),
          child: ListView(
            children: [
              Text(
                todayString,
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                  onPressed: () async {
                    DateTime? newDate2 = await showDatePicker(
                        context: context,
                        initialDate: now,
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2025));
                    if (newDate2 == null) {
                      //   print('yes');
                      return;
                    }
                    setState(() {
                      newDate = newDate2;
                    });
                  },
                  icon: const Icon(Icons.date_range_rounded),
                  label: const Text('date')),
              if (newDate != null)
                Text(
                  formatter.format(newDate!),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
