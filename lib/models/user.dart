class UserModel {
  final String id;
  final String name;
  final String city;
  final List<String> interests;
  final int rating;
  final int eventsJoined;

  UserModel({
    required this.id,
    required this.name,
    required this.city,
    required this.interests,
    required this.rating,
    required this.eventsJoined,
  });
}
