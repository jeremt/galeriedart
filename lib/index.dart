
// On importe la bibliothèque galerie

import 'gallery.dart';

void main() {

  // on instancie une nouvelle galerie

  Gallery gallery = new Gallery('.gallery');

  // puis on ajoute une photo

  gallery.add({
    'content': "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.",
    'src': "http://sphotos-c.ak.fbcdn.net/hphotos-ak-ash3/536313_124144454407454_279058676_n.png",
    'likes': "42"
  });

  gallery.load('http://graph.facebook.com/124179747737258/photos', () {
    print("hello");
    gallery.render();
  });

  // et enfin on génère le html :)


}
