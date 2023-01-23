import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  
  var _imagemApp = AssetImage("Imagens/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";
  var _vitoria = 0;
  var _derrota = 0;
  var _empate = 0;

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(opcoes.length);
    var escolhaApp = opcoes[numero];

    //Exibição da imagem escolhida pelo App
    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("Imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("Imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("Imagens/tesoura.png");
        });
        break;
    }
    // Validar quem ganhou
    if (
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")

    ) {
      setState(() {
        this._mensagem = "Parabéns, você ganhou :D";
        _vitoria += 1;
      });

      //App Ganhador
    } else if (
    (escolhaUsuario == "tesoura" && escolhaApp == "pedra") ||
        (escolhaUsuario == "papel" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "pedra" && escolhaApp == "papel")

    ) {
      setState(() {
        this._mensagem = "Que pena, você perdeu :(";
        _derrota += 1;
      });
    } else {
      setState(() {
        this._mensagem = "Empate, tente de novo";
        _empate += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokepon"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image(image: this._imagemApp,),
            Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                _mensagem,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () => _opcaoSelecionada("pedra"),
                  child: Image.asset("Imagens/pedra.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("Imagens/papel.png", height: 100,),
                ),
                GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("Imagens/tesoura.png", height: 100,),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 32,),
              child: Text(
                "Vitória: " + _vitoria.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 32,),
              child: Text(
                "Derrota: " + _derrota.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 32,),
              child: Text(
                "Empate: " + _empate.toString(),
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
         ],
        ),
      ),
      );
  }
}
