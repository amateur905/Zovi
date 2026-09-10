import '../models/event.dart';
import '../models/user.dart';
import '../models/game.dart';

class MockData {
  static final UserModel currentUser = UserModel(
    id: 'u1',
    name: 'Тимур',
    city: 'Новосибирск',
    interests: ['Волейбол', 'Настолки', 'Йога'],
    rating: 47,
    eventsJoined: 12,
  );

  static final List<EventModel> events = [
    EventModel(
      id: 'e1',
      title: 'Волейбол на набережной',
      category: 'Спорт',
      location: 'Набережная, Новосибирск',
      dateTime: DateTime.now().add(const Duration(days: 1, hours: 3)),
      spotsTotal: 12,
      spotsTaken: 8,
      hostName: 'Алина',
      description: 'Собираем команду на дружеский матч, уровень любой.',
    ),
    EventModel(
      id: 'e2',
      title: 'Вечер настольных игр',
      category: 'Настолки',
      location: 'Антикафе "Компас"',
      dateTime: DateTime.now().add(const Duration(days: 2, hours: 5)),
      spotsTotal: 8,
      spotsTaken: 5,
      hostName: 'Марк',
      description: 'Мафия, каркассон, манчкин. Приходи с друзьями или один.',
    ),
    EventModel(
      id: 'e3',
      title: 'Утренняя йога в парке',
      category: 'Йога',
      location: 'Парк Березовая роща',
      dateTime: DateTime.now().add(const Duration(days: 1, hours: 12)),
      spotsTotal: 15,
      spotsTaken: 15,
      hostName: 'Светлана',
      description: 'Коврик с собой, для новичков и опытных.',
    ),
    EventModel(
      id: 'e4',
      title: 'Кроссфит на свежем воздухе',
      category: 'Спорт',
      location: 'Стадион "Спартак"',
      dateTime: DateTime.now().add(const Duration(days: 3, hours: 2)),
      spotsTotal: 10,
      spotsTaken: 3,
      hostName: 'Игорь',
      description: 'Функциональная тренировка для всех уровней подготовки.',
    ),
  ];

  static final List<GameModel> games = [
    GameModel(
      id: 'g1',
      title: 'Мафия онлайн-лобби',
      type: 'Мафия',
      playersMin: 6,
      playersMax: 10,
      playersJoined: 4,
      status: 'Набор игроков',
    ),
    GameModel(
      id: 'g2',
      title: 'Настольный теннис 1 на 1',
      type: 'Пинг-понг',
      playersMin: 2,
      playersMax: 2,
      playersJoined: 1,
      status: 'Ищем соперника',
    ),
    GameModel(
      id: 'g3',
      title: 'Квиз для компании',
      type: 'Квиз',
      playersMin: 4,
      playersMax: 8,
      playersJoined: 8,
      status: 'Полный состав',
    ),
  ];
}
