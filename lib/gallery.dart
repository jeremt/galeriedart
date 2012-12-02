
// On déclare notre bibliothèque

library gallery;

// on importe les libs dont on a besoin

import 'dart:html';
import 'dart:math';
import 'package:request/request.dart';

// et les fragments de la bibliothèque

part 'photo.dart';

// puis on déclare la classe

class Gallery {

  // les classes peuvent avoir des propriétés privées...

  List _photos = [];

  // ...ou publiques

  Element el;

  // On construit la classe à partir d'un selecteur css,
  // et d'une map (optionnelle) de données

  Gallery(String selector, [Map data]) {
    el = query(selector);
    el.text = '';
  }

  // Cette méthode va ajouter une nouvelle photo à la galerie

  void add(Map content) {
    _photos.add(new Photo(content));
  }

  // et celle-ci génère le html à partir des `_photos`.

  void render() {
    for (int i = 0 ; i < _photos.length ; i++)
      el.elements.add(_photos[i].el);
  }

  // On ajoute les photos de FB dans la galerie :)

  void load(String url, Function cb) {
    Request req = new Request();

    req.get(url, (res) {
      req.data['data'].forEach((Map album) {
        add({
          'content': album['name'],
          'src': album['source'],
          'likes': album['likes'] != null ? album['likes']['data'].length : 0
        });
      });
      cb();
    });
  }

}