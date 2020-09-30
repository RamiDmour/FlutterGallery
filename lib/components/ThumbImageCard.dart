import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gallery_task/models/PhotoItem.dart';
import 'package:flutter_gallery_task/pages/photoPage.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class ThumbImageCard extends StatelessWidget {
  final PhotoItem photoItem;
  const ThumbImageCard(this.photoItem, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TouchableOpacity(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PhotoPage(photoItem)));
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: Image.network(photoItem.thumbImageUrl).image,
                    fit: BoxFit.fill),
              ),
            ),
            Container(
              color: Color.fromRGBO(38, 12, 12, 0.4),
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  photoItem.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                )
            ),
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.all(8),
                child: Text(
                  "@" + photoItem.authorName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
            )
          ],
        ),
      ),
    );
  }
}
