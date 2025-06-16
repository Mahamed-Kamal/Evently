class TaskModel {
  // Attributes
  String? id;
  String? title;
  String? description;
  bool? isDone;
  int? date;
  int? time;
  String? userId;
  String? category;
  String? lat;
  String? long;
  bool isFavourite;

  TaskModel({
    this.id = "",
    this.title,
    this.description,
    this.isDone,
    this.date,
    this.time,
    this.category,
    this.lat,
    this.long,
    this.userId,
    this.isFavourite = false,
  });

  TaskModel.fromFireStore(Map<String, dynamic>? data)
    : this(
        id: data?["id"],
        title: data?["title"],
        description: data?["description"],
        isDone: data?["isDone"],
        date: data?["date"],
        time: data?["time"],
        userId: data?["userId"],
        category: data?["category"],
        lat: data?["lat"],
        long: data?["long"],
        isFavourite: data?["isFavourite"],
      );

  Map<String, dynamic> toFireStore() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "isDone": isDone,
      "date": date,
      "time": time,
      "userId": userId,
      "category": category,
      "lat": lat,
      "long": long,
      "isFavourite": isFavourite,
    };
  }
}
