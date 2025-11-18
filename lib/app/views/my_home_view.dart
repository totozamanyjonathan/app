import 'package:app/app/widgets/more_action_widget.dart';
import 'package:flutter/material.dart';

class MyHomeView extends StatelessWidget {
  const MyHomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20.0,
              children: [
                MoreActionWidget(actionName: "SEND", actionIcon: Icons.send),
                MoreActionWidget(actionName: "SAVE", actionIcon: Icons.save),
                MoreActionWidget(actionName: "SHARE", actionIcon: Icons.share),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
