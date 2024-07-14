import 'package:flutter/material.dart';
import 'custom_circle_icon_shape.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final IconData leadingIcon;
  final IconData? actionIcon;
  final Function() onLeadingPressed;
  final Function()? onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leadingIcon,
    this.actionIcon,
    required this.onLeadingPressed,
    this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Container(
        margin: EdgeInsets.only(right: actionIcon != null ? 0 : 20, left: 0),
        child: title,
      ),
      centerTitle: true,
      leading: Container(
        padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 0),
        child: GestureDetector(
          onTap: onLeadingPressed,
          child: roundIconButton(
            isCircular: false,
            size: 20,
            icon: leadingIcon,
          ),
        ),
      ),
      actions: actionIcon != null
          ? [
              Container(
                padding: const EdgeInsets.only(right: 18, top: 8, bottom: 8),
                child: GestureDetector(
                  onTap: onActionPressed,
                  child: roundIconButton(
                    size: 40,
                    showBadge: true,
                    icon: actionIcon!,
                  ),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}