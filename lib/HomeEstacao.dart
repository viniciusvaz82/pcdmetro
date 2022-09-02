import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
//import 'dart:async';
import 'dart:convert';
import 'estacaoOcorrenciaPcd.dart';

class HomeEstacao extends StatefulWidget {
  @override
  State<HomeEstacao> createState() => _HomeEstacaoState();
}

class _HomeEstacaoState extends State<HomeEstacao> {
  TextEditingController sentido2 = new TextEditingController();
  TextEditingController sentido1 = new TextEditingController();
  var alpha = 0.5;
  var ocorrencia = "";
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
                  "Estação - Sé", //aqui tem que puxar da informação do login
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
              //Box de Sentido1
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  minLines: 3,
                  maxLines: 3,
                  controller: sentido1,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      filled: true,
                      enabled: false,
                      fillColor: Colors.blueAccent,
                      labelText: 'Aguardando entrada PCDs. . .',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 231, 229, 229),
                        fontStyle: FontStyle.italic,
                      )),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              //Box de Sentido2
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  minLines: 3,
                  maxLines: 3,
                  controller: sentido2,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      filled: true,
                      enabled: false,
                      fillColor: Colors.blueAccent,
                      labelText: 'Aguardando entrada PCDs. . .',
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 231, 229, 229),
                        fontStyle: FontStyle.italic,
                      )),
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ),
            SizedBox(
              //Box de Sentido2
              width: 500,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text("Confirmar PCDs",
                          style: TextStyle(color: Colors.white)),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 74, 159, 0))))),
            ),
            InkWell(
              child: Container(
                //Box Cadeirante Motorizada
                width: 500,
                height: 60,
                //alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 76, 159, 1.000)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(
                      "assets/images/motorizada_cc.png",
                    ),
                    //opacity: ,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => estacaoOcorrencia("motorizada")));
                print("teste motorizada");
              },
            ),
            InkWell(
              child: Container(
                //Box Def Visual
                width: 500,
                height: 60,
                //alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 76, 159, 1.000)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(
                      "assets/images/deficientevisual_cc.png",
                    ),
                    //opacity: ,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => estacaoOcorrencia("visual")));
                print("teste visual");
              },
            ),
            InkWell(
              child: Container(
                //Box Cadeirante
                width: 500,
                height: 60,
                //alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 76, 159, 1.000)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(
                      "assets/images/cadeirante_cc.png",
                    ),
                    //opacity: ,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => estacaoOcorrencia("cadeirante")));
                print("teste cadeirante");
              },
            ),
            InkWell(
              child: Container(
                //Box Outros
                width: 500,
                height: 60,
                //alignment: Alignment.topLeft,
                decoration: const BoxDecoration(
                    color: Color.fromRGBO(0, 76, 159, 1.000)),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Image(
                    image: AssetImage(
                      "assets/images/deficienteoutros_cc.png",
                    ),
                    //opacity: ,
                    fit: BoxFit.contain,
                    width: 200,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => estacaoOcorrencia("outros")));
                print("teste outros tipos");
              },
            ),
          ],
        ),
      ),
    );
  }
}
