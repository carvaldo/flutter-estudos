import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          border: const TableBorder(
              top: BorderSide(width: 2),
              left: BorderSide(width: 2),
              bottom: BorderSide(width: 2),
              right: BorderSide(width: 2),
              verticalInside: BorderSide(width: 2)),
          children: const [
            TableRow(children: [
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("Label 1"))),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("Label 2"))),
              Center(
                  child: Padding(
                      padding: EdgeInsets.all(10), child: Text("Label 3")))
            ])
          ],
        ),
      ),
    );
  }
}
