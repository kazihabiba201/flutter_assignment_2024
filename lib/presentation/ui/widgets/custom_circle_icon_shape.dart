import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_assignment_2024/presentation/ui/utility/Pallets.dart';

Widget roundIconButton({
  double? size,
  required IconData icon,
  VoidCallback? onPressed,
  bool showBadge = false,
  bool isCircular = true,
}) {
  return Container(
    width: size ?? 35,
    height: size ?? 35,
    decoration: isCircular
        ? const BoxDecoration(
            color: Pallets.circleContainerColor,
            shape: BoxShape.circle,
          )
        : null,
    child: IconButton(
      icon: showBadge
          ? badges.Badge(
              position: badges.BadgePosition.topEnd(top: 4, end: 3),
              badgeContent: const SizedBox.shrink(),
              badgeStyle: badges.BadgeStyle(
                badgeColor: Pallets.badgeColor,
                borderRadius: BorderRadius.circular(8),
                padding: const EdgeInsets.all(3),
              ),
              child: Icon(icon, color: Colors.black, size: 25),
            )
          : Icon(icon, color: Colors.black, size: 24),
      onPressed: onPressed,
    ),
  );
}

