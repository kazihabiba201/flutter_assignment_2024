

import 'package:flutter/material.dart';

const buttonHeight = 55.0;
const borderRadius = BorderRadius.all(Radius.circular(borderRadiusPoint));
const borderRadiusPoint = 8.0;
const screenMarginPoint = 20.0;

screenMargin(
  BuildContext context, {
  double point = screenMarginPoint,
  double? bottom,
}) =>
    EdgeInsets.fromLTRB(point, 0, point, bottom ?? MediaQuery.of(context).padding.bottom + 10);
const screenMarginAllSide = EdgeInsets.all(16);