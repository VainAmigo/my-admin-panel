import 'package:admin_panel/server/server.dart';

/// Модель данных для анкеты клиента - физического лица
class ClientQuestionnaireModel {
  /// Статус клиента (РЕЗИДЕНТ/НЕРЕЗИДЕНТ)
  final String clientStatus;

  /// Фамилия
  final String? surname;

  /// Имя
  final String? name;

  /// Отчество (при наличии)
  final String? secondName;

  /// Дата рождения
  final String? dateOfBirth;

  /// Место рождения (при наличии)
  final String? placeOfBirth;

  /// Национальность (при наличии)
  final String? nationality;

  /// Пол
  final String? gender;

  /// Гражданство
  final String? citizenship;

  /// Наименование документа
  final String? documentName;

  /// Серия и номер документа
  final String? documentSeriesNumber;

  /// Дата выдачи документа
  final String? issueDate;

  /// Дата окончания срока действия документа
  final String? expiryDate;

  /// Наименование органа, выдавшего документ
  final String? issuingAuthority;

  /// Код подразделения (если имеется)
  final String? departmentCode;

  /// Персональный идентификационный номер
  final String? pin;

  /// Адрес места регистрации (при наличии в документе)
  final String? registrationAddress;

  /// Номер мобильного телефона
  final String? phoneNumber;

  /// Цель и предполагаемый характер деловых отношений клиента
  final String? businessPurpose;

  /// Является ли клиент публичным должностным лицом (ПДЛ)
  final String? isPDL;

  /// Является ли клиент конечным выгодоприобретателем
  final String? isBeneficiary;

  /// Вид анкеты (Первичная/Обновленная)
  final String questionnaireType;

  String? verificationResult;
  DateTime? verificationDate;
  String? sanctionsCheckResult;
  DateTime? sanctionsCheckDate;
  String? moneyLaunderingCheckResult;
  DateTime? moneyLaunderingCheckDate;
  String? terrorismCheckResult;
  DateTime? terrorismCheckDate;
  String? riskLevel;
  String? riskJustification;
  DateTime? lastUpdateDate;
  DateTime? nextUpdateDate;
  DateTime? createdDate;
  String? createrName;

  ClientQuestionnaireModel({
    this.clientStatus = 'РЕЗИДЕНТ',
    this.surname,
    this.name,
    this.secondName,
    this.dateOfBirth,
    this.placeOfBirth,
    this.nationality,
    this.gender,
    this.citizenship = 'КЫРГЫЗСКАЯ РЕСПУБЛИКА',
    this.documentName,
    this.documentSeriesNumber,
    this.issueDate,
    this.expiryDate,
    this.issuingAuthority,
    this.departmentCode,
    this.pin,
    this.registrationAddress,
    this.phoneNumber,
    this.businessPurpose = 'СТРАХОВАНИЕ',
    this.isPDL,
    this.isBeneficiary,
    this.questionnaireType = 'Первичная анкета',
    this.verificationResult,
    this.verificationDate,
    this.sanctionsCheckResult,
    this.sanctionsCheckDate,
    this.moneyLaunderingCheckResult,
    this.moneyLaunderingCheckDate,
    this.terrorismCheckResult,
    this.terrorismCheckDate,
    this.riskLevel,
    this.riskJustification,
    this.lastUpdateDate,
    this.nextUpdateDate,
    this.createdDate,
    this.createrName,
  });

  /// Создает модель из VerificationItem
  factory ClientQuestionnaireModel.fromVerificationItem(
    VerificationItem verificationItem,
  ) {
    // Парсим имя (может содержать фамилию, имя, отчество)
    final nameParts = _parseName(verificationItem.name);

    return ClientQuestionnaireModel(
      clientStatus: 'РЕЗИДЕНТ',
      surname: nameParts['surname'] ?? 'Иванов',
      name: nameParts['name'] ?? 'Иван',
      secondName: nameParts['secondName'] ?? 'Иванович',
      dateOfBirth: '15.05.1990',
      placeOfBirth: 'г. Бишкек',
      nationality: 'Кыргыз',
      gender: 'Мужской',
      citizenship: 'КЫРГЫЗСКАЯ РЕСПУБЛИКА',
      documentName: 'Паспорт гражданина Кыргызской Республики',
      documentSeriesNumber: 'ID 1234567',
      issueDate: '10.01.2015',
      expiryDate: '10.01.2025',
      issuingAuthority: 'УВД г. Бишкек',
      departmentCode: '123-456',
      pin: '12345678901234',
      registrationAddress: 'г. Бишкек, ул. Чуй, д. 123, кв. 45',
      phoneNumber: verificationItem.phone.isNotEmpty 
          ? verificationItem.phone 
          : '+996 555 123456',
      businessPurpose: 'СТРАХОВАНИЕ',
      isPDL: 'Нет',
      isBeneficiary: 'Да',
      questionnaireType: 'Первичная анкета',
      verificationResult: 'Верифицирован',
      verificationDate: DateTime(2024, 1, 15),
      sanctionsCheckResult: 'Не обнаружено',
      sanctionsCheckDate: DateTime(2024, 1, 16),
      moneyLaunderingCheckResult: 'Не обнаружено',
      moneyLaunderingCheckDate: DateTime(2024, 1, 17),
      terrorismCheckResult: 'Не обнаружено',
      terrorismCheckDate: DateTime(2024, 1, 18),
      riskLevel: 'Низкий',
      riskJustification: 'Клиент не является ПДЛ, не находится в санкционных списках',
      lastUpdateDate: DateTime(2024, 1, 20),
      nextUpdateDate: DateTime(2025, 1, 20),
      createdDate: DateTime(2024, 1, 10),
      createrName: 'Иванов Иван Иванович',
    );
  }

  /// Парсит полное имя на фамилию, имя и отчество
  static Map<String, String?> _parseName(String fullName) {
    if (fullName.isEmpty) {
      return {'surname': null, 'name': null, 'secondName': null};
    }

    final parts = fullName.trim().split(' ').where((p) => p.isNotEmpty).toList();

    if (parts.isEmpty) {
      return {'surname': null, 'name': null, 'secondName': null};
    }

    return {
      'surname': parts[0],
      'name': parts.length > 1 ? parts[1] : null,
      'secondName': parts.length > 2 ? parts[2] : null,
    };
  }
}

