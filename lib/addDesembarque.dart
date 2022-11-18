import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pcdmetro/models/desembarque.dart';
import 'package:pcdmetro/models/estacao.dart';
import 'package:pcdmetro/selecionaEstacao.dart';
import 'models/desembarque.dart';
import 'models/estacao.dart';

enum Tipo { Visual, CadComum, CadMotorizada, RestMob, outros }

class AdddesembarquePage extends StatefulWidget {
  Estacao estacao;
  ValueChanged<Desembarque> onSave;

  AdddesembarquePage({super.key, required this.estacao, required this.onSave});

  @override
  State<AdddesembarquePage> createState() => _AdddesembarquePageState();
}

class _AdddesembarquePageState extends State<AdddesembarquePage> {
  final _origem = TextEditingController();
  Tipo? _tipo;
  final _trem = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Embarcar Passageiro'),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(24),
                child: TextFormField(
                  controller: _origem,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'origem:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira a origem!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: TextFormField(
                  controller: _trem,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'trem:'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Insira o id do trem!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: RadioListTile<Tipo>(
                  value: Tipo.Visual,
                  groupValue: _tipo,
                  title: Image(
                    image: AssetImage(
                      "assets/images/deficientevisual_cc.png",
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _tipo = val!;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: RadioListTile<Tipo>(
                  groupValue: _tipo,
                  value: Tipo.CadComum,
                  title: Image(
                    image: AssetImage(
                      "assets/images/cadeirante_cc.png",
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _tipo = val!;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: RadioListTile<Tipo>(
                  groupValue: _tipo,
                  value: Tipo.CadMotorizada,
                  title: Image(
                    image: AssetImage(
                      "assets/images/motorizada_cc.png",
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _tipo = val!;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                child: RadioListTile<Tipo>(
                  groupValue: _tipo,
                  value: Tipo.RestMob,
                  title: Image(
                    image: AssetImage(
                      "assets/images/deficienteoutros_cc.png",
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      _tipo = val!;
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onSave(Desembarque(
                            trem: _trem.text,
                            origem: _origem.text,
                            tipo: _tipo.toString()));
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check),
                        Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            'Embarcar',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
