
// On peut dire explicitement que ce fichier est une partie
// de la bibliotèque gallery

part of gallery;

// et on déclare la classe

class Photo {

  DivElement el;
  ParagraphElement p;
  ButtonElement btn;
  Map _data;

  Photo(Map data) {

    // On stocke data pour y accéder via les autres méthodes.

    _data = data;

    // On va donc créer une div de classe photo, qui contient
    // tous les sous élements :

    el = new DivElement();
    el.classes.add('photo');

    // puis on va ajouter une propriété css qui va tourner
    // la photo aléatoirement

    int rot = new Random().nextInt(6) - 3;
    el.style.transform = "rotate(${rot}deg)";

    // ensuite on génère l'image à partir de data['src']

    ImageElement img = new ImageElement();
    img.src = _data['src'];
    // et on l'ajoute à la photo
    el.elements.add(img);

    // pareil pour la description :

    p = new ParagraphElement();
    p.text = _limit(_data['content']);
    el.elements.add(p);

    // et les likes :

    DivElement div = new DivElement();
    div.classes.add('like');
    div.text = "❤ ${_data['likes']}";
    el.elements.add(div);

    // On va afficher le texte complet au click sur le bouton +

    btn = new ButtonElement();
    btn.text = '+';
    btn.style.float = 'right';
    btn.on.click.add(_expand);
    el.elements.add(btn);

  }

  // La methode privée suivante permet de limiter
  // la taille du texte :

  String _limit(String str, [int limit = 42]) {
    List words = str.split(' ');
    int len = 0;

    for (int i = 0 ; i < words.length ; i++) {
      if (len >= limit)
        return "${str.substring(0, len - 1)}...";
      len += words[i].length + 1;
    }
    return str;
  }

  // La méthode expand remplace le résumé par la totalité du texte

  void _expand(Event e) {
    if (btn.text == '+') { // on affiche tout le texte
      p.text = _data['content'];
      btn.text = '-';
    } else { // on affiche le resume uniquement
      p.text = _limit(_data['content']);
      btn.text = '+';
    }
  }

}