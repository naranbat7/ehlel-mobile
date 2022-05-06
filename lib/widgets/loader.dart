import 'package:ehlel/global_keys.dart';
import 'package:ehlel/providers/index.dart';
import 'package:flutter/material.dart';

class LoaderWidget {
  static BuildContext get context => GlobalKeys.navigatorKey.currentContext!;

  static void showLoadingDialog({String? message}) {
    if (!MainProvider.provider.isLoading) {
      MainProvider.provider.setLoading(true);
      showDialog(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.8),
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const CircularProgressIndicator(color: Colors.white),
                    ),
                    message != null ? Text(message) : const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }

  static void hideLoadingDialog() {
    if (MainProvider.provider.isLoading) {
      MainProvider.provider.setLoading(false);
      Navigator.pop(context);
    }
  }
}
