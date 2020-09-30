import 'package:flutter/widgets.dart';

class InternetImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const InternetImage(
      {Key key, this.imageUrl, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        imageUrl,
        width: width,
        height: height,
      ),
    );
  }
}
