class ReviewModel {
  double rating;
  String? reviewId;
  String uid;
  String postId;
  String review;
  String date;
  String time;

  ReviewModel(
      {required this.date,
     this. reviewId,
      required this.postId,
      required this.rating,
      required this.review,
      required this.time,
      required this.uid});

  Map<String, dynamic> toJson(id) => {
        "rating": rating,
        "reviewId":id,
        "uid": uid,
        "postId": postId,
        "review": review,
        "date": date,
        "time": time
      };

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
        date: json["date"],
        reviewId:json["reviewId"],
        postId: json["postId"],
        rating: json["rating"],
        review: json["review"],
        time: json["time"],
        uid: json["uid"]);
  }
}
