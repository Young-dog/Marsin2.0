import 'package:flutter/material.dart';

class ImageAboutUs extends StatelessWidget {
  const ImageAboutUs({Key? key}) : super(key: key);

  final imageAboutUs = 'https://firebasestorage.googleapis.com/v0/b/marsin-e4819.appspot.com/o/image_for_site%2Fchocolate_about_us.png?alt=media&token=f532a155-d49e-45dc-8f49-ff592575ff8a';

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Image.network(imageAboutUs),
        ]);
  }
}
