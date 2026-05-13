// lib/feature/general/domain/entities/general_menu_item.dart

import 'package:flutter/material.dart';

/// Domain entity representing a single menu item in the General section.
///
/// Keep this class free of Flutter UI concerns beyond [IconData] and [Color],
/// which are design-system primitives acceptable at the domain layer in
/// Flutter Clean Architecture.
class MenuItem {
  const MenuItem({
    required this.icon,
    required this.label,
    // required this.page,
  });

  final IconData icon;
  final String label;

  /// The destination page widget.
  ///
  /// For larger apps, replace with a named route or [GoRouter] location string
  /// to avoid coupling the domain entity to concrete page widgets.
  // final Widget page;
}
