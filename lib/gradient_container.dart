import 'package:flutter/material.dart';
import 'package:first_app/styled_text.dart';

// Alignment? startAlignment; // startAlignment ce biti ili type Alignment ili null, to ovaj upitnik znaci
//? var variable
// var startAlignment = Alignment.topLeft;
// var endAlignment = Alignment.bottomRight;

//? final variable
//* znaci da ovaj data container (startAlignment/endAlignment itd) nikad nece primiti novu vrednost
// final startAlignment = Alignment.topLeft;
// final endAlignment = Alignment.bottomRight;

//? const variable
/* skoro isto kao final, ali za razliku od final, const daje Dartu extra informaciju: naime, kada koristimo const s leve strane = , govorimo Dartu da je vrednost koju tu cuvamo compailed time constant. Sto znaci da je zakljucano neke vreme dok se ovaj kod ne kompajlira. Dakle, znamo vrednost i ona je ista sve do trenutka kompajliranja koda.
Recimo da je vrednost startAlignmenta neka f-ja npr getAlignment(), i ona bi mozda u pozadini izracunavala startAlignment promenljivu. To znaci da bi ova fn morala da se izvrsi kada se ova aplikacija pokrene da bi dohvatila pravu Alignment vrednost. U tom slucaju bi mozda bolje bilo da stavimo final, ali nije kompajlirana u konstanti jer vrednost koja bi mogla biti vracena getAlignment f-jom, nije poznata sve dok se kod ne kompajlira. Dakle poznata je samo kada se kod IZVRSI
A to je drugacije od Alignment.topLeft, jer je ova vrednost lockovana sve dok se vrednost ne kompajlira, dakle top left jasno ukazuje da je to topLeft deo ekrana.
const-om ovde govorimo Dartu va ovo nije dinamicki derived at runtime, vec moze biti lockovano
I to je takodje performanse improvement, jer ako je neka vrednost lockovana at the point of code is compiled, taj kod onda ne mora da se izvrsava kad se App executuje. KAO RAZUMELA SAM AL NISAM */
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

// // StatelessWidget je flutter class-a
// class GradientContainer extends StatelessWidget {
//   //? constructor fn
// //   const GradientContainer({key}) : super(key: key);
//   // const GradientContainer({super.key});// position argument
//   const GradientContainer({super.key, required this.colors}); // name argument, alternativa za position argument. name arguments su optional, a posto nama ovaj colors ne treba da bude optional vec obavezan, dodajemo ispred required

//   /*  ovaj key argument treba da bude prosledjen StatelessWidget f-ji. nakon dve tacke, tj : gde dohvatamo parent klasu koju nasledjujemo pisuci special keyword u Dartu, a to je super koja se executuje kao f-ja. Naime, super refers to the parent class (StatelessWidget in this case). Prvo key u super(key) se odnosi na StatelessWidget key, a drugo key u super(key: key) se odnosi na key ovde, koji prosledjujemo StatelessWidgetu. Ali posto se to mng x ponvlja, Flutter je omogucio da se to pise direkt u GradientContainer-u
  
//   Takodje, ovde ispred constructora koristimo const da bismo unlock-ovali rec "const" kada god negde u projectu pozivamo ovaj nas custom widget */

//   final List<Color> colors; // ! i moramo da obrisemo const ispred BoxDecoration jer colors je lista, iako je final, a liste u Dartu difoltno ne mogu biti editovane. Dakle ne moze biti mutable iako je final

//   @override // is not technically required, ali je trebao bi da daodamo jer uikazuje da je overwridujemo metod koji je ocekivan by StatelessWidget
//   Widget build(context) {
//     // build() must return as widget i zato dodajemo Widget ispred build() (returned value type). Takodje, build() mora da prihvati parametar context/ctx. build() ce da nadje tvoj widget (dakle ovaj GradientContainer) unutar nekog drugog widgeta ili ce biti prosledjen u runApp() f-ji
//     // void znaci da vratimo nista. a build() treba da vraca widget. a to radimo sa return, i vraticemo ono sto hocemo da vratumo a i zelimo da vratimo widget. u nasem slucaju to ce biti sve sto je u body gore, dakle":
    

