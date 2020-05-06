import 'package:flutter/material.dart';

void main() => runApp(Calculadora());

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  int primeiroNumero;
  int segundoNumero;
  String operacaoEscolhida;
  double resultado;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: <Widget>[
                  Numeros(onPrimeiroNumeroEscolhido),
                  Divider(),
                  Operacoes(onOperacaoEscolhida),
                  Divider(),
                  Numeros(onSegundoNumeroEscolhido),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      BotaoCalcular(
                          todasOpcoesForamEscolhidas() ? onClickBotao : null),
                      BotaoZerar(onClickBotaoZerar)
                    ],
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Text(
                        'Operação: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      primeiroNumero != null
                          ? Text(
                              primeiroNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      operacaoEscolhida != null
                          ? Text(
                              operacaoEscolhida,
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                      segundoNumero != null
                          ? Text(
                              segundoNumero.toString(),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Resultado: ',
                        style: TextStyle(fontSize: 28),
                      ),
                      resultado != null
                          ? Text(
                              resultado.toStringAsFixed(2),
                              style: TextStyle(fontSize: 28),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool todasOpcoesForamEscolhidas() {
    return primeiroNumero != null &&
        segundoNumero != null &&
        operacaoEscolhida != null;
  }

  void onClickBotao() {
    setState(() {
      if (operacaoEscolhida == '+') {
        resultado = (primeiroNumero + segundoNumero).toDouble();
      } else if (operacaoEscolhida == '-') {
        resultado = (primeiroNumero - segundoNumero).toDouble();
      } else if (operacaoEscolhida == '*') {
        resultado = (primeiroNumero * segundoNumero).toDouble();
      } else if (operacaoEscolhida == '/') {
        resultado = (primeiroNumero / segundoNumero).toDouble();
      } else if (operacaoEscolhida == '%') {
        resultado = (primeiroNumero % segundoNumero).toDouble();
      }
    });
  }

  void onClickBotaoZerar() {
    setState(() {
      primeiroNumero = null;
      segundoNumero = null;
      operacaoEscolhida = null;
      resultado = null;
    });
  }

  void onPrimeiroNumeroEscolhido(int numero) {
    setState(() {
      primeiroNumero = numero;
    });
  }

  void onSegundoNumeroEscolhido(int numero) {
    setState(() {
      segundoNumero = numero;
    });
  }

  void onOperacaoEscolhida(String operacao) {
    setState(() {
      operacaoEscolhida = operacao;
    });
  }
}

class BotaoZerar extends StatelessWidget {
  BotaoZerar(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Zerar',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class BotaoCalcular extends StatelessWidget {
  BotaoCalcular(this.onClickBotao);

  final VoidCallback onClickBotao;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: onClickBotao,
      child: Text(
        'Calcular',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Operacoes extends StatelessWidget {
  Operacoes(this.onOperacaoEscolhida);

  final Function(String) onOperacaoEscolhida;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        GestureDetector(
          onTap: () => onOperacaoEscolhida('+'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '+',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('-'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '-',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('*'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '*',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('/'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '/',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () => onOperacaoEscolhida('%'),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                '%',
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Numeros extends StatelessWidget {
  Numeros(this.onNumeroEscolhido);

  final Function(int) onNumeroEscolhido;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: getNumeros(),
    );
  }

  List<Widget> getNumeros() {
    List<Widget> numeros = [];

    for (int i = 0; i < 10; i++) {
      numeros.add(
        GestureDetector(
          onTap: () => onNumeroEscolhido(i),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Text(
                i.toString(),
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return numeros;
  }
}
