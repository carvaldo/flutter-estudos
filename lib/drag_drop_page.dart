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
          DragTarget(
            onAccept: (data) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(data.toString())));
            },
            builder: (BuildContext context, List<String?> accepted, rejected) {
              return Container(
                  width: 200, height: 200, color: Colors.lightBlue);
            },
            onWillAccept: (s) => true,
          ),
          Container(height: 50),
          Draggable(
            child: Container(width: 100, height: 100, color: Colors.red),
            feedback: Container(width: 100, height: 100, color: Colors.yellow),
            //childWhenDragging: Container(),
            data: "I was dragged!", key: GlobalKey(),
          ),
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Voltar")),
        ],
      ),
    );
  }
}
