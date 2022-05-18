import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/src/configs/configs.dart';

class WidgetInput extends StatefulWidget {
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final FormFieldValidator<String>? validator;
  final TextStyle? style;
  final bool obscureText;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final EdgeInsets? padding;
  final double? radius;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;
  const WidgetInput({
    Key? key,
    this.textInputType,
    this.controller,
    this.textAlign,
    this.validator,
    this.style,
    this.obscureText = false,
    this.onTap,
    this.inputFormatters,
    this.maxLines,
    this.padding,
    this.radius,
    this.onFieldSubmitted,
    this.onChanged,
  }) : super(key: key);

  @override
  State<WidgetInput> createState() => _WidgetInputState();
}

class _WidgetInputState extends State<WidgetInput> {
  InputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(3),
    borderSide: BorderSide(color: AppColors.grey3F),
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HEIGHT_INPUT,
      child: TextFormField(
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onTap: widget.onTap,
        style: widget.style ?? AppTextStyles.normalRegular.copyWith(fontSize: 14, color: Colors.black),
        controller: widget.controller,
        textAlign: widget.textAlign ?? TextAlign.start,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        maxLines: widget.maxLines,
        cursorColor: Colors.black,
        cursorWidth: 1,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
            enabledBorder: border,
            focusedBorder:
                border.copyWith(borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }
}
