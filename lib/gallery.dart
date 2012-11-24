
library gallery;

import 'dart:html';
import 'photo.dart';

class Gallery {

  List _photos = [];
  Element el;

  Gallery(String selector, Map data) {
    _photos = _parse(data);
    el = query(selector);
  }

  /**
   * Epure json response and keep only what we need.
   */

  List _parse(Map json) {
    List res = [];

    json['data'].forEach((Map album) {
      res.add({
        'name': album['name'],
        'src': album['images'][0]['source'],
        'width': album['images'][0]['width'],
        'height': album['images'][0]['height'],
        'likes': album['likes'] != null ? album['likes']['data'].length : 0
      });
    });
    return res;
  }

  /**
   * Render the dom.
   */

  void render() {
    for (int i = 0 ; i < _photos.length ; i++) {
      Photo photo = new Photo(_photos[i]);
      el.elements.add(photo.el);
    }
  }

}