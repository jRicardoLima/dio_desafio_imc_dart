import 'package:desafio_imc_app/entity/Pessoa.dart';
import 'package:test/test.dart';

void main() {
  test('Testando o construtor e métodos gets da classe pessoa', () {
    Pessoa pessoa = Pessoa.inicializa("João Ricardo Lima", 105.0, 1.75);

    expect(pessoa, isA<Pessoa>());
    expect(pessoa.getNome(), equalsIgnoringCase("João Ricardo Lima"));
    expect(pessoa.getPeso(), equals(105.0));
    expect(pessoa.getAltura(), equals(1.75));
  });

  test('Testando métodos sets da classe pessoa', () {
    Pessoa pessoa = Pessoa();

    pessoa.setNome('Jessica Dyana Mello Dos Santos Lima');
    pessoa.setPeso(75.6);
    pessoa.setAltura(1.70);

    expect(pessoa.getNome(),
        equalsIgnoringCase('Jessica Dyana Mello Dos Santos Lima'));
    expect(pessoa.getPeso(), equals(75.6));
    expect(pessoa.getAltura(), equals(1.70));
  });
}
