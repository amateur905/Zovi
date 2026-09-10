class EventModel {
  final String id;
  final String title;
  final String category;
  final String location;
  final DateTime dateTime;
  final int spotsTotal;
  final int spotsTaken;
  final String hostName;
  final String description;

  EventModel({
    required this.id,
    required this.title,
    required this.category,
    required this.location,
    required this.dateTime,
    required this.spotsTotal,
    required this.spotsTaken,
    required this.hostName,
    required this.description,
  });

  int get spotsLeft => spotsTotal - spotsTaken;

  EventModel copyWith({int? spotsTaken}) {
    return EventModel(
      id: id,
      title: title,
      category: category,
      location: location,
      dateTime: dateTime,
      spotsTotal: spotsTotal,
      spotsTaken: spotsTaken ?? this.spotsTaken,
      hostName: hostName,
      description: description,
    );
  }
}
