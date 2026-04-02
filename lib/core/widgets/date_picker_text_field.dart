import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/helpers/dp_helper.dart';
import 'package:fruithub_dashboard/core/widgets/custom_text_form_field.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class DatePickerTextField extends StatefulWidget {
  final TextEditingController controller;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime initialDate;
  final void Function(DateTime)? onDateSelected;

  DatePickerTextField({
    super.key,
    required this.controller,
    DateTime? firstDate,
    DateTime? lastDate,
    DateTime? initialDate,

    this.onDateSelected,
  }) : firstDate = firstDate ?? DateTime(2000),
       lastDate = lastDate ?? DateTime(2100),
       initialDate = initialDate ?? DateTime.now();

  @override
  State<StatefulWidget> createState() {
    return _DatePickerTextFieldState();
  }
}

@override
State<DatePickerTextField> createState() => _DatePickerTextFieldState();

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  Future<void> _pickDate() async {
    FocusScope.of(context).requestFocus(FocusNode()); // Prevent keyboard

    final DateTime? picked = await DpHelper.showDP(
      context,
      widget.initialDate,
      widget.firstDate,
      widget.lastDate,
    );

    if (picked != null) {
      widget.controller.text = picked.toLocal().toString().split(' ')[0];
      if (widget.onDateSelected != null) {
        widget.onDateSelected!(picked);
      }
    }
  }

  String? _dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return S.of(context).pleaseSelectADate;
    }

    try {
      final selectedDate = DateTime.parse(value);
      final minAllowedDate = DateTime.now().add(const Duration(days: 90));

      if (selectedDate.isBefore(minAllowedDate) ||
          selectedDate.isAtSameMomentAs(minAllowedDate)) {
        return S.of(context).invalidSelectedDate;
      }
    } catch (e) {
      return S.of(context).invalidDateFormat;
    }

    return null; // valid
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      validator: _dateValidator,
      onSaved: (value) {},
      onTap: _pickDate,
      hintText: S.of(context).expDate,
      controller: widget.controller,
      readOnly: true,
    );
  }
}
