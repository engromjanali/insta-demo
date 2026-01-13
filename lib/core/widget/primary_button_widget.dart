import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButtonWidget extends StatefulWidget {
  final String? text;
  final void Function()? onTap;
  final double? height;
  final double? width;
  final bool border;
  final Color? color;
  final List<Color>? gradientColors;
  final Color? textColor;
  final bool isDisabled;
  final bool isLoading;
  final String? iconSVG;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;

  const PrimaryButtonWidget({
    super.key,
    this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.textColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconSVG,
    this.padding,
    this.borderRadius,
  }) : border = false;

  const PrimaryButtonWidget.border({
    super.key,
    this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.textColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconSVG,
    this.padding,
    this.borderRadius,
  }) : border = true;

  const PrimaryButtonWidget.icon({
    super.key,
    required String this.iconSVG,
    this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.textColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.borderRadius,
  }) : border = false;

  const PrimaryButtonWidget.iconBorder({
    super.key,
    required String this.iconSVG,
    this.text,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.gradientColors,
    this.textColor,
    this.isDisabled = false,
    this.isLoading = false,
    this.padding,
    this.borderRadius,
  }) : border = true;

  @override
  State<PrimaryButtonWidget> createState() => _PrimaryButtonWidgetState();
}

class _PrimaryButtonWidgetState extends State<PrimaryButtonWidget>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails details) => setState(() => _isPressed = true);
  void _onTapUp(TapUpDetails details) => setState(() => _isPressed = false);
  void _onTapCancel() => setState(() => _isPressed = false);

  @override
  Widget build(BuildContext context) {
    final height = widget.height ?? PTheme.buttonHeight;
    final width = widget.width ?? MediaQuery.of(context).size.width;
    final padding = widget.padding ?? EdgeInsets.zero;

    final effectiveGradient =
        widget.gradientColors ??
        [context.theme.primary, context.button!.secondary];

    final backgroundGradient = widget.border || widget.isDisabled
        ? null
        : LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isPressed
                ? [effectiveGradient[1], effectiveGradient[0]]
                : [effectiveGradient[0], effectiveGradient[1]],
          );

    final textColor = widget.border
        ? (widget.color ?? context.theme.primary)
        : widget.textColor ?? context.indicatorColor;

    return Padding(
      padding: padding,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: AnimatedScale(
          duration: const Duration(milliseconds: 400),
          scale: widget.isDisabled ? 0.98 : 1, // tiny lock effect
          curve: Curves.easeOut,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: height,
            width: widget.isLoading ? height : width,
            decoration: BoxDecoration(
              borderRadius:
                  widget.borderRadius ??
                  BorderRadius.circular(
                    widget.isLoading ? height / 2 : PTheme.buttonborderRadius,
                  ),
              gradient: backgroundGradient,
              color: widget.isDisabled
                  ? (widget.color ?? context.theme.primary).withValues(
                      alpha: 0.5,
                    )
                  : widget.border || backgroundGradient != null
                  ? null
                  : (widget.color ?? context.theme.primary),
              border: widget.border
                  ? Border.all(color: widget.color ?? context.theme.primary)
                  : null,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: widget.isDisabled || widget.isLoading
                    ? null
                    : widget.onTap,
                onTapDown: widget.isDisabled ? null : _onTapDown,
                onTapUp: widget.isDisabled ? null : _onTapUp,
                onTapCancel: widget.isDisabled ? null : _onTapCancel,
                borderRadius:
                    widget.borderRadius ??
                    BorderRadius.circular(
                      widget.isLoading ? height / 2 : PTheme.buttonborderRadius,
                    ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: widget.isDisabled
                      ? 0.5
                      : 1.0, // fade instead of jump
                  child: IgnorePointer(
                    // ✅ block taps safely
                    ignoring: widget.isDisabled,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: widget.isLoading
                            ? SizedBox(
                                height: 24.h,
                                width: 24.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.5.w,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    context.indicatorColor!,
                                  ),
                                ),
                              )
                            : FittedBox(
                                // ✅ smooth + respects AnimatedSize width
                                fit: BoxFit.scaleDown,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (widget.iconSVG != null)
                                      SvgPicture.asset(
                                        widget.iconSVG ?? "",
                                        height: 24.h,
                                      ),
                                    if (widget.iconSVG != null &&
                                        widget.text != null)
                                      const SizedBox(width: 8),
                                    if (widget.text != null)
                                      Text(
                                        widget.text!,
                                        key: ValueKey(widget.text),
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
