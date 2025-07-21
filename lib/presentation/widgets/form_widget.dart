import 'package:chickenman/presentation/them/them.dart';
import 'package:flutter/services.dart';

class FormWidget {
  static final double _width = 332;
  static final double _standardHeight = 51;
  static final double _descriptionHeight = 108;

  static Widget textFieldForm(FormFieldConfig config) =>
      _buildTextFieldWrapper(config: config, child: _buildTextField(config));

  static Widget textFieldIcon(FormFieldConfig config) => _buildTextFieldWrapper(
    config: config,
    child: Row(
      children: [
        Expanded(child: _buildTextField(config)),
        SizedBox(width: 10.31.w),
        config.icon,
      ],
    ),
  );

  static Widget descriptionTextField(FormFieldConfig config) => Column(
    children: [
      Padding(
        padding: EdgeInsets.only(top: 14.h, bottom: 8.h),
        child: SizedBox(
          width: _width.w,
          child: Text(config.title, style: textStyleFieldTitle),
        ),
      ),
      Container(
        height: _descriptionHeight.h,
        width: _width.w,
        decoration: textFieldDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: _buildTextField(
            config.copyWith(keyboardType: TextInputType.multiline),
          ),
        ),
      ),
    ],
  );

  static Widget _buildTextFieldWrapper({
    required FormFieldConfig config,
    required Widget child,
  }) => Column(
    children: [
      SizedBox(
        width: _width.w,
        child: Text(config.title, style: textStyleFieldTitle),
      ),
      Container(
        height: _standardHeight.h,
        width: _width.w,
        decoration: textFieldDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Center(child: child),
        ),
      ),
    ],
  );

  static Widget _buildTextField(FormFieldConfig config) => TextField(
    focusNode: config.focusNode,
    controller: config.controller,
    inputFormatters: config.inputFormat,
    decoration: InputDecoration(
      isDense: true,
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      hintText: config.hint,
      hintStyle: textStyleFieldHint,
    ),
    keyboardType: config.keyboardType,
    cursorColor: Colors.black,
    style: textStyleField,
    onChanged: config.onChanged,
  );
}

class FormFieldConfig {
  final String title;
  final TextEditingController controller;
  final Widget icon;
  final String? hint;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final void Function(String)? onChanged;
  List<TextInputFormatter>? inputFormat;

  FormFieldConfig({
    required this.title,
    required this.controller,
    this.icon = const Icon(Icons.edit),
    this.hint,
    this.focusNode,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.inputFormat,
  });

  FormFieldConfig copyWith({
    String? title,
    TextEditingController? controller,
    Widget? icon,
    String? hint,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    List<TextInputFormatter>? inputFormat,
  }) {
    return FormFieldConfig(
      title: title ?? this.title,
      controller: controller ?? this.controller,
      icon: icon ?? this.icon,
      hint: hint ?? this.hint,
      focusNode: focusNode ?? this.focusNode,
      keyboardType: keyboardType ?? this.keyboardType,
      onChanged: onChanged ?? this.onChanged,
      inputFormat: inputFormat ?? inputFormat,
    );
  }
}
