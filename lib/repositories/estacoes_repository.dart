import 'package:pcdmetro/models/estacao.dart';
import 'package:flutter/material.dart';
import '../models/desembarque.dart';
import '../models/embarque.dart';

class EstacoesRepository {
  final List<Estacao> _estacoes = [];

  get estacoes => this._estacoes;

  void addEmbarque({required Estacao estacao, required Embarque embarque}) {
    estacao.embarques.add(embarque);
  }

  void addDesembarque(
      {required Estacao estacao, required Desembarque desembarque}) {
    estacao.desembarques.add(desembarque);
  }

  EstacoesRepository() {
    _estacoes.addAll(
      [
        Estacao(nome: 'Corinthians-Itaquera', linha: '3'),
        Estacao(nome: 'Artur Alvim', linha: '3'),
        Estacao(nome: 'Patriarca', linha: '3'),
        Estacao(nome: 'Guilhermina-Esperança', linha: '3'),
        Estacao(nome: 'Vila Matilde', linha: '3'),
        Estacao(nome: 'Penha', linha: '3'),
        Estacao(nome: 'Carrão', linha: '3'),
        Estacao(nome: 'Tatuapé', linha: '3'),
        Estacao(nome: 'Belém', linha: '3'),
        Estacao(nome: 'Bresser-Mooca', linha: '3'),
        Estacao(nome: 'Brás', linha: '3'),
        Estacao(nome: 'Pedro II', linha: '3'),
        Estacao(nome: 'Sé', linha: '3'),
        Estacao(nome: 'Anhangabau', linha: '3'),
        Estacao(nome: 'República', linha: '3'),
        Estacao(nome: 'Santa Cecília', linha: '3'),
        Estacao(nome: 'Marechal Deodoto', linha: '3'),
        Estacao(nome: 'Palmeiras Barra Funda', linha: '3'),
      ],
    );
  }
}
