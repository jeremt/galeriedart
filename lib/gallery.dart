
library gallery;

import 'dart:html';
import 'photo.dart';

/**
 * Create a gallery from facebook image data.
 */

class Gallery {

  List _photos = [];
  Element el;

  Gallery(String selector, Map data) {
    _photos = _parse(data);
    el = query(selector);
    el.text = '';
  }

  /**
   * Limit string size.
   */

  String _limit(String str, int limit) {
    List words = str.split(' ');
    int len = 0;

    for (int i = 0 ; i < words.length ; i++) {
      if (len >= limit)
        return "${str.substring(0, len - 1)}...";
      len += words[i].length + 1;
    }
    return str;
  }

  /**
   * Epure json response and keep only what we need.
   */

  List _parse(Map json) {
    List res = [];

    json['data'].forEach((Map album) {
      res.add({
        'content': album['name'],
        'summary': _limit(album['name'], 100),
        'src': album['source'],
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