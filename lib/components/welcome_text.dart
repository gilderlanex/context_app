import 'package:context_app/components/title_text.dart';
import 'package:context_app/constants/colors.dart';
import 'package:context_app/constants/dimensions.dart';
import 'package:flutter/material.dart';


class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:  Dimensions.defaultPadding,
        decoration: BoxDecoration(
          color: AppColors.tipBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TitleText('Como jogar', Icons.help_outline),
            ),
            Text(
                'Descubra a palavra secreta do dia através do significado.\n\nDepois de enviar uma palavra, você verá o quão próxima ela está da resposta.\n\nPalavras são mais próximas quando são frequentemente utilizadas no mesmo contexto.',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
  }
}