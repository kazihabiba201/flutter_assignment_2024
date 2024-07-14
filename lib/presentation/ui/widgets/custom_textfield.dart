import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  // ------ Label ----------
  final String? label;
  final TextStyle? labelTextStyle;
  final String? helperText;
  final TextStyle? helperTextStyle;
  // ------ TextField ------
  final String? hinttext;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isEnable;
  final bool isReadOnly;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? textInputType;
  final Iterable<String>? autofillHints;
  final TextInputType? keyboardType;
  final TextInputAction? textInputActionl;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final String? Function(String?)? validator;
  final TextAlign textAlign = TextAlign.start;
  final TextAlignVertical? textAlignVertical;
  final TextStyle? style;
  final int? maxLength;
  // ------ Decoration ------
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  // ------ Border ------
  final InputBorder? border;
  final InputBorder? enabledBorder;
  const MyTextField({
    super.key,
    required this.controller,
    this.label,
    this.hinttext,
    this.labelTextStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.autofillHints,
    this.isEnable = true,
    this.isReadOnly = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.textInputType,
    this.keyboardType,
    this.textInputActionl,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.onTapOutside,
    this.validator,
    this.textAlignVertical,
    this.style,
    this.fillColor,
    this.obscureText = false,
    this.contentPadding,
    this.helperText,
    this.helperTextStyle,
    this.border,
    this.enabledBorder,
    this.maxLength,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.label != null) textFieldLabel(widget.label, textStyle: widget.labelTextStyle),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          autofillHints: widget.autofillHints,
          enableIMEPersonalizedLearning: true,
          enableInteractiveSelection: true,
          enableSuggestions: true,
          enabled: widget.isEnable,
          readOnly: !widget.isEnable,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputActionl,
          obscureText: widget.obscureText,
          onChanged: widget.onChanged,
          onEditingComplete: widget.onEditingComplete,
          onFieldSubmitted: widget.onFieldSubmitted,
          onSaved: widget.onSaved,
          onTap: widget.onTap,
          onTapOutside: widget.onTapOutside,
          validator: widget.validator,
          textAlign: widget.textAlign,
          textAlignVertical: widget.textAlignVertical,
          spellCheckConfiguration: const SpellCheckConfiguration(),
          style: widget.style,
          maxLength: widget.maxLength,
          decoration: InputDecoration(
            filled: false,
            fillColor: widget.fillColor ?? Colors.grey,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            prefixIconColor: Colors.grey,
            // suffixIconColor: ,
            hintText: widget.hinttext ?? widget.label,
            enabled: widget.isEnable,
            isDense: true,
            hintMaxLines: 1,
            contentPadding: widget.contentPadding,
            hintStyle: const TextStyle(color:  Color(0xFFA3A59B), fontSize: 14, fontWeight: FontWeight.normal),
            border: widget.border,
            enabledBorder: widget.enabledBorder,
          ),
        ),
        if (widget.helperText != null) textFieldHelper(widget.helperText ?? '', helperTextStyle: widget.helperTextStyle),
      ],
    );
  }
}

textFieldLabel(String? label, {TextStyle? textStyle}) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 1, bottom: 6),
      child: Text(label ?? '', style: textStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 13)),
    );

errorText(String? label, {TextStyle? textStyle}) => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 1),
      child: Text(label ?? '', style: textStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 11, color: Color(0xFFF33333))),
    );

textFieldHelper(String helperText, {TextStyle? helperTextStyle}) => Padding(
      padding: const EdgeInsets.only(left: 5, top: 8),
      child: Text(helperText, style: helperTextStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 13)),
    );
