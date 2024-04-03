class UserModel {
  String ?uid;
  String name;
  String email;
  String bio;
  String imageUrl;

  UserModel(
      {required this.bio,
      required this.email,
      required this.imageUrl,
      required this.name,
       this.uid});

  Map<String, dynamic> tojson(id) => {
        "uid": id,
        "name": name,
        "email": email,
        "bio": bio,
        "imageUrl": imageUrl
      };
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        bio: json["bio"],
        email: json["email"],
        imageUrl: json["imageUrl"],
        name: json["name"],
        uid: json["uid"]);
  }
}
