import 'package:flutter/material.dart';

class MoreActionWidget extends StatelessWidget {
  final String actionName;
  final IconData actionIcon;

  const MoreActionWidget({
    super.key,
    required this.actionName,
    required this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [Icon(actionIcon), Text(actionName)]);
  }
}
