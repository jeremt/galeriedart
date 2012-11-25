
library photo;

import 'dart:html';

class Photo {

  Element el;
  ParagraphElement p;
  ButtonElement btn;
  Map _data;

  Photo(Map data) {

    _data = data;

    el = new DivElement();
    el.classes.add('photo');

    // add image
    ImageElement img = new ImageElement();
    img.src = _data['src'];
    el.elements.add(img);

    // add legend
    p = new ParagraphElement();
    p.text = _data['summary'];
    el.elements.add(p);

    // add more btn
    if (_data['summary'].length < _data['content'].length) {
      btn = new ButtonElement();
      btn.text = '+';
      btn.style.float = 'right';
      btn.on.click.add(expand);
      el.elements.add(btn);
    }

    // add likes
    DivElement div = new DivElement();
    div.classes.add('like');
    div.text = "❤ ${_data['likes']}";
    el.elements.add(div);

  }

  void expand(Event e) {
    p.text = _data['content'];
    btn.remove();
  }

}