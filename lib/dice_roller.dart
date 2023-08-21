import 'package:flutter/material.dart';

//? I KLASA
class DiceRoller extends StatefulWidget {
  /* ! Kada imamo StatefulWidget, NE DODAJEMO build() method. Umesto toga, ovde moramo da dodamo createState() method. On ne prihvata value, ali vraca value, tj State object
  
  ! State je GENERIC value type. Zato moramo da dodamo <> da informisemo Dart koju vrstu state cemo ovde menadzovati. A u ovom slucaju to bi trebalo da bude state u DiceRoller klasi, dakle za DiceRoller widget. Zato u <> stavljamo IME NASE KLASE, tj <DiceRoller>

  - I onda u body-u ovog createState metoda moramo vratiti State value, tj vrednost koja ima ovaj tip. A ova vrednost se kreira jos jednom novom klasom. Naime, kada radimo sa StatefulWidget uvek cemo raditi sa dve klase
  */

  const DiceRoller({super.key});
  // ovde ispred DiceRoller mozemo staviti const iako je StatefulWidget jer imamo ovu separaciju klasa

  @override
  State<DiceRoller> createState() {
    //? II KLASA
    return _DiceRollerState();
  }
}

//? II KLASA - donja crtica govori Dartu da ce ova klasa biti PRIVATE, dakle koristice se samo u ovom file, iako importujemo ovaj file u neki drugi file, taj drugi file nece moci da pristupi ovoj state klasi ovde
class _DiceRollerState extends State<DiceRoller> {
  var activeDiceImage = 'assets/images/dice-2.png';

  void rollDice() {
    /* 
    @ JAKO BITNA FN ZA DINAMICKO MENJANJE SADRZAJA. Re-executuje build() sto je neophodno za apdejtovanje UI-a. setState() se nalazi u State klasi. Ovom metodu se mora proslediti fn, i obicno je to anonymus fn. I unutar nje stavljamo ono sto zelimo da apdejtujemo
    Dakle setState govori Flutteru da re-execuduje build() fn ove DiceRolleState klase, i posto executuje build, ocekuje se da se UI promeni */
    setState(() {
      activeDiceImage = 'assets/images/dice-4.png';
    });

    // activeDiceImage = 'assets/images/dice-4.png';
    // print('Changing image ...');
  }

  @override
  Widget build(context) {
    /* * Column je ako ce imati u nejmu dva elementa koja su vertikalno postavljeni (jedan ispod drugog). Inace, Column zauzima citav vertikalan height, a da bismo centrirali vertikalno moramo da promenimo to da je on full height. Tu ce nam pomoci mainAxisSize */
    return Column(
      mainAxisSize: MainAxisSize.min,
      // MainAxisSize | MainAxisSize.min | MainAxisSize.max. Ima tri vrednosti, difoltna je MainAxisSize, sto znaci da zauzima citav dostupan height. Mi zelimo MainAxisSize.min

      children: [
        Image.asset(activeDiceImage, width: 200),
        //* posto koristimo Image, on je dynamic widget, a cim je dynamic ne moze da se garantuje da ce biti const, dakle moramo ga ukloniti iz Center
        /* - ElevatedButton(onPressed: onPressed, child: child) // za dugme koje ima bg color i blagu senku
        - OutlinedButton(onPressed: onPressed, child: child) // dugme koje nema bg color vec samo border
        - TextButton(onPressed: onPressed, child: child) // dugme koje je ustv samo pressible text, tj text na koje moze da se klikne */
        const SizedBox(height: 20),

        /* - child argument je jednostavniji, on samo zeli drugi widget koji ce biti wrapovan unutar ovog dugmeta, i tipicno to je Text() widget koji sadrzi text jelte.
        - onPressed argument je funkcija (ili null kao value) koja ce se izvrsiti kada se dugme klikne.
        U Dartu, funkcije su takodje objekti.
        - I sad tu mozemo koristiti anonymus fn (){...} tj direkt tu da je pisemo, a mozemo i da kreiramo metod negde gore tipa nakon sto smo definisali final Color, rollDice() koja bi trebalo da bude void, jer se na click ne vraca nista. I onda za vrednost onPressed pisemo ime tog metoda, ali ne i zxagrade, dakle ne executujemo ga tu.
        - mozemo dodati style argument, i pozeljno je da widget tj child argument bude poslednji */
        TextButton(
            //__ 1. arg
            onPressed: rollDice,
            //__ 2. arg
            style: TextButton.styleFrom(
                /*
            - EdgeInsets.all(value) je space u svim stranama , ili EdgeInsets.only(top: value) za samo top padding. Elem, umesto ovog sa paddingom, da bismo dodali space izmedju slike u dugmeta mozemo koristiti i SizedBox(height: value) widget gore ispod Image.asset. Ali njime kao da dodajemo neki widget te visine, koji zapravo ne vidimo jer se u njemu ne nalazi nista, ali zauzima tu visinu koju smo definisali.
            - To je ujedno i bitna razlika izmedju SizedBox i drugih widgeta, recimo Container, etc, koji zauzimaju height i width koliki im treba da bi fitovali sadrzaj unutar sebe. Recimo TExt widget je visok i sirok koliko god je potrebno da bi prikazao zadati text */

                // padding: const EdgeInsets.only(top: 20),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28)),
            //__ 3. arg
            child: const Text('Roll Dice'))
      ],
    );
  }
}
