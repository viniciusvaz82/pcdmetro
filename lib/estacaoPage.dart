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
                icon: Icon(Icons.map),
                text: 'Mapa',
              ),
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            desembarques(),
            Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/mapa_sptrans.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
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
              return Dismissible(
                background: Container(
                  color: Colors.green,
                  child: const Icon(Icons.check),
                ),
                key: ValueKey<Desembarque>(widget.estacao.desembarques[index]),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    widget.estacao.desembarques.removeAt(index);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Passageiro recebido na estação!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.wheelchair_pickup),
                  title: Text(widget.estacao.desembarques[index].tipo),
                  subtitle: Text(widget.estacao.desembarques[index].origem),
                  trailing: Text(widget.estacao.desembarques[index].trem),
                ),
              );

              /*return ListTile(
                leading: Icon(Icons.wheelchair_pickup),
                title: Text(widget.estacao.desembarques[index].tipo),
                subtitle: Text(widget.estacao.desembarques[index].origem),
                trailing: Text(widget.estacao.desembarques[index].trem),
              );*/
            },
            separatorBuilder: (_, __) => Divider(),
            itemCount: quantidade,
          );
  }
}
