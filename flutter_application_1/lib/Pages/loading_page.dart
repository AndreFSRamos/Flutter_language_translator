//Pagina meramente ilustrativa, para informar o usuario que os dados estão sendo
// carregados e que deve aguardar, é exibida somente durante a instalação ou caso
// seja preciso efeturar a requisição da API novamente. Ela contem uma animação
// do tipo RIV, um Text e um Circular Procresse.

import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            child: const RiveAnimation.asset('assets/robo3.riv'),
          ),
          SizedBox(
            child: Column(
              children: const [
                Text(
                  "Por favor Aguarde, estamos carregando seus dados.",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
