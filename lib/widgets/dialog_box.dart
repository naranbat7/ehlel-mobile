import 'package:ehlel/widgets/button.dart';
import 'package:flutter/material.dart';

enum DialogType {
  success,
  failed,
  warning,
}

extension ToString on DialogType {
  String toValue() {
    return toString().split('.').last;
  }
}

class DialogBox extends StatefulWidget {
  final String? title, body, btnText;
  final DialogType type;

  const DialogBox({
    Key? key,
    this.title,
    this.body,
    this.btnText,
    this.type = DialogType.success,
  }) : super(key: key);

  @override
  _DialogBoxState createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 5),
        Visibility(
          visible: widget.title != null && widget.title!.isNotEmpty,
          child: Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              widget.title ?? "",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Visibility(
          visible: widget.body != null && widget.body!.isNotEmpty,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              widget.body ?? "",
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6),
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: Button(
            title: widget.btnText ?? "Хаах",
            onPress: () => Navigator.of(context).pop(true),
          ),
        ),
      ],
    );
  }
}
