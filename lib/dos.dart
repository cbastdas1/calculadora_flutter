import 'package:flutter/material.dart';

class DosPage extends StatefulWidget {
  const DosPage({Key? key}) : super(key: key);

  @override
  DosPageState createState() => DosPageState();
}

class DosPageState extends State<DosPage> {
  final cedulaController = TextEditingController();
  final nombreController = TextEditingController();
  final sueldoBaseController = TextEditingController();
  final comisionController = TextEditingController();
  final deduccionController = TextEditingController();
  final resultadoController = TextEditingController();

  void calcular() {
    double sueldoNeto = double.parse(sueldoBaseController.text) +
        double.parse(comisionController.text) -
        double.parse(deduccionController.text);
    resultadoController.text = sueldoNeto.toStringAsFixed(2);
  }

  void limpiar() {
    cedulaController.clear();
    nombreController.clear();
    sueldoBaseController.clear();
    comisionController.clear();
    deduccionController.clear();
    resultadoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: SizedBox(
          height: 100,
          child: Image.network(
            'https://th.bing.com/th/id/OIP.L3f1yjDrBTaF0wb2Ov1jLQHaCS?w=504&h=156&rs=1&pid=ImgDetMain',
          ),
        ),
      )),
      
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 40),
            TextField(
                controller: cedulaController,
                decoration: const InputDecoration(labelText: 'Cédula')),
            TextField(
                controller: nombreController,
                decoration: const InputDecoration(labelText: 'Nombre')),
            TextField(
                controller: sueldoBaseController,
                decoration: const InputDecoration(labelText: 'Sueldo Base')),
            TextField(
                controller: comisionController,
                decoration: const InputDecoration(labelText: 'Comisión')),
            TextField(
                controller: deduccionController,
                decoration: const InputDecoration(labelText: 'Deducción')),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: calcular, child: const Text('Calcular')),
                const SizedBox(width: 20),
                ElevatedButton(
                    onPressed: limpiar, child: const Text('Limpiar')),
              ],
            ),
            const SizedBox(width: 50),
            TextField(
                controller: resultadoController,
                readOnly: true,
                decoration: const InputDecoration(labelText: 'Resultado')),
            const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }
}
