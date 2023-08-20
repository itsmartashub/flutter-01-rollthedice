import 'package:flutter/material.dart';

// koristicemo u GradientContainer-u
class StyledText extends StatelessWidget {
  // const StyledText({super.key});
 /* 
  const StyledText(String text, {super.key}): outputText = text;
  // prihvatamo dynamic values text, i ispred dodajemo type annonations String
  String outputText; */

 /* 
  StyledText(this.text, {super.key});
  String text; */

  const StyledText(this.text, {super.key});
  final String text;

  /* i ovo text ne mozemo sad dole u Widget samo koristiti kao outputText, jer je tako nedostupno, iako su u istoj klasi, ovo sto ide u const StyledText i Widget su detached. Dodacemo ovu outputText variable tako sto cemo napisati String outputText;. Ne mozemo var outputText; jer ako ne settujemo neku vrednost, onda bolje koristiti value type, a to je u ovom slucaju String
  ```   const StyledText(String text, {super.key}): outputText = text; 
  ``` String outputText;
  - Medjutim, posto koristimo {super.key} varijantu, onda umesto ovog Super text pisemo this.text, i onda ovo dole String outputText; mora biti isti naziv tj text tj String text;
  - I sada takodje moramo obrisati const ispred StyledText jer kada koristimo this.text ovo prestaje da bude obelezeno kao potencijalni const object, jer ovaj text je dinamicki i mogao bi posle da se promeni. A takodje prisemo const i ispred return const Text
  
  ! Takodje, mozemo ispred String text da dodamo final da jasno stavimo do znanja da ce to da se setuje SAMO JEDNOM od strane ovog this,text argumenta koji je primljen, i nece se menjati posle. I onda mozemo ponoco vratiti const ispred  StyledText(this.text, {super.key}); jer moze ponovo biti optimizovano, jer ako garantujemo sa final da se taj dinamicki text nece menjati unutar klase, onda mozemo ovu klasu StyledText() da okaraktrerisemo kao uvek isti object koji se nece menjati kada se app inicijalizuje, te moze biti kesirano i reused by Dart */

  @override
  Widget build(context) {
    // return const Text('Hello World!',
    return Text(
        text,
        style: const TextStyle(
          color: Color.fromARGB(255, 127, 83, 145),
          fontSize: 28,
          fontWeight: FontWeight.bold)
        );
  }
}
