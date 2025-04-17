class MealModel {
  final int id;
  final String img;
  final String title;
  final String description;
  final String rate;
  final String time;

  MealModel({
    required this.id,
    required this.img,
    required this.title,
    required this.description,
    required this.rate,
    required this.time,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: json['id'],
      img: json['img'],
      title: json['title'],
      description: json['description'],
      rate: json['rate'],
      time: json['time'],
    );
  }
}