import 'package:flutter/material.dart'; // za package pisemo package pa : pa package name
import 'package:first_app/gradient_container.dart'; //* importujemo nas custom widget koji smo kreirali prvo ovde, ali smo ga posle premestili u novi file gradient_container.dart. ovo first_app je dinamicno tj zavisi od imena naseg projecta tj root foldera

void main() {
  /* main fn je special fn u dart-u i ona ce se automatski pokrenuti kada pokrenemo aplikaciju na uredjaju. Dakle ovu fn ne moramo mi nigde da pozivamo sa main() */
  // void je return type

  // runApp(const MaterialApp(home: Text('Hello World!')));
  // runApp(const MaterialApp(home: Scaffold(Text('Hello World!'))));
  // runApp(const MaterialApp(home: Scaffold(body: Center(child: Text('Hello World!')))));
  runApp(
    const MaterialApp(
      home: Scaffold(
          // backgroundColor: null,
          // backgroundColor: Colors.deepPurple, // Color je type, mozemo koristiti Color() ili Colors.neka_boja
          // backgroundColor: Color.fromARGB(255, 47, 5, 120),

          // ! Premesticemo sve iz body: u poseban widget jer je vec nested. Za to moramo da kreiramo class-u
          body:
          //? PRVO RESENJE (name argument)
              // GradientContainer([
              //     Color.fromARGB(255, 195, 152, 242),
              //     Color.fromARGB(255, 249, 173, 193)
              // ]) // ovo poziva consturctor f-ju GradientContainer class-e. Mogu ovde const, ali mozda bolje ispred MAterialApp pa ne moram onda i ovde
          //? DRUGO RESENJE (positional argument)
            GradientContainer( Color.fromARGB(255, 195, 152, 242), Color.fromARGB(255, 249, 173, 193))
          ),
    ),
  );
}



/*
  the main process. Used to show some UI on the screen. runApp() dolazi iz Fluttera. Medjutim, to moramo negde da naznacimo, da kazemo nasoj app da dolazi iz Fluttera. Za to koristimo pubspec.yaml, tu manadzujemo third-party dependencies. Medjutim, vidimo da je flutter dodat tamo za dependencies. Ali, ova fn runApp() i dalje ne radi. To je jer mroamo da importujemo flutter odnosno
  
  runApp() ocekuje input values tj argumente. A runApp() mora da zna STA da prikaze na ekranu, dakle moramo mu proslediti sta da prikaze. runApp() needs a Widget argument. A Widget is a UI element that is displayed on the screen. Flutter interface je izgradjen od vidzeta, tj njihovom kombinacijom i mesanjem. Recimo text kreiramo u Text widgetima koje mozemo da kreiramo u Button widgetima, itd. Flutter ima vec built-in widgete poput buttons, form inputs, layout widgets... Ali takodje mozemo izgraditi custom widgete.
  
  Ok, dakle runApp()-u treba Widget, ali kako da znamo koji? I kako da dodamo widget u kod? Mozemo otici u Flutterov widget catalog: https://docs.flutter.dev/ui/widgets

? MaterialApp() Widget
  Koristicemo ovde MaterialApp widget koji nam provajdue Flutter, i mozemo mu pristupiti zahvaljuci ovom gore import 'package:flutter/material.dart';
  dakle isti flutter package (material.dart) koji nam daje pristup runApp-u, nam daje pristup i ovom MaterialApp widgetu.
  MaterialApp() deluje kao fn, ali je to klasa (Class) tj constructor f-ja klase, da budemo precizniji.
  Medjutim, moramo i MaterialApp() da prosledimo argument odnosno njemu govorimo sta ce se prikazivati na ekranu.
  I ovim, kada pozovemo MaterialApp() za zagradama, mi ustvari kreiramo Widget.
  MaterialApp ima zilion argumenata, mogu se proslediti random redosledom sa ({this.nekiMAArgument, ...}), ili direkt ime, ali je bitan redosled. Prosledicemo mu (home) koji mora da ima. Recimo stavicemo Text() widget.

? Text() Widget
  - Text() vidget takodje ima vise argumeanta, ali onaj koji moramo da napisemo jeste human-readable text, koji ide u '' ili ""

? const
  Elem, valjalo bi staviti const ispred MaterialApp() constructora jer ono pomaze Dart-u da optimizuje runtime performance of ur application. A zasto?
  Pa kada oznacimo nesto sa const, recimo Text('Hello World') widget, taj Text widget ce biti stored internally na memoriji uredjaja gde se app pokrece. Msm to se desava uvek, storovace se taj kod bilo da pozovemo sa const ili ne, ali kada koristimo const, ako ponovo recimo negde u app koristimo taj widget identican, dakle isti widget Text sa istim tekstom unutar njega, to sto je sacuvano u memoriji uredjaja ce se reused, odn iznova koristiti.
  Elem, ne moramo uciti napamet ispred kojih widgeta koristiti const, a ispred kojih ne, nas kod editor ce nam to ukazati sa podvucenom plavom curly linijom. Takodje ce biti plavo podvuceno ako koristimo const gde ne bi trebalo. Recimo ako bih stavila const i ispred MaterialApp i ispred Text() koji je unutar MA, to bi bilo beskorisno, jer ga vec koristimo u MA

? Scaffold
  - Sledeci widget koji ce nam pomoci da nasa app izgleda mng bolje. MA je root widget, koji je potreban za setovanje overall aplikacije. Ali mnoge app se koriste na razlicitim ekranima, i ti ekrani takodje moraju biti setovani. Zato cemo Text da wrappuejmo unutar Scaffolda sa:
   Scaffold(Text('Hello World!')), medjutim mozemo i samo proslediti argumente Scaffoldu, recimo body: gde ce sa body value da bude Text widget. I ovim je sad text prikazan skroz gore u levom uglu, i sitniji. Ofc, sada zelimo da ga centriramo negde. Koristicemo Center widget. I vec polako vidimo da koristimo widget unutar widgeta, koji je unutar widgeta, i vec gradimo kompleksan Widget Tree
  
? Center Widget
  - I sada hocemo da wrapujemo Text unutar Center, ali to necemo uraditi peske, vec cemo tu na taj kod kliknuti desni klik, i na Refactor, pa cemo izabrati "Wrap with Center". To je sada kreiralo: Center(child: Text('Hello World!'));

  Posto ovo vec postaje prenested, Dart nam omogucava tj preporucuje da koristimo patern koji ce boilje formatirati Trees. Tj dodajemo zarez iza svake zatvorene zagrade, osim iza poslednje gde nam treba semicolon. I sada je to prikazano mnogo lepse kao

? backgroundColor: Color() vs backgroundColor: Colors.neka_boja

? Container Widget
  - Vrlo zgodan za konfiguraciju stylinga i layout settingsa
  - Uklanjamo const iz MaterialApp i premestamo ispred Center, jer Container ne podrzava const i samim tim ne mozemo setovati const ni parent widgetima Containera (sto je bio MaterialApp u ovom slucaju)

? Generic Types


*/

// it is what it is - iiwii
