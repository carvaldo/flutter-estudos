import 'package:flutter/material.dart';
import 'package:picker/data_table_page.dart';
import 'package:picker/drag_drop_page.dart';
import 'package:picker/routes.dart';
import 'package:picker/table_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State {
  var _showFirst = true;
  num _fontSize = 20;
  var _fontColor = ThemeData.light().textTheme.bodyText1?.color ?? Colors.black;

  @override
  Widget build(BuildContext context) {
    _selectOption() async {
      var selecionado = await _showDialogOption(context);
      switch (selecionado) {
        case "opcao1":
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Selecionado opção 1.")));
          break;
        case "opcao2":
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Selecionado opção 2.")));
          break;
        default:
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Opção sem caso definido: $selecionado")));
      }
    }

    return Scaffold(
        body: ListView(
          children: [
            ElevatedButton(
                child: const Text("Testar DatePicker"),
                onPressed: () => _selectDate(context)),
            ElevatedButton(
                child: const Text("Testar TimePicker"),
                onPressed: () => _selectTime(context)),
            Tooltip(
                message: "Arraste para remover.",
                child: Dismissible(
                    key: GlobalKey(),
                    onDismissed: (direction) => ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text("Good bye!"))),
                    movementDuration: const Duration(seconds: 3),
                    child: Container(
                      color: Colors.yellow,
                      width: 100,
                      height: 50,
                      child: const Center(child: Text("Swipe me")),
                    ))),
            ElevatedButton(
                child: const Text("Mostrar caixa de diálogo."),
                onPressed: _selectOption),
            ElevatedButton(
                onPressed: () => _showBottomSheet(context),
                child: const Text("Mostrar Bottom Sheet")),
            ElevatedButton(
                onPressed: _animateLogo, child: const Text("Animar logo")),
            AnimatedCrossFade(
                firstChild: const FlutterLogo(
                    size: 100, style: FlutterLogoStyle.horizontal),
                secondChild:
                const FlutterLogo(size: 100, style: FlutterLogoStyle.stacked),
                crossFadeState: _showFirst
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(milliseconds: 500)),
            ElevatedButton(
                onPressed: _animateText, child: const Text("Animar texto")),
            AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 500),
                child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Veja aqui o texto mudar de tamanho e cor.")),
                style:
                TextStyle(color: _fontColor, fontSize: _fontSize.toDouble())),
            ElevatedButton(
                onPressed: () => _toNavigate(context, Routes.dragDropRoute),
                child: const Text("Ver Arrasta e Solta")),
            ElevatedButton(
                onPressed: () => _toNavigate(context, Routes.tableRoute),
                child: const Text("Ver tabela")),
            ElevatedButton(
                onPressed: () => _toNavigate(context, Routes.dataTableRoute),
                child: const Text("Ver tabela de dados")),
            PopupMenuButton(itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(child: Text("Opção 1"), value: "op1"),
                const PopupMenuItem(child: Text("Opção 2"), value: "op2"),
                const PopupMenuItem(child: Text("Opção 3"), value: "op3")
              ];
            }, onSelected: (value) => print(value))
          ],
        ));
  }

  _selectDate(BuildContext inContext) async {
    DateTime? date = await showDatePicker(
      context: inContext,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2023),
    );
    ScaffoldMessenger.of(inContext)
        .showSnackBar(SnackBar(content: Text(date.toString())));
  }

  _selectTime(BuildContext inContext) async {
    TimeOfDay? time = await showTimePicker(
      context: inContext,
      initialTime: TimeOfDay.now(),
    );
    ScaffoldMessenger.of(inContext)
        .showSnackBar(SnackBar(content: Text(time.toString())));
  }

  Future<String?> _showDialogOption(BuildContext inContext) async {
    return showDialog<String?>(
        context: inContext,
        builder: (buildContext) {
          return SimpleDialog(
            title: const Text("Exemplo de Caixa de Diálogo Simples"),
            children: [
              SimpleDialogOption(
                onPressed: () => Navigator.pop(buildContext, "opcao1"),
                child: const Text("Opção 1"),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(buildContext, "opcao2"),
                child: const Text("Opção 2"),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.pop(buildContext, "opcao3"),
                child: const Text("Opção 3"),
              )
            ],
          );
        });
  }

  _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text("Selecione uma opção:", textScaleFactor: 1.5)),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Opção 1")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Opção 2")),
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text("Opção 3"))
            ],
          );
        });
  }

  _animateLogo() {
    setState(() {
      _showFirst = !_showFirst;
    });
  }

  _animateText() async {
    setState(() {
      if (_fontSize == 20) {
        _fontSize = 40;
        _fontColor = Colors.red;
      } else {
        _fontSize = 20;
        _fontColor =
            ThemeData.light().textTheme.bodyText1?.color ?? Colors.black;
      }
    });
  }

  _toNavigate(BuildContext context, Routes route) {
    Widget widget;
    switch (route) {
      case Routes.dragDropRoute:
        widget = const SecondRoute();
        break;
      case Routes.tableRoute:
        widget = const TablePage();
        break;
      case Routes.dataTableRoute:
        widget = const DataTablePage();
        break;
    }
    var materialRoute = MaterialPageRoute(builder: (context) => widget);
    Navigator.push(context, materialRoute);
  }
}
