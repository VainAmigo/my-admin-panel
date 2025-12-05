import 'package:admin_panel/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

@immutable
final class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
        // primaryColor: AppColors.primary,
        // canvasColor: _backgroundColor,
        scaffoldBackgroundColor: _backgroundColor,
        // iconTheme: _iconTheme,
        appBarTheme: _appBarTheme,
        // navigationBarTheme: _navigationBarTheme
        // dividerTheme: _dividerTheme,
        // textTheme: _textTheme,
        // inputDecorationTheme: _inputDecorationTheme,
        // buttonTheme: _buttonTheme,
        // snackBarTheme: _snackBarTheme,
        // elevatedButtonTheme: _elevatedButtonTheme,
        // textButtonTheme: _textButtonTheme,
        // colorScheme: _colorScheme,
        // bottomSheetTheme: _bottomSheetTheme,
        // listTileTheme: _listTileTheme,
        // switchTheme: _switchTheme,
        // progressIndicatorTheme: _progressIndicatorTheme,
        // tabBarTheme: _tabBarTheme,
        // cardTheme: _cardTheme,
        // outlinedButtonTheme: _outlineButtonTheme,
        // expansionTileTheme: _expansionTileTheme,
        );
  }

  AppBarTheme get _appBarTheme {
    return const AppBarTheme(
      elevation: 0,
      toolbarHeight: 64,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );
  }

  // NavigationBarThemeData get _navigationBarTheme {
  //   return NavigationBarThemeData(
  //     labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
  //       (Set<WidgetState> states) =>
  //           states.contains(WidgetState.selected) ? AppTypography.primary14 : AppTypography.grey14w500,
  //     ),
  //   );
  // }
}
// ColorScheme get _colorScheme {
//   return ColorScheme.light(
//     primary: AppColors.primary,
//     secondary: AppColors.blue,
//     surface: _backgroundColor,
//     error: AppColors.error,
//     primaryContainer: AppColors.primaryContainerLight,
//     onPrimaryContainer: AppColors.onPrimaryContainerLight,
//     secondaryContainer: AppColors.secondaryContainerLight,
//     tertiaryContainer: AppColors.tertiaryContainerLight,
//     surfaceContainerHighest: AppColors.surfaceVariantLight,
//     shadow: AppColors.shadowLight,
//     surfaceTint: AppColors.surfaceTintLight,
//     primaryFixedDim: AppColors.primaryFixedDimLight,
//     surfaceContainerLow: AppColors.surfaceContainerLowLight,
//   );
// }

// SnackBarThemeData get _snackBarTheme {
//   return SnackBarThemeData(
//     contentTextStyle: UITextStyle.bodyText1.copyWith(
//       color: AppColors.white,
//     ),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//     backgroundColor: AppColors.black,
//     elevation: 4,
//     behavior: SnackBarBehavior.floating,
//   );
// }

// Color get _backgroundColor => AppColors.backgroundLight;

// IconThemeData get _iconTheme {
//   return const IconThemeData(
//     color: AppColors.onBackgroundLight,
//   );
// }

// DividerThemeData get _dividerTheme {
//   return const DividerThemeData();
// }

// TextTheme get _textTheme => uiTextTheme;

// static final contentTextTheme = TextTheme(
//   displayLarge: ContentTextStyle.headline1,
//   displayMedium: ContentTextStyle.headline2,
//   displaySmall: ContentTextStyle.headline3,
//   headlineMedium: ContentTextStyle.headline4,
//   headlineSmall: ContentTextStyle.headline5,
//   titleLarge: ContentTextStyle.headline6,
//   titleMedium: ContentTextStyle.subtitle1,
//   titleSmall: ContentTextStyle.subtitle2,
//   bodyLarge: ContentTextStyle.bodyText1,
//   bodyMedium: ContentTextStyle.bodyText2,
//   labelLarge: ContentTextStyle.button,
//   bodySmall: ContentTextStyle.caption,
//   labelSmall: ContentTextStyle.overline,
// ).apply(
//   bodyColor: AppColors.black,
//   displayColor: AppColors.black,
//   decorationColor: AppColors.black,
// );

// /// The UI text theme based on [UITextStyle].
// static final uiTextTheme = TextTheme(
//   displayLarge: UITextStyle.headline1,
//   displayMedium: UITextStyle.headline2,
//   displaySmall: UITextStyle.headline3,
//   headlineMedium: UITextStyle.headline4,
//   headlineSmall: UITextStyle.headline5,
//   titleLarge: UITextStyle.headline6,
//   titleMedium: UITextStyle.subtitle1,
//   titleSmall: UITextStyle.subtitle2,
//   bodyLarge: UITextStyle.bodyText1,
//   bodyMedium: UITextStyle.bodyText2,
//   labelLarge: UITextStyle.button,
//   bodySmall: UITextStyle.caption,
//   labelSmall: UITextStyle.overline,
// ).apply(
//   bodyColor: AppColors.black,
//   displayColor: AppColors.black,
//   decorationColor: AppColors.black,
// );

