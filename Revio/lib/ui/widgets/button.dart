import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color color;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    this.icon,
    required this.text,
    required this.color,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            )),
            fixedSize: MaterialStateProperty.all<Size>(Size(300, 60)),
            backgroundColor: MaterialStateProperty.all<Color>(color)),
        child: buildContent(),
        onPressed: onClicked,
      );

  Widget buildContent() {
    if (icon != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 28, color: Colors.black),
          SizedBox(width: 16),
          Text(
            text,
            style: TextStyle(fontSize: 22, color: Colors.black),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 28, color: Colors.black),
          ),
        ],
      );
    }
  }
}
