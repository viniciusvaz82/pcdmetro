import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pcdmetro/HomeEstacao.dart';

class testCadastro extends StatefulWidget {
  //const estacaoOcorrencia({Key? key}) : super(key: key);

  @override
  State<testCadastro> createState() => _testCadastroState();
}

class _testCadastroState extends State<testCadastro> {
  TextEditingController nome = new TextEditingController();
  TextEditingController desembarque = new TextEditingController();
  TextEditingController especial = new TextEditingController();
  final _email = TextEditingController();
  final _pass = TextEditingController();
  final _cargo = TextEditingController();
  final _nome = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;
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
                  "Cadastro de Usuário", //aqui tem que puxar da informação do login
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
              width: 500,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: _nome,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Nome',
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
                  controller: _email,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Email...',
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
                  controller: _pass,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      fillColor: Colors.white,
                      labelText: 'Password',
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
              //botão salvar
              width: 500,
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        cadastrar();
                      },
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

  cadastrar() async {
    User? user;
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _email.text, password: _pass.text);
      // ignore: deprecated_member_use
      await user?.updateDisplayName(_nome.text);

      if (userCredential != null) {
        userCredential.user!.updateDisplayName(_nome.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeEstacao()),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Crie uma senha mais forte'),
          backgroundColor: Colors.redAccent,
        ));
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Email já cadastrado'),
          backgroundColor: Colors.redAccent,
        ));
      }
    }
  }
}
