/// Мок-данные для верификации
///
/// Просто изменяйте данные здесь для тестирования
class VerificationMocks {
  // Общее количество записей для тестирования пагинации
  static const int totalUnverified = 35; // 4 страницы по 10 записей
  static const int totalVerified =
      25; // 3 страницы по 10 записей (последняя 5 записей)

  /// Список не верифицированных (старый формат для обратной совместимости)
  static final Map<String, dynamic> unverifiedList = {
    'verificationsList': [
      {
        'id': 1,
        'name': 'Иванов Иван Иванович',
        'email': 'ivanov@example.com',
        'phone': '+7 (999) 123-45-67',
        'status': 'pending',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      },
      {
        'id': 2,
        'name': 'Петрова Мария Сергеевна',
        'email': 'petrova@example.com',
        'phone': '+7 (999) 234-56-78',
        'status': 'pending',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      },
      {
        'id': 3,
        'name': 'Сидоров Петр Александрович',
        'email': 'sidorov@example.com',
        'phone': '+7 (999) 345-67-89',
        'status': 'pending',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      },
    ],
    'pagination': {'total': 3, 'limit': 10, 'page': 1, 'pages': 1},
  };

  /// Список верифицированных (старый формат для обратной совместимости)
  static final Map<String, dynamic> verifiedList = {
    'verificationsList': [
      {
        'id': 4,
        'name': 'Козлова Анна Владимировна',
        'email': 'kozlova@example.com',
        'phone': '+7 (999) 456-78-90',
        'status': 'verified',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      },
      {
        'id': 5,
        'name': 'Морозов Дмитрий Игоревич',
        'email': 'morozov@example.com',
        'phone': '+7 (999) 567-89-01',
        'status': 'verified',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      },
    ],
    'pagination': {'total': 2, 'limit': 10, 'page': 1, 'pages': 1},
  };

  /// Генерация мок-данных с пагинацией для не верифицированных
  static Map<String, dynamic> getUnverifiedListMock({
    int page = 1,
    int limit = 10,
  }) {
    final total = totalUnverified;
    final pages = (total / limit).ceil();
    final startIndex = (page - 1) * limit;
    final endIndex = (startIndex + limit > total) ? total : startIndex + limit;
    final itemsCount = endIndex - startIndex;

    final surnames = [
      'Иванов',
      'Петров',
      'Сидоров',
      'Козлов',
      'Морозов',
      'Смирнов',
      'Кузнецов',
      'Попов',
      'Васильев',
      'Петров',
      'Соколов',
      'Михайлов',
      'Новikov',
      'Федоров',
      'Морозов',
      'Волков',
      'Алексеев',
      'Лебедев',
      'Семенов',
      'Егоров',
      'Павлов',
      'Козлов',
      'Степанов',
      'Николаев',
      'Орлов',
      'Андреев',
      'Макаров',
      'Никитин',
      'Захаров',
      'Зайцев',
      'Соловьев',
      'Борисов',
      'Яковлев',
      'Григорьев',
      'Романов',
    ];

    final names = [
      'Иван',
      'Мария',
      'Петр',
      'Анна',
      'Дмитрий',
      'Елена',
      'Сергей',
      'Ольга',
      'Александр',
      'Наталья',
      'Андрей',
      'Татьяна',
      'Михаил',
      'Екатерина',
      'Владимир',
      'Юлия',
      'Алексей',
      'Ирина',
      'Максим',
      'Светлана',
      'Павел',
      'Марина',
      'Роман',
      'Анастасия',
      'Николай',
      'Виктория',
      'Артем',
      'Кристина',
      'Игорь',
      'Анжела',
      'Денис',
      'Валентина',
      'Станислав',
      'Людмила',
      'Вячеслав',
    ];

    final patronymics = [
      'Иванович',
      'Сергеевич',
      'Петрович',
      'Александрович',
      'Дмитриевич',
      'Владимирович',
      'Алексеевич',
      'Андреевич',
      'Николаевич',
      'Михайлович',
      'Ивановна',
      'Сергеевна',
      'Петровна',
      'Александровна',
      'Дмитриевна',
      'Владимировна',
      'Алексеевна',
      'Андреевна',
      'Николаевна',
      'Михайловна',
    ];

    final verificationsList = List.generate(itemsCount, (index) {
      final id = startIndex + index + 1;
      final surnameIndex = (id - 1) % surnames.length;
      final nameIndex = (id - 1) % names.length;
      final patronymicIndex = (id - 1) % patronymics.length;

      return {
        'id': id,
        'name':
            '${surnames[surnameIndex]} ${names[nameIndex]} ${patronymics[patronymicIndex]}',
        'email': 'user$id@example.com',
        'phone':
            '+7 (999) ${100 + (id % 900)}-${10 + (id % 90)}-${20 + (id % 80)}',
        'status': 'pending',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      };
    });

    return {
      'verificationsList': verificationsList,
      'pagination': {
        'total': total,
        'limit': limit,
        'page': page,
        'pages': pages,
      },
    };
  }

