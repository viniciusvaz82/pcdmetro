import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'HomeEstacao.dart';

void main() {
  runApp(MaterialApp(
    title: "PCD Metro",
    home: HomeEstacao(),
    debugShowCheckedModeBanner: false,
  ));
}
