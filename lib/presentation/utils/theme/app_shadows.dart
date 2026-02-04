import 'package:flutter/material.dart';

class AppShadows {
  static BoxShadow primary = BoxShadow(
    color: Colors.black.withValues(alpha: 0.25),
    blurRadius: 8,
    offset: const Offset(0, 4),
  );
}