  /// Генерация мок-данных с пагинацией для верифицированных
  static Map<String, dynamic> getVerifiedListMock({
    int page = 1,
    int limit = 10,
  }) {
    final total = totalVerified;
    final pages = (total / limit).ceil();
    final startIndex = (page - 1) * limit;
    final endIndex = (startIndex + limit > total) ? total : startIndex + limit;
    final itemsCount = endIndex - startIndex;

    final surnames = [
      'Козлова',
      'Морозов',
      'Соколова',
      'Волков',
      'Лебедев',
      'Семенов',
      'Егоров',
      'Павлов',
      'Степанов',
      'Николаев',
      'Орлов',
      'Андреев',
      'Макаров',
      'Никитин',
      'Захаров',
      'Зайцев',
      'Соловьев',
      'Борисов',
      'Яковлев',
      'Григорьев',
      'Романов',
      'Титов',
      'Марков',
      'Белов',
      'Комаров',
    ];

    final names = [
      'Анна',
      'Дмитрий',
      'Елена',
      'Сергей',
      'Ольга',
      'Александр',
      'Наталья',
      'Андрей',
      'Татьяна',
      'Михаил',
      'Екатерина',
      'Владимир',
      'Юлия',
      'Алексей',
      'Ирина',
      'Максим',
      'Светлана',
      'Павел',
      'Марина',
      'Роман',
      'Анастасия',
      'Николай',
      'Виктория',
      'Артем',
      'Кристина',
    ];

    final patronymics = [
      'Владимировна',
      'Игоревич',
      'Сергеевна',
      'Петрович',
      'Александровна',
      'Дмитриевич',
      'Владимировна',
      'Алексеевич',
      'Андреевна',
      'Николаевич',
      'Михайлович',
      'Ивановна',
      'Сергеевна',
      'Петровна',
      'Александровна',
      'Дмитриевна',
      'Владимировна',
      'Алексеевна',
      'Андреевна',
      'Николаевна',
      'Михайловна',
      'Иванович',
      'Сергеевич',
      'Петрович',
      'Александрович',
    ];

    final verificationsList = List.generate(itemsCount, (index) {
      final id = startIndex + index + 1;
      final surnameIndex = (id - 1) % surnames.length;
      final nameIndex = (id - 1) % names.length;
      final patronymicIndex = (id - 1) % patronymics.length;

      return {
        'id': id + 100, // Чтобы ID не пересекались с не верифицированными
        'name':
            '${surnames[surnameIndex]} ${names[nameIndex]} ${patronymics[patronymicIndex]}',
        'email': 'verified$id@example.com',
        'phone':
            '+7 (999) ${200 + (id % 800)}-${30 + (id % 70)}-${40 + (id % 60)}',
        'status': 'verified',
        'selfLink': '/files/users/6/selfie.jpg',
        'passportFrontLink': '/files/users/6/passport_front.jpg',
        'passportBackLink': '/files/users/6/passport_back.jpg',
      };
    });

    return {
      'verificationsList': verificationsList,
      'pagination': {
        'total': total,
        'limit': limit,
        'page': page,
        'pages': pages,
      },
    };
  }
}
