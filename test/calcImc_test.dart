import 'package:desafio_imc_app/entity/Pessoa.dart';
import 'package:desafio_imc_app/services/CalcImc.dart';
import 'package:test/test.dart';

void main() {
  test('Testando o construtor e get da classe CalcImc', () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(calcImc, isA<CalcImc>());
    expect(calcImc.getPessoa(), isA<Pessoa>());
  });

  test('Testando o sets da classe CalcImc', () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo', 105, 1.75);
    CalcImc calcImc = CalcImc();

    calcImc.setPessoa(pessoa);

    expect(calcImc.getPessoa(), isA<Pessoa>());
  });

  test('Testando o método calcularImc da classe CalcImc', () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(calcImc.calcularImc(), equals(34.29));
  });

  test('Testando o método classificacaoImc da classe CalcImc', () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);
    double result = calcImc.calcularImc();

    expect(calcImc.classificacaoImc(result),
        equalsIgnoringCase('Obesidade Grau 1'));
  });

  test('Testando o método classificacaoImc da classe CalcImc passando null',
      () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(
        calcImc.classificacaoImc(null), equalsIgnoringCase('Obesidade Grau 1'));
  });

  test('Testando o método toString metodo do CalImc chamando a classificaoImc',
      () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo Lima', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);
    double result = calcImc.calcularImc();
    calcImc.classificacaoImc(null);

    expect(
        calcImc.toString(),
        equalsIgnoringCase(
            'João Ricardo Lima tem o Imc de 34.29 classificado em Obesidade Grau 1'));
  });

  test(
      'Testando o método toString metodo do CalImc chamando sem chamar o método classificaoImc',
      () {
    Pessoa pessoa = Pessoa.inicializa('João Ricardo Lima', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);
    double result = calcImc.calcularImc();

    expect(
        calcImc.toString(),
        equalsIgnoringCase(
            'João Ricardo Lima tem o Imc de 34.29 classificado em Obesidade Grau 1'));
  });

  test('Testando exeção pessoa nula', () {
    CalcImc calcImc = CalcImc();

    expect(() => calcImc.calcularImc(), throwsA(TypeMatcher<Exception>()));
  });

  test('Testando exeção nome nulo/vazio', () {
    Pessoa pessoa = Pessoa.inicializa('', 105, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(() => calcImc.calcularImc(), throwsA(TypeMatcher<Exception>()));
  });

  test('Testando exeção peso menor que zero', () {
    Pessoa pessoa = Pessoa.inicializa('João', -1, 1.75);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(() => calcImc.calcularImc(), throwsA(TypeMatcher<Exception>()));
  });

  test('Testando exeção Altura igual a zero', () {
    Pessoa pessoa = Pessoa.inicializa('João', 105, 0);
    CalcImc calcImc = CalcImc.inicializa(pessoa);

    expect(() => calcImc.calcularImc(), throwsA(TypeMatcher<Exception>()));
  });
}
