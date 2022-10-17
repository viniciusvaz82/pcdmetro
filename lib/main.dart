import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcdmetro/sign_in_screen.dart';
import 'dart:io';
//import 'dart:async';
import 'dart:convert';
import 'HomeEstacao.dart';

void main() {
  runApp(
    const MaterialApp(
      title: "PCD Metro",
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
