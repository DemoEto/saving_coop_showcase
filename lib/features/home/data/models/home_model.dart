import 'package:flutter/material.dart';

class WalletCardData {
  final String title;
  final String amount;
  final List<ActionItem> actions;

  const WalletCardData({
    required this.title,
    required this.amount,
    required this.actions,
  });
}

class ActionItem {
  final IconData icon;
  final String label;
  final String? routeName;
  const ActionItem({required this.icon, required this.label, this.routeName});
}