import 'package:ehlel/global_keys.dart';
import 'package:ehlel/widgets/dialog_box.dart';
import 'package:flutter/material.dart';

class DialogService {
  static BuildContext get context => GlobalKeys.navigatorKey.currentContext!;

  static void showWarningDialog(String message) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return DialogBox(
          type: DialogType.warning,
          title: "Уучлаарай",
          body: message,
        );
      },
    );
  }
}