// InputDecorationTheme get _inputDecorationTheme {
//   return InputDecorationTheme(
//     fillColor: AppColors.white,
//     filled: true,
//     alignLabelWithHint: true,
//     labelStyle: uiTextTheme.bodyMedium,
//     floatingLabelBehavior: FloatingLabelBehavior.auto,
//     border: OutlineInputBorder(
//       borderSide: BorderSide.none,
//       borderRadius: BorderRadius.circular(8),
//     ),
//   );
// }

// ButtonThemeData get _buttonTheme {
//   return ButtonThemeData(
//     textTheme: ButtonTextTheme.primary,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(20),
//     ),
//   );
// }

// ElevatedButtonThemeData get _elevatedButtonTheme {
//   return ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(Radius.circular(16)),
//       ),
//       fixedSize: const Size(double.maxFinite, 56),
//       textStyle: _textTheme.labelLarge?.copyWith(
//         fontWeight: FontWeight.w700,
//       ),
//       backgroundColor: AppColors.blue,
//       foregroundColor: AppColors.white,
//       disabledBackgroundColor: AppColors.blue.shade300,
//       disabledForegroundColor: AppColors.white,
//     ),
//   );
// }

// TextButtonThemeData get _textButtonTheme {
//   return TextButtonThemeData(
//     style: TextButton.styleFrom(
//       textStyle: _textTheme.labelLarge,
//       foregroundColor: AppColors.black,
//     ),
//   );
// }

// BottomSheetThemeData get _bottomSheetTheme {
//   return const BottomSheetThemeData(
//     clipBehavior: Clip.hardEdge,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//     ),
//   );
// }

// ListTileThemeData get _listTileTheme {
//   return ListTileThemeData(
//     contentPadding: const EdgeInsets.all(16),
//     iconColor: AppColors.blue,
//     titleTextStyle: UITextStyle.subtitle1.copyWith(
//       fontWeight: FontWeight.w700,
//       color: AppColors.surfaceVariantDark,
//     ),
//   );
// }

//   SwitchThemeData get _switchTheme {
//     return const SwitchThemeData();
//   }

//   ProgressIndicatorThemeData get _progressIndicatorTheme {
//     return const ProgressIndicatorThemeData();
//   }

//   TabBarTheme get _tabBarTheme {
//     return TabBarTheme(
//       indicator: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         color: AppColors.surfaceVariantLight,
//       ),
//       labelColor: AppColors.blue,
//       indicatorSize: TabBarIndicatorSize.tab,
//       overlayColor: WidgetStateProperty.all(AppColors.transparent),
//       dividerColor: Colors.transparent,
//       labelPadding: const EdgeInsets.all(5),
//       labelStyle: UITextStyle.button.copyWith(
//         fontWeight: FontWeight.w700,
//       ),
//       unselectedLabelStyle: UITextStyle.button.copyWith(
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }

//   CardTheme get _cardTheme {
//     return CardTheme(
//       elevation: 20,
//       color: AppColors.white,
//       shadowColor: AppColors.blue.shade100.withOpacity(0.1),
//     );
//   }

//   OutlinedButtonThemeData get _outlineButtonTheme {
//     return OutlinedButtonThemeData(
//       style: OutlinedButton.styleFrom(
//         fixedSize: const Size.fromHeight(56),
//         foregroundColor: _colorScheme.primary,
//         textStyle: _textTheme.titleMedium?.copyWith(
//           fontWeight: FontWeight.w600,
//         ),
//         side: BorderSide(
//           color: _colorScheme.primary,
//           style: BorderStyle.solid,
//         ),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//       ),
//     );
//   }

//   ExpansionTileThemeData get _expansionTileTheme {
//     return const ExpansionTileThemeData(
//       tilePadding: EdgeInsets.symmetric(horizontal: 16),
//       childrenPadding: EdgeInsets.fromLTRB(16, 1, 16, 16),
//       collapsedShape: RoundedRectangleBorder(
//         side: BorderSide.none,
//       ),
//       shape: RoundedRectangleBorder(
//         side: BorderSide.none,
//       ),
//     );
//   }
// }

// class AppDarkTheme extends AppTheme {
//   const AppDarkTheme();

