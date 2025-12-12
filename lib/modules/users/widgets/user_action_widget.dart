import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class UsersActionsWidget extends StatelessWidget {
  const UsersActionsWidget({
    this.onEdit,
    this.onDelete,
    this.onManageRoles,
    super.key,
  });

  final Function()? onEdit;
  final Function()? onDelete;
  final Function()? onManageRoles;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TagTextButton(
          text: 'редактировать',
          color: AppColors.primary,
          textColor: AppColors.primary,
          onPressed: onEdit ?? () {},
        ),
        TagTextButton(
          text: 'управление ролями',
          color: AppColors.oragne,
          textColor: AppColors.oragne,
          onPressed: onManageRoles ?? () {},
        ),
        TagTextButton(
          text: 'удалить',
          color: AppColors.red,
          textColor: AppColors.red,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizing.spaceBtwSection),
                    decoration: BoxDecoration(
                      color: AppColors.red.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.warning, color: AppColors.red, size: 40),
                  ),
                  SizedBox(height: AppSizing.spaceBtwSection),
                  Text(
                    'Вы уверены, что хотите удалить пользователя?',
                    style: AppTypography.black20w400,
                  ),
                ],
              ),
              content: Text(
                'Это действие не может быть отменено.',
                style: AppTypography.grey16w400,
              ),
              actions: [
                Row(
                  spacing: 10,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        text: 'Нет, отменить',
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
                      child: PrimaryButton(
                        text: 'Да, удалить',
                        color: AppColors.red,
                        onPressed: () {
                          onDelete?.call();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
