import 'package:flutter/material.dart';
import 'package:untitled/widgets/widgets_calculator.dart';

class CalculatorUI extends StatefulWidget {
  const CalculatorUI({Key? key}) : super(key: key);

  @override
  State<CalculatorUI> createState() => _CalculatorUIState();
}

class _CalculatorUIState extends State<CalculatorUI> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();
  String respuesta = 'Respuesta';
  double imc = 0.0;

  void _calcular() {
    setState(() {
      double peso = double.parse(_pesoController.text);
      double altura = double.parse(_alturaController.text) / 100;
      imc = peso / (altura * altura);
      respuesta = imc.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Mi Calculadora')),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        child: MyContainer(
          child: Column(
            children: [
              Stack(
                children: const [MyAppContainer()],
              ),
              _sizeEspacio(),
              MyTextInput(inputController: _pesoController, label: 'Peso Kg'),
              _sizeEspacio(),
              MyTextInput(
                  inputController: _alturaController, label: 'Altura Cm'),
              _sizeEspacio(),
              MyText(text: respuesta.toString()),
              _sizeEspacio(),
              MyButton(
                  lblText: const Text('Calcular'), press: (() => _calcular())),
              _sizeEspacio(),
              MyTable()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _sizeEspacio() {
  return const SizedBox(
    height: 30,
  );
}
