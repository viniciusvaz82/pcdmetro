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
  final _selectedValOrigem = [
    'Corinthians-Itaquera',
    'Artur Alvim',
    'Patriarca',
    'Guilhermina Esperança',
    'Vila Matilde',
    'Penha',
    'Carrão',
    'Tatuapé',
    'Belém',
    'Bresser-Mooca',
    'Bras',
    'Pedro II',
    'Sé',
    'Anhangabau',
    'Republica',
    'Santa Cecília',
    'Marechal Deodoro',
    'Barra-Funda',
  ];
  final _selectedValTrem = ['H51', 'H52', 'H53'];
  String? _origem = 'Corinthians-Itaquera';
  Tipo? _tipo;
  String? _trem = 'H51';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Embarcar Passageiro'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        value: _origem,
                        items: _selectedValOrigem.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _origem = val as String;
                          });
                        },
                        dropdownColor: Colors.white,
                        decoration: InputDecoration(
                          labelText: 'Origem',
                          prefixIcon: Icon(Icons.subway, color: Colors.white),
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: DropdownButtonFormField(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        value: _trem,
                        items: _selectedValTrem.map((e) {
                          return DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          );
                        }).toList(),
                        onChanged: (val) {
                          setState(() {
                            _trem = val as String;
                          });
                        },
                        dropdownColor: Colors.lightBlue.shade50,
                        decoration: InputDecoration(
                          labelText: 'Trem',
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          prefixIcon: Icon(
                            Icons.train,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      child: RadioListTile<Tipo>(
                        activeColor: Colors.white,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      child: RadioListTile<Tipo>(
                        activeColor: Colors.white,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      child: RadioListTile<Tipo>(
                        activeColor: Colors.white,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      child: RadioListTile<Tipo>(
                        activeColor: Colors.white,
                        groupValue: _tipo,
                        value: Tipo.outros,
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
                                  trem: _trem.toString(),
                                  origem: _origem.toString(),
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
          ],
        ),
      ),
    );
  }
}
