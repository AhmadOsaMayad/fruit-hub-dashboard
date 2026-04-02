import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_colors.dart';
import 'package:fruithub_dashboard/core/utils/constants.dart';
import 'package:intl/intl.dart' as m_intl;

class DpHelper {
  static Future<DateTime?> showDP(
    BuildContext context,
    DateTime initDate,
    DateTime firstDate,
    DateTime lastDate,
  ) {
    return showDatePicker(
      context: context,
      initialDate: initDate,
      firstDate: firstDate,
      lastDate: lastDate,

      builder: (BuildContext context, Widget? child) {
        return dpTheme(context, child!);
      },
    );
  }

  static Theme dpTheme(BuildContext context, Widget child) => Theme(
    data: Theme.of(context).copyWith(
      datePickerTheme: const DatePickerThemeData(
        headerBackgroundColor: AppColors.primary,
        headerForegroundColor: Colors.white,
      ),
      colorScheme: const ColorScheme.light(
        outlineVariant: AppColors.primary,
        primary: AppColors.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: AppColors.primary),
      ),
    ),
    child: child,
  );
  static String date2str(DateTime date) =>
      m_intl.DateFormat(kDefDateFormat).format(date).toString();

  static DateTime str2date(String date) =>
      m_intl.DateFormat(kDefDateFormat).parse(date);

  // static InputDecoration dpInputDeco() {
  //   final base = Themer.custInputDeco(hintText: 'يوم-شهر-سنة');
  //   return base.copyWith(prefixIcon: const Icon(Icons.edit_calendar));
  // }
}
