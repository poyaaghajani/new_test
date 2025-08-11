import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FontsApp {
  FontsApp._();

  static const String vazir = 'Vazir';
}

class ColorsApp {
  ColorsApp._();

  /// others colors
  static const Color purple = Colors.purple;
  static const Color teal = Colors.teal;
  static const Color pink = Colors.pink;
  static const Color indigo = Colors.indigo;
  static const Color amber = Colors.amber;

  /// items colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  /// grey colors
  static const Color grey25 = Color(0xFFFCFCFC);
  static const Color grey50 = Color(0xFFF9F9F9);
  static const Color grey100 = Color(0xFFF2F2F2);
  static const Color grey200 = Color(0xFFE4E4E4);
  static const Color grey300 = Color(0xFFD1D1D1);
  static const Color grey400 = Color(0xFFB0B0B0);
  static const Color grey500 = Color(0xFF888888);
  static const Color grey600 = Color(0xFF6D6D6D);
  static const Color grey700 = Color(0xFF5D5D5D);
  static const Color grey800 = Color(0xFF2D2D2D);
  static const Color grey900 = Color(0xFF1A1A1A);
  static const Color grey950 = Color(0xFF0F0F0F);

  /// primary colors
  static const Color primary25 = Color(0xffF5F8FF);
  static const Color primary50 = Color(0xffEFF4FF);
  static const Color primary100 = Color(0xffD1E0FF);
  static const Color primary200 = Color(0xffB2CCFF);
  static const Color primary300 = Color(0xff84ADFF);
  static const Color primary400 = Color(0xff528BFF);
  static const Color primary500 = Color(0xff2970FF);
  static const Color primary600 = Color(0xff155EEF);
  static const Color primary700 = Color(0xff004EEB);
  static const Color primary800 = Color(0xff0040C1);
  static const Color primary900 = Color(0xff00359E);
  static const Color primary950 = Color(0xff002266);

  /// error colors
  static const Color error50 = Color(0xFFFDF2F2);
  static const Color error100 = Color(0xFFFCE8E8);
  static const Color error200 = Color(0xFFFBD5D5);
  static const Color error300 = Color(0xFFF8B4B4);
  static const Color error400 = Color(0xFFF87171);
  static const Color error500 = Color(0xFFEF4444);
  static const Color error600 = Color(0xFFDC2626);
  static const Color error700 = Color(0xFFB91C1C);
  static const Color error800 = Color(0xFF991B1B);
  static const Color error900 = Color(0xFF7F1D1D);

  /// warning colors
  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning200 = Color(0xFFFDE68A);
  static const Color warning300 = Color(0xFFFCD34D);
  static const Color warning400 = Color(0xFFFBBF24);
  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning700 = Color(0xFFB45309);
  static const Color warning800 = Color(0xFF92400E);
  static const Color warning900 = Color(0xFF78350F);

  /// success colors
  static const Color success50 = Color(0xFFF0FDF4);
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success200 = Color(0xFFBBF7D0);
  static const Color success300 = Color(0xFF86EFAC);
  static const Color success400 = Color(0xFF4ADE80);
  static const Color success500 = Color(0xFF22C55E);
  static const Color success600 = Color(0xFF16A34A);
  static const Color success700 = Color(0xFF15803D);
  static const Color success800 = Color(0xFF166534);
  static const Color success900 = Color(0xFF14532D);
}

