import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        body: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String message = '';
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Spacer(
              flex: 3,
            ),
            const Text(
              'Hello ItWay - this is your test project, that you asked for',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            CupertinoButton.filled(
              child: const Text("Press when field is not empty"),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(message.isNotEmpty
                          ? "You typed: $message"
                          : "I say - PRESS WHEN NOT EMPTY! ))))")),
                );
                message = '';
                controller.clear();
              },
            ),
            const Spacer(),
            CupertinoTextField(
              placeholder: "waiting your text...",
              controller: controller,
              onChanged: (value) {
                setState(() {
                  message = value;
                });
              },
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}
