import 'package:applications/screens/custom/customsmalltext.dart';
import 'package:flutter/material.dart';

class CustomCheckBox<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final ValueChanged<T?> onChanged;

  const CustomCheckBox({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: _customRadioButton,
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          boxShadow: !isSelected
              ? []
              : [
                  const BoxShadow(
                    color: Colors.orange,
                    blurStyle: BlurStyle.outer,
                    blurRadius: 0.5,
                    spreadRadius: 0.1,
                  ),
                ],
          border: isSelected
              ? Border.all(
                  width: 1,
                  color: Colors.orange,
                )
              : Border.all(
                  width: 1,
                  color: Colors.grey,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Row(
            children: [
              isSelected
                  ? const Icon(
                      Icons.circle,
                      color: Colors.orange,
                      size: 12,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: Colors.grey,
                      size: 12,
                    ),
              const SizedBox(width: 10),
              Expanded(
                child: CustomeSmallText(
                  text: title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
