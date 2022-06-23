import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: RiveAnimation.asset('assets/robo.riv'),
            ),
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
    );
  }
}
