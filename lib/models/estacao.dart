import 'desembarque.dart';
import 'embarque.dart';

class Estacao {
  String nome;
  String linha;
  List<Desembarque> desembarques = [];
  List<Embarque> embarques = [];

  Estacao({required this.nome, required this.linha});
}