//   @override
//   ColorScheme get _colorScheme {
//     return const ColorScheme.dark().copyWith(
//       primary: AppColors.blue,
//       secondary: AppColors.blue,
//       surface: AppColors.grey.shade900,
//       primaryContainer: AppColors.primaryContainerDark,
//       onPrimaryContainer: AppColors.onPrimaryContainerDark,
//       secondaryContainer: AppColors.secondaryContainerDark,
//       tertiaryContainer: AppColors.tertiaryContainerDark,
//       surfaceContainerHighest: AppColors.surfaceVariantDark,
//       shadow: AppColors.shadowDark,
//       surfaceTint: AppColors.surfaceTintDark,
//       primaryFixedDim: AppColors.primaryFixedDimDark,
//       surfaceContainerLow: AppColors.surfaceContainerLowDark,
//     );
//   }

//   @override
//   AppBarTheme get _appBarTheme {
//     return AppBarTheme(
//       iconTheme: _iconTheme,
//       titleTextStyle: _textTheme.titleLarge,
//       elevation: 0,
//       toolbarHeight: 64,
//       centerTitle: true,
//       backgroundColor: _backgroundColor,
//       systemOverlayStyle: const SystemUiOverlayStyle(
//         statusBarIconBrightness: Brightness.dark,
//         statusBarBrightness: Brightness.light,
//       ),
//     );
//   }

//   @override
//   ElevatedButtonThemeData get _elevatedButtonTheme {
//     return ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(Radius.circular(16)),
//         ),
//         fixedSize: const Size(double.maxFinite, 56),
//         textStyle: _textTheme.labelLarge?.copyWith(
//           fontWeight: FontWeight.w700,
//         ),
//         backgroundColor: AppColors.blue,
//         foregroundColor: AppColors.white,
//         disabledBackgroundColor: AppColors.blue.shade700,
//       ),
//     );
//   }

//   @override
//   TextTheme get _textTheme {
//     return AppTheme.contentTextTheme.apply(
//       bodyColor: AppColors.white,
//       displayColor: AppColors.white,
//       decorationColor: AppColors.white,
//     );
//   }

//   @override
//   SnackBarThemeData get _snackBarTheme {
//     return SnackBarThemeData(
//       contentTextStyle: UITextStyle.bodyText1.copyWith(
//         color: AppColors.black,
//       ),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       backgroundColor: AppColors.grey.shade300,
//       elevation: 4,
//       behavior: SnackBarBehavior.floating,
//     );
//   }

//   @override
//   TextButtonThemeData get _textButtonTheme {
//     return TextButtonThemeData(
//       style: TextButton.styleFrom(
//         textStyle: _textTheme.labelLarge,
//         foregroundColor: AppColors.white,
//       ),
//     );
//   }

  @override
  Color get _backgroundColor => AppColors.grey100;

//   @override
//   IconThemeData get _iconTheme {
//     return const IconThemeData(color: AppColors.white);
//   }

//   @override
//   ListTileThemeData get _listTileTheme {
//     return ListTileThemeData(
//       contentPadding: const EdgeInsets.all(16),
//       iconColor: AppColors.blue,
//       titleTextStyle: UITextStyle.subtitle1.copyWith(
//         fontWeight: FontWeight.w700,
//         color: AppColors.backgroundLight,
//       ),
//     );
//   }

//   @override
//   DividerThemeData get _dividerTheme {
//     return const DividerThemeData();
//   }

//   @override
//   TabBarTheme get _tabBarTheme {
//     return TabBarTheme(
//       indicator: const BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(12)),
//         color: AppColors.surfaceVariantDark,
//       ),
//       labelColor: AppColors.blue,
//       indicatorSize: TabBarIndicatorSize.tab,
//       overlayColor: WidgetStateProperty.all(AppColors.transparent),
//       dividerColor: Colors.transparent,
//       labelPadding: const EdgeInsets.all(5),
//       labelStyle: UITextStyle.button.copyWith(
//         fontWeight: FontWeight.w700,
//       ),
//       unselectedLabelStyle: UITextStyle.button.copyWith(
//         fontWeight: FontWeight.w700,
//       ),
//     );
//   }

//   @override
//   CardTheme get _cardTheme {
//     return CardTheme(
//       elevation: 20,
//       color: AppColors.primaryContainerDark,
//       shadowColor: AppColors.blue.shade300.withOpacity(0.1),
//     );
//   }

//   @override
//   InputDecorationTheme get _inputDecorationTheme {
//     return InputDecorationTheme(
//       fillColor: AppColors.primaryContainerDark,
//       filled: true,
//       labelStyle: _textTheme.titleMedium,
//       border: OutlineInputBorder(
//         borderSide: BorderSide.none,
//         borderRadius: BorderRadius.circular(8),
//       ),
//     );
//   }

//   @override
//   BottomSheetThemeData get _bottomSheetTheme {
//     return const BottomSheetThemeData(
//       backgroundColor: AppColors.backgroundDark,
//       clipBehavior: Clip.hardEdge,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20),
//           topRight: Radius.circular(20),
//         ),
//       ),
//     );
//   }
// }
