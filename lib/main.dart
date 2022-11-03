import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcdmetro/firebase_options.dart';
import 'package:pcdmetro/sign_in_screen.dart';
import 'dart:io';
//import 'dart:async';
import 'dart:convert';
import 'HomeEstacao.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      title: "PCD Metro",
      home: SignInScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}
