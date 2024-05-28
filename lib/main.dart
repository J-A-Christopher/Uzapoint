import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uza_point/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: FlexThemeData.light(
        colors: const FlexSchemeColor(
          primary: Color(0xffe0b6ff),
          primaryContainer: Color(0xffffdbcb),
          secondary: Color(0xff8a20d5),
          secondaryContainer: Color(0xfff58d1d),
          tertiary: Color(0xffebdeff),
          tertiaryContainer: Color(0xff52555a),
          appBarColor: Color(0xfff58d1d),
          error: Color(0xffb00020),
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: false,
          tintedDisabledControls: false,
          blendOnColors: false,
          useTextTheme: true,
          elevatedButtonSchemeColor: SchemeColor.onSecondaryContainer,
          elevatedButtonSecondarySchemeColor: SchemeColor.primary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedBorderIsColored: false,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          dialogBackgroundSchemeColor: SchemeColor.surface,
          useInputDecoratorThemeInDialogs: true,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.primary,
          bottomSheetBackgroundColor: SchemeColor.primaryContainer,
          bottomSheetModalBackgroundColor: null,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
          keepPrimary: true,
          keepSecondary: true,
          keepTertiary: true,
        ),
        tones: FlexTones.jolly(Brightness.light),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      darkTheme: FlexThemeData.dark(
        colors: const FlexSchemeColor(
          primary: Color(0xffe0b6ff),
          primaryContainer: Color(0xff005313),
          secondary: Color(0xff8a20d5),
          secondaryContainer: Color(0xff872100),
          tertiary: Color(0xffebdeff),
          tertiaryContainer: Color(0xff314380),
          appBarColor: Color(0xff872100),
          error: Color(0xffcf6679),
        ),
        subThemesData: const FlexSubThemesData(
          interactionEffects: false,
          tintedDisabledControls: false,
          useTextTheme: true,
          elevatedButtonSchemeColor: SchemeColor.onSecondaryContainer,
          elevatedButtonSecondarySchemeColor: SchemeColor.primary,
          outlinedButtonSchemeColor: SchemeColor.onPrimaryContainer,
          outlinedButtonOutlineSchemeColor: SchemeColor.primary,
          inputDecoratorBorderType: FlexInputBorderType.underline,
          inputDecoratorUnfocusedBorderIsColored: false,
          alignedDropdown: true,
          tooltipRadius: 4,
          tooltipSchemeColor: SchemeColor.inverseSurface,
          tooltipOpacity: 0.9,
          dialogBackgroundSchemeColor: SchemeColor.surface,
          useInputDecoratorThemeInDialogs: true,
          snackBarElevation: 6,
          snackBarBackgroundSchemeColor: SchemeColor.primary,
          bottomSheetBackgroundColor: SchemeColor.primaryContainer,
          bottomSheetModalBackgroundColor: null,
          navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedLabel: false,
          navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationBarMutedUnselectedIcon: false,
          navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationBarIndicatorOpacity: 1.00,
          navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedLabel: false,
          navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
          navigationRailMutedUnselectedIcon: false,
          navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
          navigationRailIndicatorOpacity: 1.00,
          navigationRailBackgroundSchemeColor: SchemeColor.surface,
          navigationRailLabelType: NavigationRailLabelType.none,
        ),
        keyColors: const FlexKeyColors(
          useSecondary: true,
          useTertiary: true,
        ),
        tones: FlexTones.jolly(Brightness.dark),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
        fontFamily: GoogleFonts.notoSans().fontFamily,
      ),
      //themeMode: ThemeMode.system,
      themeMode: ThemeMode.light,
    );
  }
}
