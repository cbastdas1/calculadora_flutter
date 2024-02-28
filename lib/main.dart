import 'package:flutter/material.dart';
import 'dos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2, // Número de pestañas
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.settings)),
              ],
            ),
            backgroundColor: const Color.fromARGB(255, 159, 211, 253),
            title: const Text('Formulario de Captura de Datos'),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('ALGO'),
                ),
                ListTile(
                  leading: const Icon(Icons.desktop_mac_outlined),
                  title: const Text('Pantalla 1'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.desktop_mac),
                  title: const Text('Pantalla 2'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DosPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Salir'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              MyHomePage(), // Primera pestaña
              DosPage(), // Segunda pestaña
            ],
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _isWorking = false;
  bool _isStudying = false;
  String _gender = 'Male';
  bool notificationsOn = false;
  double _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 211, 253),
        title: const Text('Formulario de Captura de Datos'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(
                    'https://th.bing.com/th/id/OIP.L3f1yjDrBTaF0wb2Ov1jLQHaCS?w=504&h=156&rs=1&pid=ImgDetMain'),
                const SizedBox(height: 30),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: 'Nombre',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        myController.text = '';
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isWorking,
                      onChanged: (bool? value) {
                        setState(() {
                          _isWorking = value ?? false;
                        });
                      },
                    ),
                    const Text('TRABAJA'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: _isStudying,
                      onChanged: (bool? value) {
                        setState(() {
                          _isStudying = value ?? false;
                        });
                      },
                    ),
                    const Text('ESTUDIA'),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      const Text('Masculino'),
                      Radio<String>(
                        value: 'Masculino',
                        groupValue: _gender,
                        onChanged: (String? value) {
                          setState(() {
                            _gender = value ?? '';
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: <Widget>[
                    const Text('Femenino'),
                    Radio<String>(
                      value: 'Femenino',
                      groupValue: _gender,
                      onChanged: (String? value) {
                        setState(() {
                          _gender = value ?? '';
                        });
                      },
                    ),
                  ]),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(height: 30),
                      SwitchListTile(
                        title: const Text('Activar Notificaciones'),
                        value: notificationsOn,
                        onChanged: (bool value) {
                          setState(() {
                            notificationsOn = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const Text('Seleccione Precio Estimado'),
                    Slider(
                      thumbColor: Colors.yellow,
                      value: _sliderValue,
                      min: 0,
                      max: 1000,
                      divisions: 5,
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ],
                ),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) =>
                                const Color.fromARGB(255, 159, 211, 253))),
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null && pickedDate != _selectedDate) {
                        setState(() {
                          _selectedDate = pickedDate;
                        });
                      }
                    },
                    child: const Text('Fecha'),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> states) =>
                                const Color.fromARGB(255, 159, 211, 253))),
                    onPressed: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedTime,
                      );
                      if (pickedTime != null && pickedTime != _selectedTime) {
                        setState(() {
                          _selectedTime = pickedTime;
                        });
                      }
                    },
                    child: const Text('Hora'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

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
    setState(() {
      double sueldoNeto = double.parse(sueldoBaseController.text) +
          double.parse(comisionController.text) -
          double.parse(deduccionController.text);
      resultadoController.text = sueldoNeto.toStringAsFixed(2);
    });
  }

  void limpiar() {
    setState(() {
      cedulaController.clear();
      nombreController.clear();
      sueldoBaseController.clear();
      comisionController.clear();
      deduccionController.clear();
      resultadoController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 159, 211, 253),
        title: const Text('Formulario de Captura de Datos'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
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
