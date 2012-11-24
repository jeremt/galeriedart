
import 'package:request/request.dart';
import 'lib/gallery.dart';

void main() {

  Request req = new Request();
  Gallery gallery;

  req.get('http://graph.facebook.com/124179747737258/photos', (res) {
    gallery = new Gallery('.fb-gallery', req.data);

    gallery.render();
  });

}
