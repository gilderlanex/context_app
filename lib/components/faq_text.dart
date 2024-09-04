import 'package:context_app/components/title_text.dart';
import 'package:flutter/material.dart';

class FaqText extends StatelessWidget {
  const FaqText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10, top: 20, bottom: 20),
      child: Column(
        children: [
          TitleText('FAQ', Icons.help_center_outlined),
          ExpansionTile(
            title: Text('Como a ordem das palavras é definida?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: <Widget>[
              ListTile(title: Text('O jogo utiliza um algoritmo de inteligência artificial e milhares de textos para calcular a similaridade das palavras em relação à palavra do dia. Não necessariamente está relacionado ao significado das palavras, mas sim à proximidade em que elas são utilizadas na internet. Por exemplo, se a palavra do dia for “infinito”, palavras relacionadas a “amor” ou palavras relacionadas a “universo” podem estar próximas à palavra do dia porque “infinito” é comumente utilizada nesses dois contextos diferentes. Em raciocínio semelhante, se “tv” e “televisão”, por exemplo, estão em posições bem distintas, significa que são utilizadas de forma diferente em relação à palavra do dia, apesar de se tratarem do mesmo objeto.')),
            ],
          ),
          ExpansionTile(
            title: Text('Como posso pedir uma dica?', style: TextStyle(fontWeight: FontWeight.bold)),
            children: <Widget>[
              ListTile(title: Text('Clique nos três pontinhos localizados no lado direito superior da tela e selecione a opção “Dica”, que revelará uma palavra.')),
            ],
          ),
        ],
      ),
    );
  }
}
