import 'package:comments_app/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField(
      {super.key,
      required this.isEnabled,
      this.text,
      required this.height,
      required this.width,
      required this.controller,
      this.onChanged,
      this.validator,
      this.inputFormatters,
      this.isMultiline,
      this.keyboardType,
      this.label,
      this.prefixText,
      this.prefixTextStyle,
      this.hintTextStyle,
      this.isRequired,
      this.borderSide});
  final bool isEnabled;
  final TextEditingController controller;
  final String? text;
  final double width;
  final double height;
  final double borderRadius = 10;
  final double contentPadding = 10;
  final Function? onChanged;
  final Function? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isMultiline;
  final TextInputType? keyboardType;
  final String? label;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final TextStyle? hintTextStyle;
  final BorderSide? borderSide;
  final bool? isRequired;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        autocorrect: true,
        controller: controller,
        validator: validator != null
            ? (value) {
                validator!();
                return null;
              }
            : (isRequired == true
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    }
                    return null;
                  }
                : null),
        textAlign: TextAlign.start,
        textInputAction: isMultiline == true ? null : TextInputAction.next,
        inputFormatters: inputFormatters,
        maxLines: isMultiline == true ? 4 : 1,
        keyboardType: keyboardType,
        onChanged: onChanged != null
            ? (text) async {
                await onChanged!();
              }
            : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: borderSide ?? const BorderSide(color: kcSecondaryColor),
          ),
          prefixText: prefixText,
          prefixStyle: prefixTextStyle ?? hintTextStyle,
          hintText: text != null
              ? text?.toLowerCase() == "otp" && !isEnabled
                  ? "Enter number above to get otp"
                  : text
              : null,
          hintStyle: hintTextStyle,
          labelStyle: isEnabled ? null : const TextStyle(color: Colors.white),
          label: label != null
              ? Align(
                  alignment: Alignment.center,
                  child: Text(
                    label!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: kcBlack),
                  ),
                )
              : null,
          alignLabelWithHint: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          enabled: isEnabled,
          contentPadding: EdgeInsets.all(contentPadding),
          fillColor: isEnabled ? kcWhite : kcSecondaryColorDark,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide:
                borderSide ?? const BorderSide(color: kcWhite, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
      ),
    );
  }
}
