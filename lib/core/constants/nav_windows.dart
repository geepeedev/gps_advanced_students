import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowsButtons extends StatelessWidget {
  const WindowsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Row(
        children: [
          Expanded(
            child: MoveWindow(),
          ),
          LimitedBox(
            child: Row(
              children: [
                MinimizeWindowButton(),
                MaximizeWindowButton(),
                CloseWindowButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
