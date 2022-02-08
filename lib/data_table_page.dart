import 'package:flutter/material.dart';

// TODO: Sort não está funcionando. Exemplo incompleto.
class DataTablePage extends StatelessWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(height: 50),
        DataTable(sortColumnIndex: 1, sortAscending: false, columns: const [
          DataColumn(label: Text("First Name")),
          DataColumn(label: Text("Last Name"))
        ], rows: const [
          DataRow(cells: [
            DataCell(Text("Leia")),
            DataCell(Text("Organa"), showEditIcon: true)
          ]),
          DataRow(
              cells: [DataCell(Text("Lucky")), DataCell(Text("Skywalker"))]),
          DataRow(cells: [DataCell(Text("Han")), DataCell(Text("Solo"))])
        ])
      ]),
    );
  }
}
