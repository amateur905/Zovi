class GameModel {
  final String id;
  final String title;
  final String type;
  final int playersMin;
  final int playersMax;
  final int playersJoined;
  final String status;

  GameModel({
    required this.id,
    required this.title,
    required this.type,
    required this.playersMin,
    required this.playersMax,
    required this.playersJoined,
    required this.status,
  });

  bool get isFull => playersJoined >= playersMax;

  GameModel copyWith({int? playersJoined, String? status}) {
    return GameModel(
      id: id,
      title: title,
      type: type,
      playersMin: playersMin,
      playersMax: playersMax,
      playersJoined: playersJoined ?? this.playersJoined,
      status: status ?? this.status,
    );
  }
}
