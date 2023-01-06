import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme.dart';

class SfTextField extends StatefulWidget {
  const SfTextField({
    super.key,
    this.labelStyle,
    this.hintText,
    this.controller,
    this.onChanged,
    this.inputFormatter,
    this.validator,
    this.keyboardType,
    this.maxLength,
    this.showRequired = false,
    this.textCapitalization,
    this.enabledBorder,
    this.globalKey,
    this.suffixIcon,
    this.iconTitle,
    this.obscureText = false,
    this.focusNode,
    this.counterText,
    this.focusedBorder,
    this.contentPadding,
    this.prefixIcon,
    this.disabledBorder,
    this.hintStyle,
    this.fillColor,
    this.errorText,
    this.errorBorder,
    this.textStyle,
    this.textInputAction,
    this.onTap,
    this.border,
    this.errorStyle,
    this.showToast,
    this.suffixText,
    this.isShowToast = false,
    this.isShowTitle = true,
    this.readOnly = false,
    this.enable = true,
    this.isDense = true,
    this.showIcon = false,
    this.autofocus = false,
    this.label,
    this.maxLines = 1,
    this.defaultText,
  });

  final GlobalKey? globalKey;
  final String? defaultText;
  final String? hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatter;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool showRequired;
  final bool showIcon;
  final bool isShowTitle;
  final TextCapitalization? textCapitalization;
  final InputBorder? enabledBorder;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Widget? iconTitle;
  final bool? obscureText;
  final bool isShowToast;
  final bool enable;
  final bool isDense;
  final bool autofocus;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool readOnly;
  final String? counterText;
  final String? errorText;
  final String? suffixText;
  final String? label;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? disabledBorder;
  final InputBorder? errorBorder;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final TextStyle? errorStyle;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final GestureTapCallback? onTap;
  final Function(String? error)? showToast;

  @override
  State<SfTextField> createState() => _SfTextField();
}

class _SfTextField extends State<SfTextField> {
  String? _msgError;
  final TextEditingController _controller = TextEditingController();

  TextStyle get lableTextStyle {
    return widget.labelStyle ??
        Theme.of(context).textTheme.labelLarge!.apply(fontWeightDelta: 2);
  }

  TextStyle get textFieldStyle {
    return widget.textStyle ??
        (widget.enable
            ? Theme.of(context).textTheme.bodyLarge!
            : Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .color
                    ?.withOpacity(0.5)));
  }

  TextStyle get hintTextStyle {
    return widget.hintStyle ??
        (widget.enable
            ? Theme.of(context).textTheme.labelMedium!
            : Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .color
                    ?.withOpacity(0.5)));
  }

  @override
  void initState() {
    if ((widget.defaultText ?? '').isNotEmpty == true) {
      _editingController.text = widget.defaultText ?? '';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextField(
              scrollPadding: const EdgeInsets.only(
                bottom: 150,
                top: 50,
              ),
              obscureText: widget.obscureText ?? false,
              cursorColor: AppColor.grey600,
              cursorHeight: 24,
              textCapitalization:
                  widget.textCapitalization ?? TextCapitalization.none,
              inputFormatters: widget.inputFormatter,
              controller: _editingController,
              autocorrect: false,
              autofocus: widget.autofocus,
              onTap: onTap,
              enabled: widget.enable,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              style: textFieldStyle,
              onChanged: widget.onChanged,
              keyboardType: widget.keyboardType ?? TextInputType.text,
              maxLines: widget.maxLines,
              focusNode: widget.focusNode,
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                suffixText: widget.suffixText,
                errorText: widget.errorText,
                isDense: widget.isDense,
                border: widget.border,
                counterText: widget.counterText ?? '',
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(color: AppColor.grey600),
                ),
                enabledBorder: widget.enabledBorder ??
                    const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(color: AppColor.grey600),
                    ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(
                    color: AppColor.grey600.withOpacity(0.5),
                    width: 2,
                  ),
                ),
                errorBorder: widget.errorBorder ??
                    const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.0),
                      ),
                      borderSide: BorderSide(
                        color: AppColor.error700,
                        width: 2,
                      ),
                    ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.0),
                  ),
                  borderSide: BorderSide(
                    color: AppColor.error700,
                    width: 2,
                  ),
                ),
                label: _buildLabel(),
                labelStyle: lableTextStyle,
                contentPadding: widget.contentPadding ??
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                fillColor: widget.fillColor ?? AppColor.transparent,
                prefixIconConstraints: const BoxConstraints(),
                suffixIconConstraints: const BoxConstraints(),
                hintText: widget.hintText,
                prefixIcon: widget.prefixIcon,
                hintStyle: hintTextStyle,
                suffixIcon: widget.suffixIcon,
                floatingLabelBehavior:
                    (widget.hintText ?? '').isNotEmpty == true
                        ? FloatingLabelBehavior.always
                        : null,
              ),
              maxLength: widget.maxLength,
            ),
            if (_msgError != null && !widget.isShowToast)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  _msgError!,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: widget.errorStyle ??
                      Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: Theme.of(context).errorColor,
                          ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel() {
    return IntrinsicWidth(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                if (widget.isShowTitle)
                  Text(
                    widget.label ?? '',
                    style: lableTextStyle,
                  ),
                if (widget.showRequired)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text('*',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: Theme.of(context).errorColor,
                                )),
                  ),
              ],
            ),
          ),
          if (widget.showIcon) widget.iconTitle ?? const SizedBox(),
        ],
      ),
    );
  }

  bool checkValidate() {
    if (widget.validator != null) {
      setState(() {
        _msgError = widget.validator!(_editingController.text);
        if (widget.isShowToast && _msgError != null) {
          widget.showToast!(_msgError);
        }
      });
    }
    return _msgError == null;
  }

  void resetValide() {
    setState(() {
      _msgError = null;
    });
  }

  void onTap() {
    if (_msgError != null) {
      setState(() {
        _msgError = null;
      });
    }
  }

  void showError(String? value) {
    setState(() {
      _msgError = value;
    });
  }

  TextEditingController get _editingController =>
      widget.controller ?? _controller;

  String get text => _editingController.text;
}
