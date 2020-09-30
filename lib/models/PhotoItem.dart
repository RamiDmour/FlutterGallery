class PhotoItem {
  String thumbImageUrl;
  String fullImageUrl;
  String name;
  String authorName;

  // PhotoItem(
  //     {this.name, this.authorName, this.thumbImageUrl, this.fullImageUrl});
  PhotoItem(this.name, this.authorName, this.thumbImageUrl, this.fullImageUrl);

  factory PhotoItem.fromJson(Map<String, dynamic> json) {
  //   return PhotoItem(
  //       name: json['alt_description'],
  //       authorName: json['user']['name'],
  //       thumbImageUrl: json['urls']['thumb'],
  //       fullImageUrl: json['urls']['full']);
  // }
      return PhotoItem(
        json['alt_description'],
        json['user']['name'],
        json['urls']['thumb'],
        json['urls']['full']);
  }
}
