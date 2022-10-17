import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pcdmetro/models/estacao.dart';
import 'package:pcdmetro/repositories/estacoes_repository.dart';
import '../models/desembarque.dart';
import '../models/embarque.dart';

class EstacaoController {
  late EstacoesRepository estacoesRepository;

  List<Estacao> get tabela => estacoesRepository.estacoes;

  EstacaoController() {
    estacoesRepository = EstacoesRepository();
  }
}
