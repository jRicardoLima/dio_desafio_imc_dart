import 'package:desafio_imc_app/entity/Pessoa.dart';

abstract class ICalcImc {
  double calcularImc();

  String classificacaoImc(double? resultado);
}