//     return Container(
//       // BoxDecoration je object koji je takodje i type decoration, uff
//       // decoration: const BoxDecoration( // ! zbog colors liste brisemo const ovde
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               // zelimo listu boja
//               // colors: [
//               //   Color.fromARGB(255, 195, 152, 242),
//               //   Color.fromARGB(255, 249, 173, 193),
//               // ],  // gradient odakle da krece, posto je difoltno od left to right
//               colors: colors,
//               begin: startAlignment,
//               end: endAlignment)),
//       child: const Center(
//         // child: Text('Hello World!'),
//         // child: Text(
//         //   'Hello World!',
//         //   style: TextStyle(
//         //       color: Color.fromARGB(255, 127, 83, 145),
//         //       fontSize: 28,
//         //       fontWeight: FontWeight.bold),
//         // ),
//         child: StyledText('Helloooo brooo'),
//       ),
//     );
//   }
// }


//@ ALTERNATIVA ZA COLORS
// StatelessWidget je flutter class-a
class GradientContainer extends StatelessWidget {
  //? constructor fn
//   const GradientContainer({key}) : super(key: key);
  // const GradientContainer({super.key});// position argument
  const GradientContainer(this.color1, this.color2, {super.key}); //! positional argument su uvek required

// i ovo postoji, dakle mozemo dodati multiple constructor fns istoj klasi
  // const GradientContainer.purple({super.key})
  //   : color1 = Color.fromARGB(255, 195, 152, 242),
  //     color2 = Color.fromARGB(255, 249, 173, 193);

  /*  ovaj key argument treba da bude prosledjen StatelessWidget f-ji. nakon dve tacke, tj : gde dohvatamo parent klasu koju nasledjujemo pisuci special keyword u Dartu, a to je super koja se executuje kao f-ja. Naime, super refers to the parent class (StatelessWidget in this case). Prvo key u super(key) se odnosi na StatelessWidget key, a drugo key u super(key: key) se odnosi na key ovde, koji prosledjujemo StatelessWidgetu. Ali posto se to mng x ponvlja, Flutter je omogucio da se to pise direkt u GradientContainer-u
  
  Takodje, ovde ispred constructora koristimo const da bismo unlock-ovali rec "const" kada god negde u projectu pozivamo ovaj nas custom widget */

  final Color color1;
  final Color color2;

  @override // is not technically required, ali je trebao bi da daodamo jer uikazuje da je overwridujemo metod koji je ocekivan by StatelessWidget
  Widget build(context) {
    // build() must return as widget i zato dodajemo Widget ispred build() (returned value type). Takodje, build() mora da prihvati parametar context/ctx. build() ce da nadje tvoj widget (dakle ovaj GradientContainer) unutar nekog drugog widgeta ili ce biti prosledjen u runApp() f-ji
    // void znaci da vratimo nista. a build() treba da vraca widget. a to radimo sa return, i vraticemo ono sto hocemo da vratumo a i zelimo da vratimo widget. u nasem slucaju to ce biti sve sto je u body gore, dakle":
    

    return Container(
      // BoxDecoration je object koji je takodje i type decoration, uff
      // decoration: const BoxDecoration( // ! zbog colors liste brisemo const ovde
      decoration: BoxDecoration(
          gradient: LinearGradient(
              // zelimo listu boja
              // colors: [
              //   Color.fromARGB(255, 195, 152, 242),
              //   Color.fromARGB(255, 249, 173, 193),
              // ],  // gradient odakle da krece, posto je difoltno od left to right
              colors: [color1, color2],
              begin: startAlignment,
              end: endAlignment)),
      // child: const Center(
      child: Center(
        // child: Text('Hello World!'),
        // child: Text(
        //   'Hello World!',
        //   style: TextStyle(
        //       color: Color.fromARGB(255, 127, 83, 145),
        //       fontSize: 28,
        //       fontWeight: FontWeight.bold),
        // ),
        // child: StyledText('Helloooo brooo'),
        child: Image.asset('assets/images/dice-2.png', width: 200), //* posto koristimo Image, on je dynamic widget, a cim je dynamic ne moze da se garantuje da ce biti const, dakle moramo ga ukloniti iz Center
      ),
    );
  }
}
