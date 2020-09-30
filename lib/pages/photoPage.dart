import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gallery_task/models/PhotoItem.dart';

class PhotoPage extends StatelessWidget {
  final PhotoItem photoItem;

  const PhotoPage(this.photoItem, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(photoItem.name),
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          child: Image.network(
            photoItem.fullImageUrl,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                  child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes
                          : null));
            },
          ),
        )
      );
  }
}
