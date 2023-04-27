import 'package:flutter/material.dart';

class StartImageForWidget extends StatelessWidget {
  const StartImageForWidget({Key? key}) : super(key: key);

  final startImage =
      'https://firebasestorage.googleapis.com/v0/b/marsin-e4819.appspot.com/o/image_for_site%2Fchocolate_for_start.png?alt=media&token=8dcb211b-34a6-4f9a-bb19-7ee65a208c16';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.network(startImage),
      ],
    );
  }
}
