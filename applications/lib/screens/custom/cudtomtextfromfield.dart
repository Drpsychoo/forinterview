import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? suffix;

  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final bool? obscureText, isDense, useLabelAsHint;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines, maxLength;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool enabled;
  final Color? color;
  final TextStyle? style;
  final double? textFieldHeight;
  final double? height;
  final double? width;
  final bool expand;
  final TextStyle? labelStyle;
  final List<TextInputFormatter>? inputFormatters;
  final BorderSide borderSideColor;
  final bool isRequired;
  final void Function()? onEditingComplete;
  final FocusNode? focusNode;

  const CustomTextFormField({
    Key? key,
    this.expand = false,
    this.height,
    this.width,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.textFieldHeight = 100,
    this.labelText,
    this.labelStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Colors.blue,
    ),
    this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.useLabelAsHint = true,
    this.contentPadding,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.enabled = true,
    this.color,
    this.style,
    this.obscureText,
    this.isDense,
    this.maxLines,
    this.suffix,
    this.borderSideColor = const BorderSide(color: Colors.grey, width: 0.0),
    this.isRequired = false,
    this.onEditingComplete,
    this.focusNode,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              labelText ?? '',
              style: labelStyle,
            ),
            Visibility(
              visible: labelText != null && isRequired,
              child: const Text(
                '*',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
        SizedBox(
          height: labelText == null ? (0) : 10,
        ),
        TextFormField(
          expands: expand,
          enabled: enabled,
          keyboardType: keyboardType,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          textInputAction: textInputAction,
          controller: controller,
          validator: validator,
          scrollPadding: const EdgeInsets.all(120),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: borderSideColor,
            ),
            isDense: isDense,
            contentPadding:
                const EdgeInsets.only(left: 20, top: 20, bottom: 20),
            hintText: hintText,
            hintStyle:
                const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
          onFieldSubmitted: onFieldSubmitted,
          obscureText: false,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
        ),
        const SizedBox(
          height: (15),
        ),
      ],
    );
  }
}
