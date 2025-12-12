import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/server/source/source.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

/// Утилита для генерации PDF анкеты клиента
class PdfGenerator {
  static pw.Font? _cachedFont;
  static pw.Font? _currentFont;

  /// Загружает шрифт с поддержкой кириллицы из assets
  static Future<pw.Font> _loadCyrillicFont() async {
    if (_cachedFont != null && _currentFont != null) {
      return _cachedFont!;
    }

    try {
      final fontData = await rootBundle.load('assets/fonts/Roboto-Regular.ttf');
      _cachedFont = pw.Font.ttf(fontData);
      _currentFont = _cachedFont;
      return _cachedFont!;
    } catch (e) {
      // Если не удалось загрузить шрифт, используем стандартный
      throw Exception('Ошибка загрузки шрифта: $e');
    }
  }

  /// Генерирует и отображает PDF анкеты клиента
  static Future<void> generateAndShowQuestionnaire(
    VerificationItem data,
    LoginUserDataModel user,
  ) async {
    final pdf = await _buildPdfDocument(data, user);
    final pdfBytes = await pdf.save();
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdfBytes,
    );
  }

  /// Генерирует и сохраняет PDF анкеты клиента
  static Future<void> generateAndSaveQuestionnaire(
    VerificationItem data,
    String fileName,
    LoginUserDataModel user,
  ) async {
    final pdf = await _buildPdfDocument(data, user);
    final pdfBytes = await pdf.save();
    await Printing.sharePdf(bytes: pdfBytes, filename: fileName);
  }

  /// Строит PDF документ
  static Future<pw.Document> _buildPdfDocument(
    VerificationItem data,
    LoginUserDataModel user,
  ) async {
    final font = await _loadCyrillicFont();
    final pdf = pw.Document(theme: pw.ThemeData.withFont(base: font));

    // Используем MultiPage для автоматического разбиения на страницы
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.fromLTRB(30, 40, 30, 50),
        build: (pw.Context context) {
          return [
            // Заголовок документа
            _buildHeader(),
            pw.SizedBox(height: 10),
            // Основная таблица анкеты
            _buildQuestionnaireTable(data),
            pw.SizedBox(height: 20),
            // Таблица верификации
            _buildVerificationTable(data, user),
          ];
        },
      ),
    );

    return pdf;
  }

  /// Создает заголовок документа
  static pw.Widget _buildHeader() {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Анкета клиента - физического лица',
          style: pw.TextStyle(
            fontSize: 12,
            fontWeight: pw.FontWeight.bold,
            font: _currentFont,
          ),
        ),
      ],
    );
  }

  /// Создает основную таблицу анкеты
  static pw.Widget _buildQuestionnaireTable(VerificationItem data) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Секция "Виды анкет" на всю ширину
        _buildFullWidthSection('Виды анкет (нужно подчеркнуть)'),
        // Основная таблица с данными
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
          columnWidths: {
            0: const pw.FixedColumnWidth(30),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2.5),
          },
          children: [
            // Строка с вариантами анкет
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                _buildCell('', isHeader: true, textAlign: pw.TextAlign.center),
                _buildCell(
                  'Первичная анкета',
                  isHeader: true,
                  textAlign: pw.TextAlign.center,
                ),
                _buildCell(
                  'Обновленная анкета',
                  isHeader: true,
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                _buildCell('', isHeader: true, textAlign: pw.TextAlign.center),
              ],
            ),
            pw.TableRow(
              decoration: pw.BoxDecoration(color: PdfColors.grey200),
              children: [
                _buildCell('№', isHeader: true, textAlign: pw.TextAlign.center),
                _buildCell(
                  'Наименование полей анкеты',
                  isHeader: true,
                  textAlign: pw.TextAlign.center,
                ),
                _buildCell(
                  'Сведения о клиенте',
                  isHeader: true,
                  textAlign: pw.TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        // Раздел 1: Идентификационные сведения на всю ширину
        _buildFullWidthSection('1. Идентификационные сведения'),
        // Продолжение основной таблицы
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
          columnWidths: {
            0: const pw.FixedColumnWidth(30),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2.5),
          },
          children: [
            _buildQuestionRow(
              '1)',
              'Статус клиента (нужное подчеркнуть)',
              'РЕЗИДЕНТ',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '2)',
              'Фамилия',
              data.personDto?.lastName ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '3)',
              'Имя',
              data.personDto?.firstName ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '4)',
              'Отчество (при наличии)',
              data.personDto?.middleName ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '5)',
              'Дата рождения',
              data.personDto?.dateOfBirth?.formatted ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '6)',
              'Место рождения (при наличии)',
              '-',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '7)',
              'Национальность (при наличии)',
              '-',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '8)',
              'Пол',
              data.personDto?.gender ?? '',
              data: data,
            ),

            _buildQuestionRow(
              '9)',
              'Гражданство',
              'КЫРГЫЗСКАЯ РЕСПУБЛИКА',
              data: data,
              isBold: true,
            ),

            // Пункт 10: Документ
            pw.TableRow(
              children: [
                _buildCell('10)', textAlign: pw.TextAlign.center),
                _buildCell('Реквизиты документа, удостоверяющего личность:'),
                _buildCell(''),
              ],
            ),

            _buildSubQuestionRow(
              '',
              '10.1 Наименование документа',
              data.personDto?.passportSeries ?? '',
              data: data,
              isBold: true,
            ),

            _buildSubQuestionRow(
              '',
              '10.2 Серия и номер документа',
              '${data.personDto?.passportSeries ?? ''} ${data.personDto?.passportNumber ?? ''}',
              data: data,
              isBold: true,
            ),

            _buildSubQuestionRow(
              '',
              '10.3 Дата выдачи документа',
              data.personDto?.issuedDate?.formatted ?? '',
              data: data,
              isBold: true,
            ),

            _buildSubQuestionRow(
              '',
              '10.4 Дата окончания срока действия документа',
              data.personDto?.expiredDate?.formatted ?? '',
              data: data,
              isBold: true,
            ),

            _buildSubQuestionRow(
              '',
              '10.5 Наименование органа, выдавшего документ',
              data.personDto?.passportAuthority ?? '',
              data: data,
              isBold: true,
            ),

            _buildSubQuestionRow(
              '',
              '10.6 Код подразделения (если имеется)',
              data.personDto?.passportAuthorityCode ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '11)',
              'Персональный идентификационный номер',
              data.personDto?.pin ?? '',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '12)',
              'Адрес места регистрации (при наличии в документе)',
              data.personDto?.message ?? '',
              data: data,
              isBold: true,
            ),

            // Контактные данные
            pw.TableRow(
              children: [
                _buildCell('13)', textAlign: pw.TextAlign.center),
                _buildCell('Контактные данные клиента:'),
                _buildCell(''),
              ],
            ),

            pw.TableRow(
              children: [
                _buildCell(''),
                _buildCell('Номер мобильного телефона'),
                _buildCell(data.userDto?.username ?? '', isBold: true),
              ],
            ),
          ],
        ),
        // Раздел 2: Сведения о деловом профиле клиента на всю ширину
        _buildFullWidthSection('2. Сведения о деловом профиле клиента'),
        // Продолжение основной таблицы
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
          columnWidths: {
            0: const pw.FixedColumnWidth(30),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2.5),
          },
          children: [
            _buildQuestionRow(
              '14)',
              'Цель и предполагаемый характер деловых отношений клиента',
              'СТРАХОВАНИЕ',
              data: data,
              isBold: true,
            ),

            _buildQuestionRow(
              '15)',
              'Является ли клиент публичным должностным лицом (ПДЛ)',
              data.userDto?.pdl ?? false ? 'Да' : 'Нет',
              data: data,
            ),

            _buildQuestionRow(
              '16)',
              'Является ли клиент конечным выгодоприобретателем',
              data.userDto?.beneficiary ?? false ? 'Да' : 'Нет',
              data: data,
            ),
          ],
        ),
      ],
    );
  }

  /// Создает таблицу верификации
  static pw.Widget _buildVerificationTable(
    VerificationItem data,
    LoginUserDataModel user,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        // Секция на всю ширину
        _buildFullWidthSection(
          'Информация о верификации, проверке и уровне риска клиента (заполняется финансовым учереждением и нефинансовой категории лиц)',
        ),
        // Таблица верификации
        pw.Table(
          border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
          columnWidths: {
            0: const pw.FixedColumnWidth(30),
            1: const pw.FlexColumnWidth(2),
            2: const pw.FlexColumnWidth(2.5),
          },
          children: [
            // Пункт 1: Верификация
            _buildVerificationQuestionRow(
              '1)',
              'Сведения о верификации клиента и о результатах верификации (нужное подчеркнуть)',
              [
                '1) Проведена',
                '2) Не проведена',
                '3) иное примечание',
                '4) Дата проведения',
                '____.________.2024 г. (___:___)',
              ],
              data: data,
            ),

            // Пункт 2: Санкционные перечни
            _buildVerificationQuestionRow(
              '2)',
              'Сведения о проверке клиента в Санкционных перечнях и о результатах проверки (нужное подчеркнуть)',
              [
                '1) Отсутствует в Перечне',
                '2) Присутствует в Перечне',
                '3) Дата и время проверки',
                '____.________.2024 г. (___:___)',
              ],
              data: data,
            ),

            // Пункт 3: Перечень лиц по легализации
            _buildVerificationQuestionRow(
              '3)',
              'Сведения о проверке клиента в Перечне лиц, групп и организаций, в отношение которых имеются сведения об их участии в легализации (отмывании) преступных доходов, и о результатах проверки (нужное подчеркнуть)',
              [
                '1) Отсутствует в Перечне',
                '2) Присутствует в Перечне',
                '3) Дата и время проверки',
                '____.________.2024 г. (___:___)',
              ],
              data: data,
            ),

            // Пункт 4: Перечень отбывших наказание
            _buildVerificationQuestionRow(
              '4)',
              'Сведения о проверке клиента в Перечне лиц, отбывших наказание в виде лишения свободы за совершение преступлений в сфере экономики, и о результатах проверки (нужное подчеркнуть)',
              [
                '1) Отсутствует в Перечне',
                '2) Присутствует в Перечне',
                '3) Дата и время проверки',
                '____.________.2024 г. (___:___)',
              ],
              data: data,
            ),

            // Пункт 5: Уровень риска
            _buildVerificationQuestionRow(
              '5)',
              'Степень (уровень) риска клиента (нужное подчеркнуть)',
              ['1) Высокий риск', '2) Низкий риск'],
              data: data,
            ),

            // Пункт 6: Обоснование риска
            pw.TableRow(
              children: [
                _buildCell('6)', textAlign: pw.TextAlign.center),
                _buildCell(
                  'Обоснование оценки степени (уровня) риска (по критериям высокого риска)',
                ),
                _buildCell(''),
              ],
            ),

            // Пункт 7: Дата заполнения
            pw.TableRow(
              children: [
                _buildCell('7)', textAlign: pw.TextAlign.center),
                _buildCell(
                  'Дата заполнения или последнего обновления сведений, изложенных в анкете (в случае отсутствия существенных изменений и дополнений в анкете клиента, новая анкета не заполняется)',
                ),
                _buildCell(''),
              ],
            ),

            // Пункт 8: Дата очередного обновления
            pw.TableRow(
              children: [
                _buildCell('8)', textAlign: pw.TextAlign.center),
                _buildCell(
                  'Дата очередного обновления сведений, изложенных в анкете (на основе результата оценки риска)',
                ),
                _buildCell(''),
              ],
            ),

            // Пункт 9: Дата занесения в базу данных
            pw.TableRow(
              children: [
                _buildCell('9)', textAlign: pw.TextAlign.center),
                _buildCell(
                  'Дата занесения в базу данных информации, указанной в настоящей анкете, и ФИО ответственного сотрудника финансового учреждения и нефинансовой категории лиц',
                ),
                _buildCell(
                  '${DateFormat('dd.MM.yyyy').format(DateTime.now())}\n${user.fullName}',
                  isBold: true,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// Создает секцию на всю ширину таблицы
  /// Используется для создания секций, которые занимают все колонки таблицы
  static pw.Widget _buildFullWidthSection(String sectionTitle) {
    return pw.Table(
      border: pw.TableBorder.all(color: PdfColors.black, width: 0.5),
      columnWidths: {0: const pw.FlexColumnWidth(1)},
      children: [
        pw.TableRow(
          decoration: pw.BoxDecoration(color: PdfColors.grey200),
          children: [
            pw.Container(
              padding: const pw.EdgeInsets.all(6),
              child: pw.Text(
                sectionTitle,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  font: _currentFont,
                ),
                textAlign: pw.TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Создает строку вопроса
  static pw.TableRow _buildQuestionRow(
    String number,
    String question,
    String answer, {
    required VerificationItem data,
    bool isBold = false,
  }) {
    return pw.TableRow(
      children: [
        _buildCell(number, textAlign: pw.TextAlign.center),
        _buildCell(question, isBold: isBold),
        _buildCell(answer),
      ],
    );
  }

  /// Создает строку подвопроса
  static pw.TableRow _buildSubQuestionRow(
    String number,
    String question,
    String answer, {
    required VerificationItem data,
    bool isBold = false,
  }) {
    return pw.TableRow(
      children: [
        _buildCell(number, textAlign: pw.TextAlign.center),
        _buildCell(question, isBold: isBold),
        _buildCell(answer),
      ],
    );
  }

  /// Создает строку вопроса верификации
  static pw.TableRow _buildVerificationQuestionRow(
    String number,
    String question,
    List<String> answers, {
    required VerificationItem data,
  }) {
    return pw.TableRow(
      children: [
        _buildCell(number, textAlign: pw.TextAlign.center),
        _buildCell(question),
        _buildCell(
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: answers.map((answer) {
              return pw.Padding(
                padding: const pw.EdgeInsets.only(bottom: 2),
                child: pw.Text(
                  answer,
                  style: pw.TextStyle(
                    fontSize: 9,
                    fontWeight: pw.FontWeight.normal,
                    font: _currentFont,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  /// Создает ячейку таблицы
  static pw.Widget _buildCell(
    dynamic content, {
    bool isHeader = false,
    pw.TextAlign textAlign = pw.TextAlign.left,
    pw.EdgeInsets? padding,
    bool isBold = false,
  }) {
    return pw.Container(
      padding: padding ?? const pw.EdgeInsets.all(6),
      child: content is pw.Widget
          ? content
          : pw.Text(
              content.toString(),
              style: pw.TextStyle(
                fontSize: 9,
                fontWeight: isHeader || isBold
                    ? pw.FontWeight.bold
                    : pw.FontWeight.normal,
                font: _currentFont,
              ),
              textAlign: textAlign,
            ),
    );
  }
}
