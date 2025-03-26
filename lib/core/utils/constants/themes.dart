import 'package:figner_print_auth/core/utils/resources/color_manager.dart';
import 'package:flutter/material.dart';

class ProjectThemes {
  static ThemeData lightTheme = ThemeData(
    listTileTheme: const ListTileThemeData(
      iconColor: ColorManager.black,
    ),
    primaryColorLight: ColorManager.black,
    dropdownMenuTheme: DropdownMenuThemeData(
      textStyle: const TextStyle(
        color: ColorManager.black,
      ),
      menuStyle: MenuStyle(
        backgroundColor:
            WidgetStateProperty.all<Color?>(ColorManager.greylight),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.whiteColor,
      iconTheme: IconThemeData(color: ColorManager.black),
      actionsIconTheme: IconThemeData(color: ColorManager.black),
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: ColorManager.black),
    primaryColor: ColorManager.black,
    canvasColor: ColorManager.whiteColor,
    scaffoldBackgroundColor: ColorManager.lightScafold,
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorManager.darkScafold,
      iconTheme: IconThemeData(color: ColorManager.whiteColor),
      actionsIconTheme: IconThemeData(color: ColorManager.whiteColor),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      textStyle: TextStyle(
        color: ColorManager.whiteColor,
      ),
      menuStyle: MenuStyle(),
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(color: ColorManager.whiteColor),
    primaryColor: ColorManager.whiteColor,
    canvasColor: ColorManager.darkScafold,
    scaffoldBackgroundColor: ColorManager.darkScafold,
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );
}
