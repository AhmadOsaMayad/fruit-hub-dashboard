import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/widgets/custom_checkbox.dart';
import 'package:fruithub_dashboard/core/widgets/tappable_suffix_text.dart';
import 'package:fruithub_dashboard/generated/l10n.dart';

class IsFeaturedCheckBox extends StatefulWidget {
  const IsFeaturedCheckBox({super.key, required this.onChanged});
  final ValueChanged onChanged;

  @override
  State<IsFeaturedCheckBox> createState() => _IsFeaturedCheckBoxState();
}

class _IsFeaturedCheckBoxState extends State<IsFeaturedCheckBox> {
  bool isItemFeatured = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckbox(
          onChecked: (value) {
            isItemFeatured = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isItemFeatured,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TappableSuffixText(
            textAlign: TextAlign.start,
            prefix: S.of(context).assignAs,
            suffix: S.of(context).featuredProduct,
            onTap: () {
              isItemFeatured = !isItemFeatured;
              widget.onChanged(isItemFeatured);
              setState(() {});
            },
          ),
        ),
      ],
    );
  }
}
