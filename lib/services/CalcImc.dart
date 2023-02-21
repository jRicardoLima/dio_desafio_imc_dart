import 'package:desafio_imc_app/contracts/ICalcImc.dart';

import '../entity/Pessoa.dart';

class CalcImc implements ICalcImc {
  Pessoa? _pessoa;
  String _classficacaoImc = "";

  CalcImc();
  CalcImc.inicializa(this._pessoa);

  void setPessoa(Pessoa? pessoa) {
    _pessoa = pessoa;
  }

  Pessoa? getPessoa() {
    return _pessoa;
  }

  @override
  double calcularImc() {
    if (_pessoa != null) {
      if (_pessoa!.getNome() == "" ||
          _pessoa!.getAltura() <= 0.0 ||
          _pessoa!.getPeso() <= 0.0) {
        throw Exception(
            'A pessoa deve ter nome, altura maior que zero e peso maior que zero');
      }
      double result =
          _pessoa!.getPeso() / (_pessoa!.getAltura() * _pessoa!.getAltura());
      return double.parse(result.toStringAsFixed(2));
    }
    throw Exception('Pessoa não pode ser nula');
  }

  @override
  String classificacaoImc(double? resultado) {
    if (resultado == null || resultado <= 0.0) {
      double result = calcularImc();
      _classficacaoImc = _classifica(result);
      return _classficacaoImc;
    } else {
      _classficacaoImc = _classifica(resultado);
      return _classficacaoImc;
    }
  }

  String _classifica(double result) {
    if (result < 16) {
      return 'Magreza Grave';
    } else if (result > 16 && result <= 17) {
      return 'Magreza Moderada';
    } else if (result > 17 && result <= 18.5) {
      return 'Magreza Leve';
    } else if (result > 18.5 && result <= 25) {
      return 'Saudável';
    } else if (result > 25 && result <= 30) {
      return 'Sobrepeso';
    } else if (result > 30 && result <= 35) {
      return 'Obesidade Grau 1';
    } else if (result > 35 && result <= 40) {
      return 'Obesidade Grau 2 (Severa)';
    } else {
      return 'Obesidade Grau 3 (Móbida)';
    }
  }

  @override
  String toString() {
    if (_classficacaoImc == "") {
      _classficacaoImc = classificacaoImc(null);
    }

    return "${_pessoa!.getNome()} tem o Imc de ${this.calcularImc().toString()} classificado em $_classficacaoImc";
  }
}
