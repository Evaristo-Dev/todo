import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _todoList = [];
  final _toDoController = TextEditingController();

  void _addTarefa() {
    setState(() {
      Map<String, dynamic> nova_tarefa = new Map();
      nova_tarefa["titulo"] = _toDoController.text;
      nova_tarefa["realizado"] = false;
      _toDoController.text = "";
      _todoList.add(nova_tarefa);
    });
  }

  Future<File> _salvarDados() async{
    String dados = jsonEncode(_todoList);
    final file = await _abre();
      return file.writeAsString(dados);
  }

  Future<File> _abre() async {
    final diretorio = await getApplicationDocumentsDirectory();
    return File("${diretorio.path}/todoList.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo list"), centerTitle: true),
      body: Builder(
        builder:
            (context) => Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _toDoController,
                          maxLength: 50,
                          decoration: InputDecoration(labelText: "Nova Tarefa"),
                        ),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        child: FloatingActionButton(
                          onPressed: () {
                            if (_toDoController.text.isEmpty) {
                              final alerta = SnackBar(
                                content: Text("Preencha a tarefa"),
                                duration: Duration(seconds: 4),
                                action: SnackBarAction(
                                  label: "OK",
                                  onPressed: () {
                                    ScaffoldMessenger.of(
                                      context,
                                    ).removeCurrentSnackBar();
                                  },
                                ),
                              );
                              ScaffoldMessenger.of(
                                context,
                              ).removeCurrentSnackBar();
                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(alerta);
                            } else{
                              _addTarefa();
                            }

                          },
                          child: Icon(Icons.save),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
      ),
    );
  }
}
