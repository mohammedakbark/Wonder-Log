class AddNewPost {
  String uid;
  String? placeId;
  String imageUrl;
  String placeName;
  String placeDescription;
  String status;
  double rating;

  AddNewPost(
      {required this.placeDescription,
      required this.imageUrl,
      required this.placeName,
      required this.rating,
       this.placeId,
      required this.uid,
      required this.status});

  Map<String, dynamic> toJson(id) => {
        "imageUrl": imageUrl,
        "placeName": placeName,
        "placeDescription": placeDescription,
        "status": status,
        "rating": rating,
        "uid": uid,
        "placeId": id
      };
  factory AddNewPost.fromJson(Map<String, dynamic> json) {
    return AddNewPost(
        placeDescription: json["placeDescription"],
        imageUrl: json["imageUrl"],
        placeName: json["placeName"],
        rating: json["rating"],
        placeId: json["placeId"],
        uid: json["uid"],
        status: json["status"]);
  }
}
