import 'package:flutter/material.dart';

OutlineInputBorder outlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    borderSide: BorderSide(
        color: color,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignCenter),
  );
}
