$ dart2js -o app.js main.dart
Compiled [...] characters Dart to [...] characters JavaScript in [...] seconds
Dart file main.dart compiled to JavaScript: app.js

import 'dart:html';

main() {
  var kysymykset = [];
  
  var vaihtoehdot = [];
  vaihtoehdot.add({'teksti': 'Kyllä', 'oikein': true});
  vaihtoehdot.add({'teksti': 'Ei', 'oikein': false});
  
  kysymykset.add({
    'teksti': 'Siistiä?',
    'vaihtoehdot': vaihtoehdot
  });

  kysymykset.add({
    'teksti': 'Toimiiko?',
    'vaihtoehdot': vaihtoehdot
  });
  
  querySelector('#seuraava').onClick.listen((e) {
    kysymykset.shuffle();
    asetaKysymys(kysymykset[0]);
  });
}

asetaKysymys(kysymys) {
  asetaKysymysteksti(kysymys['teksti']);
  asetaVastausvaihtoehdot(kysymys['vaihtoehdot']);
}

asetaKysymysteksti(teksti) {
  querySelector('#kysymys').text = teksti;
}

asetaVastausvaihtoehdot(vaihtoehdot) {
  querySelector('#vastaukset').children.clear();
  
  for (var i = 0; i < vaihtoehdot.length; i++) {
    lisaaVastausvaihtoehto(vaihtoehdot[i]);
  }
}

lisaaVastausvaihtoehto(vaihtoehto) {
  var elementti = Element.div();
  elementti.className = 'vaihtoehto';
  elementti.text = vaihtoehto['teksti'];

  elementti.onClick.listen((e) {
    if (vaihtoehto['oikein']) {
      elementti.text = 'oikein!';
    } else {
      elementti.text = 'väärin!';
    }
  });

  querySelector('#vastaukset').children.add(elementti);
}