import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/core/core.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AvarRegisterDetail extends StatefulWidget {
  const AvarRegisterDetail({
    super.key,
    required this.policyData,
  });

  final AvarPolicySearchResponse policyData;

  @override
  State<AvarRegisterDetail> createState() => _AvarRegisterDetailState();
}

class _AvarRegisterDetailState extends State<AvarRegisterDetail> {
  DateTime? _accidentDate;
  final TextEditingController _registrationIdController = TextEditingController();
  final TextEditingController _preliminaryAmountController = TextEditingController();
  String? _selectedDriver;

  @override
  void dispose() {
    _registrationIdController.dispose();
    _preliminaryAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Регистрация аварии ${widget.policyData.policyNumber}',
          style: AppTypography.black20w400,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizing.spaceBtwSection),
        child: Center(
          child: SizedBox(
            width: Responsive.isMobile(context) ? double.infinity : width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoCard(
                  title: 'Информация о полисе',
                  children: [
                    _buildInfoRow('Номер полиса', widget.policyData.policyNumber),
                    _buildInfoRow(
                      'Период действия',
                      '${widget.policyData.validFrom.formatted} - ${widget.policyData.validTo.formatted}',
                    ),
                    _buildInfoRow('Сумма полиса', '${widget.policyData.amount}'),
                    _buildInfoRow('Статус', widget.policyData.status.name),
                    const Divider(),
                    _buildInfoRow('Владелец', widget.policyData.personFullName),
                    _buildInfoRow('ПИН владельца', widget.policyData.personIin),
                    _buildInfoRow('Телефон владельца', widget.policyData.personPhone),
                    const Divider(),
                    _buildInfoRow('Гос. номер', widget.policyData.vehicleNumber),
                    _buildInfoRow('VIN', widget.policyData.vin),
                    _buildInfoRow('Автомобиль', '${widget.policyData.brand} ${widget.policyData.model}'),
                    _buildInfoRow('Год выпуска', '${widget.policyData.year}'),
                    _buildInfoRow('Период полиса', '${widget.policyData.carPolicyPeriod}'),
                    _buildInfoRow('Разрешенные водители', widget.policyData.allowedDrivers),
                  ],
                ),
                SizedBox(height: AppSizing.spaceBtwSection),
                // Редактируемые поля
                _buildEditableCard(
                  title: 'Данные об аварии',
                  children: [
                    // Дата аварии
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
                          child: Text(
                            'Дата аварии',
                            style: AppTypography.grey14w500,
                          ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
                          child: Text(
                            'Виновник',
                            style: AppTypography.grey14w500,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
                            border: Border.all(color: AppColors.grey),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: AppSizing.spaceBtwSection),
                          child: DropdownButton<String>(
                            value: _selectedDriver,
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: Text(
                              widget.policyData.drivers.isEmpty
                                  ? 'Нет доступных водителей'
                                  : 'Выберите виновника',
                              style: AppTypography.grey14w500,
                            ),
                            items: widget.policyData.drivers.isEmpty
                                ? null
                                : widget.policyData.drivers.map((driver) {
                                    return DropdownMenuItem<String>(
                                      value: driver,
                                      child: Text(
                                        driver,
                                        style: AppTypography.black20w400,
                                      ),
                                    );
                                  }).toList(),
                            onChanged: widget.policyData.drivers.isEmpty
                                ? null
                                : (value) {
                                    setState(() {
                                      _selectedDriver = value;
                                    });
                                  },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: AppSizing.spaceBtwSection),
                // Кнопка сохранения
                PrimaryButton(
                  text: 'Сохранить',
                  color: AppColors.primary,
                  onPressed: () {
                    // TODO: Реализовать сохранение данных
                    AppSnackbar.showInfo(
                      context: context,
                      title: 'Данные сохранены',
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.black28w600,
          ),
          SizedBox(height: AppSizing.spaceBtwSection),
          ...children,
        ],
      ),
    );
  }

  Widget _buildEditableCard({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTypography.black28w600,
          ),
          SizedBox(height: AppSizing.spaceBtwSection),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizing.spaceBtwItm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: AppSizing.spaceBtwItm,
        children: [
          Text(
            label,
            style: AppTypography.grey14w500,
          ),
          Expanded(
            child: Text(
              textAlign: TextAlign.end,
              value,
              style: AppTypography.black16w400,
            ),
          ),
        ],
      ),
    );
  }
}
