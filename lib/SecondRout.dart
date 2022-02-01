
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(),
          const Text("Hello, my friend!"),
          ElevatedButton(onPressed: () => _toBack(context), child: const Text("Voltar"))
        ],
      ),
    );
  }

  _toBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}