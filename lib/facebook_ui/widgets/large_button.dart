import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.callback,
    required this.height,
    required this.width,
    required this.fontSize,
  }) : super(key: key);

  final String text;
  final Widget icon;
  final VoidCallback callback;
  final double height;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextButton(
        onPressed: callback,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0.0),
          backgroundColor:
              MaterialStateProperty.all<Color>(Theme.of(context).buttonColor),
          overlayColor:
              MaterialStateProperty.all<Color>(ThemeData().splashColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            AutoSizeText(
              text,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
