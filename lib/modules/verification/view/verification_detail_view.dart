import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/config/config.dart';
import 'package:admin_panel/modules/modules.dart';
import 'package:admin_panel/modules/verification/widgets/unverify_dialog.dart';
import 'package:admin_panel/modules/verification/widgets/verification_info_card.dart';
import 'package:admin_panel/modules/verification/widgets/verification_photos_card.dart';
import 'package:admin_panel/server/server.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerificationDetailView extends StatelessWidget {
  const VerificationDetailView({super.key, required this.verification});

  final VerificationItem verification;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: Text('Детали верификации', style: AppTypography.black20w400),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSizing.spaceBtwSection),
            child: PrimaryButton(
              text: 'Печать данных',
              onPressed: () => _printData(context),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizing.spaceBtwSection),
        child: Responsive(
          mobile: _buildMobile(context),
          desktop: _buildDesktop(context),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSizing.spaceBtwSection,
      children: [
        VerificationInfoCard(
          verification: verification,
          onUnverify: () => _unverifyPressed(context),
          onVerify: () => _verify(context),
        ),
        VerificationPhotosCard(verification: verification),
      ],
    );
  }

  Widget _buildDesktop(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSizing.spaceBtwSection,
          children: [
            Expanded(
              flex: 1,
              child: VerificationInfoCard(
                verification: verification,
                onUnverify: () => _unverifyPressed(context),
                onVerify: () => _verify(context),
              ),
            ),
            Expanded(
              flex: 1,
              child: VerificationPhotosCard(verification: verification),
            ),
          ],
        ),
      ),
    );
  }

  /// Печать данных верификации
  void _printData(BuildContext context) {
    // TODO: Реализовать логику печати данных
  }

  /// Нажатие на кнопку "Не верифицирован"
  void _unverifyPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return UnverifyDialog(
          userName: verification.name,
          onConfirm: (reason, {description}) {
            Navigator.of(dialogContext).pop();
            _unverifyConfirmed(context);
          },
        );
      },
    );
  }

  /// Подтверждение отмены верификации
  void _unverifyConfirmed(BuildContext context) {
    context.read<VerificationCubit>().getVerificationList(
      isVerified: true,
      page: 1,
      limit: 10,
    );
    Navigator.pop(context);
  }

  /// Подтверждение верификации пользователя
  void _verify(BuildContext context) {
    // TODO: Реализовать логику верификации
    context.read<VerificationCubit>().getVerificationList(
      isVerified: true,
      page: 1,
      limit: 10,
    );
    Navigator.pop(context);
  }
}
