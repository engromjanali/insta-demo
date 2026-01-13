
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/utils.dart';
import 'package:insta/core/util/dimensions.dart';
import 'package:insta/core/util/style.dart';
import 'package:insta/core/widget/dimensions_widget.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String? initialText;
  final String? label;
  final String? hintText;
  final String? prefixIconPath;
  final Widget? prefix;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obsecureText;
  final bool enable;
  final Function()? onTap;
  final Function(String)? onChanged;
  final bool autoDispose;
  final TextInputType? keyboardType;
  final bool isRequired;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final AutovalidateMode? autovalidateMode;
  const CustomTextFieldWidget({
    super.key,
    this.label,
    this.hintText,
    this.prefixIconPath,
    this.prefix,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.enable = true,
    this.onTap,
    this.onChanged,
    this.autoDispose = true,
    this.keyboardType,
    this.initialText,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.expands,
    this.autovalidateMode,
  }) : obsecureText = false,
       isRequired = false;

  const CustomTextFieldWidget.obsecureText({
    super.key,
    this.label,
    this.hintText,
    this.prefixIconPath,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.prefix,
    this.enable = true,
    this.onTap,
    this.onChanged,
    this.autoDispose = true,
    this.keyboardType,
    this.initialText,
    this.focusNode,
    this.isRequired = true,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.expands,
    this.autovalidateMode,
  }) : obsecureText = true;
  const CustomTextFieldWidget.requiredField({
    super.key,
    this.label,
    this.hintText,
    this.prefixIconPath,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.prefix,
    this.enable = true,
    this.onTap,
    this.onChanged,
    this.autoDispose = true,
    this.keyboardType,
    this.initialText,
    this.focusNode,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction = TextInputAction.next,
    this.expands,
    this.autovalidateMode,
  }) : obsecureText = false,
       isRequired = true;

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  late final ValueNotifier<bool> obsecureText = ValueNotifier<bool>(
    widget.obsecureText,
  );
  TextEditingController? _controller;
  bool _isControllerOwner = false; // 🔹 tracking ownership

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller;
    } else {
      _controller = TextEditingController(text: widget.initialText);
      _isControllerOwner = true;
    }
  }

  @override
  void dispose() {
    if (_isControllerOwner) {
      _controller?.dispose(); // ✅ only dispose if we created it
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Widget constant = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if ((widget.label)!=null)
          Row(
            children: [
              Text(widget.label!, style: context.textTheme?.labelMedium),
              if (widget.isRequired)
                Text(
                  " *",
                  style: interBold.copyWith(
                    fontSize: Dimensions.fontSizeSmall,
                    color: context.theme.colorScheme.error,
                  ),
                ),
            ],
          ).paddingOnly(bottom: Dimensions.paddingSizeDefault),
          Expanded(
            flex: widget.expands ?? false ? 1 : 0,
            child: ValueListenableBuilder<bool>(
          valueListenable: obsecureText,
          builder: (_, value, __) {
            return _textField();
          },
        )),
        GapY(value:  10),
      ],
    );
    return widget.expands ?? false ? Expanded(child: constant) : constant;
  }

  Widget _textField() {
    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      validator: (v) {
        final validation = widget.validator?.call(v);

        if (validation != null) {
          return validation;
        }

        if (widget.isRequired && (v == null || v.isEmpty)) {
          return "Please enter ${widget.label}";
        }
        return null;
      },
      expands: widget.expands ?? false,
      obscureText: obsecureText.value,
      controller: _controller,
      readOnly: !widget.enable,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      autovalidateMode:
          widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
      textInputAction: widget.textInputAction,
      style: context.textTheme?.titleLarge?.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: context.theme.canvasColor,
        prefixIconConstraints: BoxConstraints(maxHeight: 17),
        errorStyle: context.textTheme?.labelSmall?.copyWith(
          color: context.theme.colorScheme.error,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Dimensions.radiusDefault)
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: widget.prefixIconPath == null ? 10 : 0.0,
        ),
        hintText:
            widget.hintText ??
            (widget.label == null ? null : "Enter ${widget.label}"),
        prefixIcon: widget.prefix != null
            ? widget.prefix!
            : widget.prefixIconPath == null
            ? null
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.paddingSizeDefault - 5),
                child: SvgPicture.asset(
                  widget.prefixIconPath!,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(
                    context.theme.primaryColor!,
                    BlendMode.srcIn,
                  ),
                ),
              ),
        suffixIcon: widget.obsecureText
            ? InkWell(
                onTap: () {
                  obsecureText.value = !obsecureText.value;
                },
                child: Icon(
                  obsecureText.value ? Icons.visibility_off : Icons.visibility,
                ),
              )
            : widget.suffixIcon,
      ),
    );
  }
}
