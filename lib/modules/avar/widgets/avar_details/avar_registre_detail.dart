import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarRegisterDetail extends StatefulWidget {
  const AvarRegisterDetail({super.key, required this.policyData});

  final AvarPolicySearchResponse policyData;

  @override
  State<AvarRegisterDetail> createState() => _AvarRegisterDetailState();
}

class _AvarRegisterDetailState extends State<AvarRegisterDetail> {
  DateTime? _accidentDate;
  final TextEditingController _registrationIdController =
      TextEditingController();
  final TextEditingController _preliminaryAmountController =
      TextEditingController();
  String? _selectedDriver;

  @override
  Widget build(BuildContext context) {
    return DetailView(
      appBarTitle: 'Регистрация аварии ${widget.policyData.policyNumber}',
      infoRows: _buildInfoRows(),
      editableFields: _buildEditableFields(),
      child: PrimaryButton(
        text: 'Сохранить',
        onPressed: _onSave,
      ),
    );
  }

  @override
  void dispose() {
    _registrationIdController.dispose();
    _preliminaryAmountController.dispose();
    super.dispose();
  }

  List<DetailInfoRow> _buildInfoRows() {
    return [
      DetailInfoRow(
        label: 'Номер полиса',
        value: widget.policyData.policyNumber,
      ),
      DetailInfoRow(
        label: 'Период действия',
        value:
            '${widget.policyData.validFrom.formatted} - ${widget.policyData.validTo.formatted}',
      ),
      DetailInfoRow(
        label: 'Сумма полиса',
        value: '${widget.policyData.amount}',
      ),
      DetailInfoRow(label: 'Статус', value: widget.policyData.status.name),
      DetailInfoRow(label: 'Владелец', value: widget.policyData.personFullName),
      DetailInfoRow(label: 'ПИН владельца', value: widget.policyData.personIin),
      DetailInfoRow(
        label: 'Телефон владельца',
        value: widget.policyData.personPhone,
      ),
      DetailInfoRow(
        label: 'Гос. номер',
        value: widget.policyData.vehicleNumber,
      ),
      DetailInfoRow(label: 'VIN', value: widget.policyData.vin),
      DetailInfoRow(
        label: 'Автомобиль',
        value: '${widget.policyData.brand} ${widget.policyData.model}',
      ),
      DetailInfoRow(label: 'Год выпуска', value: '${widget.policyData.year}'),
      DetailInfoRow(
        label: 'Период полиса',
        value: '${widget.policyData.carPolicyPeriod}',
      ),
      DetailInfoRow(
        label: 'Разрешенные водители',
        value: widget.policyData.allowedDrivers,
      ),
    ];
  }

  List<Widget> _buildEditableFields() {
    return [
      // Дата аварии
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
            child: Text('Дата аварии', style: AppTypography.grey14w500),
          ),
          CustomDatePicker(
            selectedDate: _accidentDate,
            onDateChanged: (date) {
              setState(() {
                _accidentDate = date;
              });
            },
          ),
        ],
      ),
      SizedBox(height: AppSizing.spaceBtwSection),
      // Registration ID
      CustomTextFormField(
        controller: _registrationIdController,
        label: 'РЗНУ',
        hintText: 'РЗНУ',
      ),
      SizedBox(height: AppSizing.spaceBtwItm),
      // Предварительная сумма
      CustomTextFormField(
        controller: _preliminaryAmountController,
        label: 'Предварительная сумма',
        hintText: 'Введите сумму',
        keyboardType: TextInputType.number,
      ),
      SizedBox(height: AppSizing.spaceBtwSection),
      // Виновник (dropdown)
      CustomDropdown<String>(
        label: 'Виновник',
        value: _selectedDriver,
        items: widget.policyData.drivers,
        hintText: widget.policyData.drivers.isEmpty
            ? 'Нет доступных водителей'
            : 'Выберите виновника',
        onChanged: (value) {
          setState(() {
            _selectedDriver = value;
          });
        },
      ),
    ];
  }

  void _onSave() {
    // TODO: Реализовать сохранение данных
    AppSnackbar.showInfo(context: context, title: 'Данные сохранены');
  }
}
