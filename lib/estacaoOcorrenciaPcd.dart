import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
//import 'dart:async';
import 'dart:convert';

import 'package:pcdmetro/HomeEstacao.dart';

class estacaoOcorrencia extends StatefulWidget {
  //const estacaoOcorrencia({Key? key}) : super(key: key);
  String tipo;
  estacaoOcorrencia(this.tipo);
  @override
  State<estacaoOcorrencia> createState() => _estacaoOcorrenciaState();
}

class _estacaoOcorrenciaState extends State<estacaoOcorrencia> {
  TextEditingController nome = new TextEditingController();
  TextEditingController desembarque = new TextEditingController();
  TextEditingController especial = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.transparent,
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
            const SizedBox(
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Cadastro de PCD", //aqui tem que puxar da informação do login
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              //teste trazendo valor da tela anterior
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Tipo: ${widget.tipo}", //aqui tem que puxar da informação do login
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: nome,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Nome. . .',
                      //counterText: '',
                      //contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 205, 203, 203),
                        //fontSize: 22,
                        fontStyle: FontStyle.italic,
                        //decoration: TextDecoration.underline
                      )),
                ),
              ),
            ),
            SizedBox(
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: desembarque,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Desembarque. . .',
                      //counterText: '',
                      //contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 205, 203, 203),
                        //fontSize: 22,
                        fontStyle: FontStyle.italic,
                        //decoration: TextDecoration.underline
                      )),
                ),
              ),
            ),
            if (widget.tipo == "outros") ...{
              SizedBox(
                width: 500,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    controller: especial,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'Necessidade especial. . .',
                        //counterText: '',
                        //contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 205, 203, 203),
                          //fontSize: 22,
                          fontStyle: FontStyle.italic,
                          //decoration: TextDecoration.underline
                        )),
                  ),
                ),
              )
            },
            SizedBox(
              //botão salvar
              width: 500,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {},
                      child:
                          Text("Salvar", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 74, 159, 0))))),
            ),
            SizedBox(
              //botão voltar
              width: 500,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:
                          Text("Voltar", style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 74, 159, 0))))),
            ),
          ],
        ),
      ),
    );
  }
}
