import 'package:flutter/material.dart';
import 'package:pcdmetro/HomeEstacao.dart';
import '../models/estacao.dart';

class EstacaoPage extends StatefulWidget {
  late Estacao estacao;
  EstacaoPage({super.key, required this.estacao});

  @override
  State<EstacaoPage> createState() => _EstacaoPageState();
}

class _EstacaoPageState extends State<EstacaoPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.estacao.nome),
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
            children: [HomeEstacao(), desembarques()],
          )),
    );
  }

  Widget desembarques() {
    final quantidade = widget.estacao.desembarques.length;

    return quantidade == 0
        ? Container(
            child: Center(
              child: Text('Aguardando informação de desembarque'),
            ),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Icon(Icons.wheelchair_pickup),
                title: Text(widget.estacao.desembarques[index].origem),
                trailing: Text(widget.estacao.desembarques[index].trem),
              );
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
