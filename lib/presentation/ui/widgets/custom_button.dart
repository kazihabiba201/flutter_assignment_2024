import 'package:flutter/material.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';
import 'package:flutter_assignment_2024/presentation/ui/utility/constant.dart';
import 'package:flutter_assignment_2024/presentation/ui/widgets/custom_loader.dart';

class MyButton extends StatefulWidget {
  // ===== Container =====
  // final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  // ===== Button =====
  final String? label;
  final double? width;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final TextStyle? textStyle;
  final OutlinedBorder? shape;
  final Size? fixedSize;
  final double? elevation;
  final EdgeInsets? contentPadding;
  // ===== Functionality =====
  final void Function()? onPressed;
  final bool isSelected;
  final bool isLoadingComplete;
  final AlignmentGeometry? alignment;
  final bool isButtonOutlined;
  final bool isSelectionButton;
  // ===== Colors =====
  final Color? shadowColor;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? foregroundWhenOutlined;
  final Color? disabledBackgroundColor;
  final Color? disabledForroundColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final Color? surfaceTintColor;
  final Color? borderColor;
  // ===== Loader =====
  final Color? loaderColor;
  final Duration? animationDuration;

  const MyButton({
    super.key,
    // this.constraints = const BoxConstraints.tightFor(width: double.infinity),
    this.margin,
    this.label,
    this.width,
    this.leadingIcon,
    this.trailingIcon,
    this.textStyle,
    this.shape,
    this.fixedSize = const Size.fromHeight(buttonHeight),
    this.elevation = 0,
    this.contentPadding,
    required this.onPressed,
    this.isSelected = true,
    this.isLoadingComplete = true,
    this.alignment,
    this.isButtonOutlined = false,
    this.isSelectionButton = false,
    this.shadowColor = Colors.transparent,
    this.backgroundColor = Pallets.containerColor,
    this.foregroundColor = Pallets.onContainerColor,
    this.foregroundWhenOutlined = Pallets.onSurfaceColor,
    this.disabledBackgroundColor,
    this.disabledForroundColor,
    this.splashFactory,
    this.surfaceTintColor,
    this.borderColor,
    this.loaderColor = Pallets.onSurfaceColor,
    this.animationDuration,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      margin: widget.margin ?? EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: widget.isLoadingComplete ? widget.onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: (widget.isButtonOutlined) ? Colors.transparent : (widget.isSelected ? widget.backgroundColor : widget.foregroundColor),
          foregroundColor:
              (widget.isButtonOutlined) ? widget.foregroundWhenOutlined : (widget.isSelected ? widget.foregroundColor : widget.backgroundColor),
          shape: widget.shape ?? const RoundedRectangleBorder(borderRadius: borderRadius),
          fixedSize: widget.fixedSize,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          elevation: widget.elevation,
          shadowColor: (widget.isButtonOutlined) ? Colors.transparent : widget.shadowColor,
          splashFactory: widget.splashFactory,
          visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
          disabledBackgroundColor: widget.disabledBackgroundColor,
          disabledForegroundColor: widget.disabledForroundColor,
          surfaceTintColor: widget.surfaceTintColor,
          padding: widget.contentPadding ?? ((widget.label == null) ? EdgeInsets.zero : null),
          alignment: Alignment.center,
          animationDuration: widget.animationDuration,
          side: (widget.isButtonOutlined) ? BorderSide(color: widget.borderColor ?? widget.foregroundWhenOutlined ?? Pallets.containerColor) : null,
          textStyle: widget.textStyle ?? const TextStyle(fontWeight: FontWeight.normal, fontSize: 16, height: 0, overflow: TextOverflow.clip),
        ),
        child: (!widget.isLoadingComplete)
            ? myCircularLoader(color: widget.loaderColor, radius: 12)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(right: (widget.leadingIcon != null && widget.label != null) ? 10 : 0), child: widget.leadingIcon),
                  if (widget.label != null) Text(widget.label ?? ''),
                  Padding(padding: EdgeInsets.only(left: (widget.trailingIcon != null && widget.label != null) ? 10 : 0), child: widget.trailingIcon),
                ],
              ),
      ),
    );
  }
}
