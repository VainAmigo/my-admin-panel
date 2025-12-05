import 'package:admin_panel/components/components.dart';
import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.phoneController,
    required this.passwordController,
    this.width = 1.0,
    this.onTapLogin,
  });

  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final double? width;
  final Function()? onTapLogin;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(AppSizing.spaceBtwSection),
      width: size.width * width!,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizing.defaultRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Вход в систему', style: AppTypography.black32w600),
          SizedBox(height: AppSizing.spaceBtwItm),
          Text(
            'Введите номер телефона и пароль для входа в систему',
            style: AppTypography.grey16w400,
          ),
          SizedBox(height: AppSizing.spaceBtwSection),
          PhoneNumberTextField(controller: phoneController),
          CustomTextFormField(controller: passwordController, label: 'Пароль', obscureText: true, maxLines: 1,),
          SizedBox(height: AppSizing.space50),
          ValueListenableBuilder(
            valueListenable: passwordController,
            builder: (context, value, child) {
              final isValid = value.text.trim().length >= 6;
              return PrimaryButton(
                text: 'Войти',
                color: AppColors.primary,
                onPressed: isValid ? onTapLogin : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
