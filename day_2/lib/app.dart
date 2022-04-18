import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final controller = TextEditingController();
  final List<bool> _selection = [true, false, false];

  String tip = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (tip != "")
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    tip,
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              const Text("Total Amount"),
              SizedBox(
                width: 70,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(hintText: "\$100.00"),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ToggleButtons(
                    children: [Text("10%"), Text("15%"), Text("20%")],
                    isSelected: _selection,
                    onPressed: updateSelection),
              ),
              TextButton(
                onPressed: calculateTip,
                child: const Text("Calculate Tip"),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  primary: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void updateSelection(int selected) {
    setState(() {
      for (var i = 0; i < _selection.length; i++) {
        _selection[i] = selected == i;
      }
    });
  }

  void calculateTip() {
    final totalAmount = double.parse(controller.text);
    final selected = _selection.indexWhere((element) => true);
    final tipPercentage = [0.1, .15, .20][selected];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = "\$$tipTotal";
    });
  }
}
