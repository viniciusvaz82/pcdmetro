import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcdmetro/controller/estacaoController.dart';
import 'package:pcdmetro/estacaoPage.dart';
import 'package:pcdmetro/models/estacao.dart';

class SelecionaEstacao extends StatefulWidget {
  SelecionaEstacao({super.key});

  @override
  State<SelecionaEstacao> createState() => _SelecionaEstacaoState();
}

class _SelecionaEstacaoState extends State<SelecionaEstacao> {
  var controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = EstacaoController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleciona Estação'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext contexto, int estacao) {
          final List<Estacao> tabela = controller.tabela;
          return ListTile(
            leading: null,
            title: Text(tabela[estacao].nome),
            onTap: () {
              Navigator.push(
                contexto,
                MaterialPageRoute(
                  builder: (_) => EstacaoPage(
                      key: Key(tabela[estacao].nome), estacao: tabela[estacao]),
                ),
              );
            },
          );
        },
        separatorBuilder: (_, __) => Divider(),
        itemCount: controller.tabela.length,
        padding: const EdgeInsets.all(16),
      ),
    );
  }
}
