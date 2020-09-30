import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_gallery_task/components/ThumbImageCard.dart';
import 'package:flutter_gallery_task/models/PhotoItem.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key key}) : super(key: key);

  Future<List<PhotoItem>> fetchPhotos() async {
    String url =
        'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0';

    var response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      var photos = jsonResponse
          .map((photoItem) => PhotoItem.fromJson(photoItem))
          .toList();
      return photos;
    } else {
      print('Error');
      throw Exception('Failed to Load Photo');
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<List<PhotoItem>> photos = fetchPhotos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Just Photos :)'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return FutureBuilder(
            future: photos,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.landscape ? 4 : 2
                  ),
                  itemBuilder: (context, index) {
                    return (ThumbImageCard(snapshot.data[index]));
                  },
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              }
              return Center(child: Text("Loading..."));
            });
      }),
    );
  }
}
