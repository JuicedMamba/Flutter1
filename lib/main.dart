import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController englishMarksController = TextEditingController();
  TextEditingController physicsMarksController = TextEditingController();
  String englishMarksResult = "";
  String physicsMarksResult = "";
  double englishPercentage = 0.0;
  double physicsPercentage = 0.0;
  final int totalMarks = 100;

  void calculate() {
    int englishMarks = int.tryParse(englishMarksController.text) ?? 0;
    int physicsMarks = int.tryParse(physicsMarksController.text) ?? 0;

    englishMarksResult = englishMarks.toString();
    physicsMarksResult = physicsMarks.toString();

    englishPercentage = (englishMarks / totalMarks) * 100;
    physicsPercentage = (physicsMarks / totalMarks) * 100;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('DMC'),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: englishMarksController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'English Marks',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.green),
                ),
              ),
            ),
            TextField(
              controller: physicsMarksController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Physics Marks',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.green),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: clear,
                  child: const Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: calculate,
                  child: const Text("Calculate"),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            if (englishMarksResult.isNotEmpty)
              Text(
                "English Marks: $englishMarksResult",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            if (englishPercentage > 0)
              Text(
                "English Percentage: ${englishPercentage.toStringAsFixed(2)}%",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            if (physicsMarksResult.isNotEmpty)
              Text(
                "Physics Marks: $physicsMarksResult",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            if (physicsPercentage > 0)
              Text(
                "Physics Percentage: ${physicsPercentage.toStringAsFixed(2)}%",
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            if (englishPercentage > 0)
              LinearProgressIndicator(
                value: englishPercentage / 100,
                color: Colors.blue,
                backgroundColor: Colors.grey,
              ),
            if (physicsPercentage > 0)
              LinearProgressIndicator(
                value: physicsPercentage / 100,
                color: Colors.green,
                backgroundColor: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }

  void clear() {
    englishMarksController.clear();
    physicsMarksController.clear();
    setState(() {
      englishMarksResult = "";
      physicsMarksResult = "";
      englishPercentage = 0.0;
      physicsPercentage = 0.0;
    });
  }
}
