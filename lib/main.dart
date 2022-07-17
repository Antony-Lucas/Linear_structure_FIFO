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
  //Usamos o modificador final para armazenar os controladores(TextEditingController())
  //já que os valores serão conhecidos somente em tempo de execução.
  final titleController = TextEditingController();
  final descController = TextEditingController();
  //override para sobrescrever a instância da superclasse
  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    //usamos super para acessar o método da classe pai.
    super.dispose();
  }

  // para criarmos uma lista vazia usamos somente:
  List<DataManager> datalist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //Corpo do Scaffold...
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Aqui são chamados os nossos campos de texto, bem como seus controladores que criamos ali em cima
          //estão sendo passados por parâmetros para o nosso widget, e também, o hint para o texto da label.
          textFieldDefault(controller: titleController, hint: "Título"),
          const SizedBox(
            height: 20.0,
          ),
          textFieldDefault(controller: descController, hint: "Descrição"),
          const SizedBox(
            height: 20.0,
          ),
          //map() para acessar os elementos que foram adicionados em nossa lista.
          //Usamos o widget ListTile para exibir as informações
          ...datalist.map((e) => ListTile(
            title: Text(e.title),
            subtitle: Text(e.description),
          ))
        ],
      ),
      //inkwell cria uma área que responde de maneira diferente à diferentes tipos de toque
      floatingActionButton: InkWell(
        //aqui nós implementamos um evento onde se o botão for segurado ele executa a mudança de estado
        //para remover sempre o primeiro elemento da nossa Lista(o primeiro elemento está no índice 0).
        onLongPress:(){
          setState(() {
            datalist.removeAt(0);
          });
        },
        //caso o botão por pressionado normalmente ele apenas irá seguir como desenvolvemos anteriormente.
        child: FloatingActionButton(
          onPressed: () {
          //Verifica se o campo título e descrição estão vazios, se estiver ele mostra uma mensagem por 3 segundos.
            if(titleController.text.isEmpty && descController.text.isEmpty){
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Por favor, preencha todos os campos")
              ));
            //senão, ele muda o estado do objeto através do setState e usando a propriedade .add nós inserimos
            //os valores através dos parâmetros requeridos para a classe data_manager.dart.
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
