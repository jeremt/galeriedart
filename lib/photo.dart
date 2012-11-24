
library photo;

import 'dart:html';

class Photo {

  Element el;

  Photo(Map data) {

    el = new DivElement();
    el.classes.add('photo');

    // add image
    ImageElement img = new ImageElement();
    img.src = data['src'];
    el.elements.add(img);

    // add legend
    ParagraphElement p = new ParagraphElement();
    p.text = data['name'];
    el.elements.add(p);

    // add likes
    DivElement div = new DivElement();
    div.classes.add('like');
    div.text = "❤ ${data['likes']}";
    el.elements.add(div);

  }

}