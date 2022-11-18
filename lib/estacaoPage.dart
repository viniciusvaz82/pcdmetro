import 'package:flutter/material.dart';
import 'package:pcdmetro/HomeEstacao.dart';
import 'package:pcdmetro/models/desembarque.dart';
import 'package:pcdmetro/selecionaEstacao.dart';
import '../models/estacao.dart';
import './addDesembarque.dart';

class EstacaoPage extends StatefulWidget {
  late Estacao estacao;
  EstacaoPage({super.key, required this.estacao});

  @override
  State<EstacaoPage> createState() => _EstacaoPageState();
}

class _EstacaoPageState extends State<EstacaoPage> {
  desembarquePage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            AdddesembarquePage(estacao: widget.estacao, onSave: addDesembarque),
      ),
    );
  }

  addDesembarque(Desembarque desembarque) {
    setState(() {
      widget.estacao.desembarques.add(desembarque);
    });

    Navigator.pop(context);

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Embarque com sucesso!')));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.estacao.nome),
          actions: [
            IconButton(
              onPressed: desembarquePage,
              icon: Icon(Icons.add),
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.train),
                text: 'Embarque',
              ),
              Tab(
                icon: Icon(Icons.home),
                text: 'Desembarque',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            desembarques(),
            HomeEstacao(),
          ],
        ),
      ),
    );
  }

  Widget desembarques() {
    final quantidade = widget.estacao.desembarques.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Aguardando informação de embarque'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.wheelchair_pickup),
                title: Text(widget.estacao.desembarques[index].tipo),
                subtitle: Text(widget.estacao.desembarques[index].origem),
                trailing: Text(widget.estacao.desembarques[index].trem),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
