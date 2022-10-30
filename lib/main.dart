import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcdmetro/learn_firebase.dart';
import 'package:pcdmetro/sign_in_screen.dart';
import 'package:pcdmetro/sign_up_screen.dart';
import 'dart:io';
//import 'dart:async';
import 'dart:convert';
import 'HomeEstacao.dart';

void main() {
  runApp(
    MaterialApp(
      title: "PCD Metro",
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