class ThemeApp {
  static ColorScheme lightScheme = const ColorScheme.light(
    brightness: Brightness.light,
    primary: ColorsApp.primary500,
    onPrimary: ColorsApp.white,
    primaryContainer: ColorsApp.primary100,
    onPrimaryContainer: ColorsApp.primary900,
    secondary: ColorsApp.primary600,
    onSecondary: ColorsApp.white,
    secondaryContainer: ColorsApp.primary50,
    onSecondaryContainer: ColorsApp.primary800,
    tertiary: ColorsApp.purple,
    onTertiary: ColorsApp.white,
    error: ColorsApp.error500,
    onError: ColorsApp.white,
    errorContainer: ColorsApp.error50,
    onErrorContainer: ColorsApp.error900,
    outline: ColorsApp.grey300,
    outlineVariant: ColorsApp.grey200,
    surface: ColorsApp.white,
    onSurface: ColorsApp.grey900,
    surfaceContainerHighest: ColorsApp.grey50,
    onSurfaceVariant: ColorsApp.grey700,
    inverseSurface: ColorsApp.grey900,
    onInverseSurface: ColorsApp.grey100,
    inversePrimary: ColorsApp.primary200,
    shadow: ColorsApp.black,
    scrim: ColorsApp.black,
    surfaceTint: ColorsApp.primary500,
  );

  static ColorScheme darkScheme = const ColorScheme.dark(
    brightness: Brightness.dark,
    primary: ColorsApp.primary400,
    onPrimary: ColorsApp.primary950,
    primaryContainer: ColorsApp.primary800,
    onPrimaryContainer: ColorsApp.primary100,
    secondary: ColorsApp.primary300,
    onSecondary: ColorsApp.primary900,
    secondaryContainer: ColorsApp.primary700,
    onSecondaryContainer: ColorsApp.primary50,
    tertiary: ColorsApp.purple,
    onTertiary: ColorsApp.white,
    error: ColorsApp.error400,
    onError: ColorsApp.error900,
    errorContainer: ColorsApp.error800,
    onErrorContainer: ColorsApp.error100,
    outline: ColorsApp.grey600,
    outlineVariant: ColorsApp.grey700,
    surface: ColorsApp.grey900,
    onSurface: ColorsApp.grey100,
    surfaceContainerHighest: ColorsApp.grey800,
    onSurfaceVariant: ColorsApp.grey300,
    inverseSurface: ColorsApp.grey100,
    onInverseSurface: ColorsApp.grey900,
    inversePrimary: ColorsApp.primary500,
    shadow: ColorsApp.black,
    scrim: ColorsApp.black,
    surfaceTint: ColorsApp.primary400,
  );

  /// Light Theme TextTheme
  static TextTheme lightTextTheme = TextTheme(
    // Display Styles
    displayLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    displayMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    displaySmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),

