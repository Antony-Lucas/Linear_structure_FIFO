import 'package:flutter/material.dart';
import 'package:simple_data_structure/widgets/data_manager.dart';
import 'package:simple_data_structure/widgets/text_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Listas em flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  List<DataManager> datalist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          textFieldDefault(controller: titleController, hint: "Título"),
          const SizedBox(
            height: 20.0,
          ),
          textFieldDefault(controller: descController, hint: "Descrição"),
          const SizedBox(
            height: 20.0,
          ),
          ...datalist.map((e) => ListTile(
            title: Text(e.title),
            subtitle: Text(e.description),
          ))
        ],
      ),
      floatingActionButton: InkWell(
        onLongPress:(){
          setState(() {
            datalist.removeAt(0);
          });
        },
        child: FloatingActionButton(
          onPressed: () {
            if(titleController.text.isEmpty && descController.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Por favor, preencha todos os campos")
              ));
            }else{
              setState(() {
                datalist.add(DataManager(title: titleController.text, description: descController.text));
              });
            }
          },
          child: const Icon(Icons.add),
        )
      ),
    );
  }
}
