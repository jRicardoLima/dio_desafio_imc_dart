import 'dart:convert';
import 'dart:io';

import 'package:desafio_imc_app/desafio_imc_app.dart' as desafio_imc_app;
import 'package:desafio_imc_app/entity/Pessoa.dart';
import 'package:desafio_imc_app/services/CalcImc.dart';

void main(List<String> arguments) {
  print('Bem vindo ao sistema IMC\n');
  print('--------------------------------------\n');

  bool sair = false;
  do {
    Pessoa pessoa = Pessoa();

    print('Por favor digite o seu nome\n');

    pessoa.setNome(stdin.readLineSync(encoding: utf8) ?? "");
    print("\n");

    print('Por favor digite seu peso\n');

    String peso = stdin.readLineSync(encoding: utf8) ?? "";

    pessoa.setPeso((peso == "") ? 0.0 : double.parse(peso));
    print("\n");

    print('Por favor digite sua altura\n');

    String altura = stdin.readLineSync(encoding: utf8) ?? "";

    pessoa.setAltura((altura == "") ? 0.0 : double.parse(altura));
    print("\n");

    print('--------------RESULTADO---------------\n');

    CalcImc calcImc = CalcImc.inicializa(pessoa);

    print("$calcImc\n");

    print('---------------------------------------\n');

    print('Deseja sair? sim(s)/nao(n)');

    sair = (stdin.readLineSync(encoding: utf8)!.toLowerCase() == 's')
        ? true
        : false;
    print("\n\n");
  } while (!sair);
}