    // Headline Styles
    headlineLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),

    // Title Styles
    titleLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: lightScheme.onSurface,
    ),
    titleSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: lightScheme.onSurface,
    ),

    // Body Styles
    bodyLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: lightScheme.onSurfaceVariant,
    ),

    // Label Styles
    labelLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: lightScheme.onSurface,
    ),
    labelMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: lightScheme.onSurface,
    ),
    labelSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: lightScheme.onSurfaceVariant,
    ),
  );

  /// Dark Theme TextTheme
  static TextTheme darkTextTheme = TextTheme(
    // Display Styles
    displayLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    displayMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    displaySmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),

    // Headline Styles
    headlineLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    headlineMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    headlineSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),

    // Title Styles
    titleLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 22,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    titleMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: darkScheme.onSurface,
    ),
    titleSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: darkScheme.onSurface,
    ),

    // Body Styles
    bodyLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    bodyMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurface,
    ),
    bodySmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: darkScheme.onSurfaceVariant,
    ),

    // Label Styles
    labelLarge: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: darkScheme.onSurface,
    ),
    labelMedium: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: darkScheme.onSurface,
    ),
    labelSmall: TextStyle(
      fontFamily: FontsApp.vazir,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      color: darkScheme.onSurfaceVariant,
    ),
  );

  /// Light Theme SystemUiOverlayStyle
  static const SystemUiOverlayStyle lightSystemUiOverlayStyle =
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: ColorsApp.white,
        systemNavigationBarDividerColor: ColorsApp.grey200,
        systemNavigationBarIconBrightness: Brightness.dark,
      );

  /// Dark Theme SystemUiOverlayStyle
  static const SystemUiOverlayStyle darkSystemUiOverlayStyle =
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: ColorsApp.grey900,
        systemNavigationBarDividerColor: ColorsApp.grey800,
        systemNavigationBarIconBrightness: Brightness.light,
      );

  static final lightTheme = ThemeData(
    colorScheme: lightScheme,
    fontFamily: FontsApp.vazir,
    textTheme: lightTextTheme,

    appBarTheme: AppBarTheme(
      backgroundColor: lightScheme.surface,
      foregroundColor: lightScheme.onSurface,
      shadowColor: lightScheme.shadow,
      surfaceTintColor: lightScheme.surfaceTint,
      titleTextStyle: lightTextTheme.titleLarge,
      systemOverlayStyle: lightSystemUiOverlayStyle,
    ),

    scaffoldBackgroundColor: lightScheme.surface,

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: lightScheme.surface,
      indicatorColor: lightScheme.primaryContainer,
      surfaceTintColor: lightScheme.surfaceTint,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return lightTextTheme.labelMedium?.copyWith(
            color: lightScheme.onPrimaryContainer,
          );
        }
        return lightTextTheme.labelMedium?.copyWith(
          color: lightScheme.onSurfaceVariant,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: lightScheme.onPrimaryContainer);
        }
        return IconThemeData(color: lightScheme.onSurfaceVariant);
      }),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightScheme.primaryContainer,
    ),

    cardTheme: CardThemeData(
      color: lightScheme.surface,
      surfaceTintColor: lightScheme.surfaceTint,
    ),

    dividerTheme: DividerThemeData(color: lightScheme.outline),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightScheme.primary,
        foregroundColor: lightScheme.onPrimary,
        textStyle: lightTextTheme.labelLarge,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightScheme.primary,
        textStyle: lightTextTheme.labelLarge,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: lightTextTheme.bodyMedium,
      hintStyle: lightTextTheme.bodyMedium?.copyWith(
        color: lightScheme.onSurfaceVariant,
      ),
      errorStyle: lightTextTheme.bodySmall?.copyWith(color: lightScheme.error),
      helperStyle: lightTextTheme.bodySmall?.copyWith(
        color: lightScheme.onSurfaceVariant,
      ),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: darkScheme,
    fontFamily: FontsApp.vazir,
    textTheme: darkTextTheme,

    appBarTheme: AppBarTheme(
      backgroundColor: darkScheme.surface,
      foregroundColor: darkScheme.onSurface,
      shadowColor: darkScheme.shadow,
      surfaceTintColor: darkScheme.surfaceTint,
      titleTextStyle: darkTextTheme.titleLarge,
      systemOverlayStyle: darkSystemUiOverlayStyle,
    ),

    scaffoldBackgroundColor: darkScheme.surface,

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: darkScheme.surface,
      indicatorColor: darkScheme.primaryContainer,
      surfaceTintColor: darkScheme.surfaceTint,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return darkTextTheme.labelMedium?.copyWith(
            color: darkScheme.onPrimaryContainer,
          );
        }
        return darkTextTheme.labelMedium?.copyWith(
          color: darkScheme.onSurfaceVariant,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return IconThemeData(color: darkScheme.onPrimaryContainer);
        }
        return IconThemeData(color: darkScheme.onSurfaceVariant);
      }),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkScheme.primaryContainer,
    ),

    cardTheme: CardThemeData(
      color: darkScheme.surface,
      surfaceTintColor: darkScheme.surfaceTint,
    ),

    dividerTheme: DividerThemeData(color: darkScheme.outline),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkScheme.primary,
        foregroundColor: darkScheme.onPrimary,
        textStyle: darkTextTheme.labelLarge,
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkScheme.primary,
        textStyle: darkTextTheme.labelLarge,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: darkTextTheme.bodyMedium,
      hintStyle: darkTextTheme.bodyMedium?.copyWith(
        color: darkScheme.onSurfaceVariant,
      ),
      errorStyle: darkTextTheme.bodySmall?.copyWith(color: darkScheme.error),
      helperStyle: darkTextTheme.bodySmall?.copyWith(
        color: darkScheme.onSurfaceVariant,
      ),
    ),
  );
}
