import 'package:flutter/material.dart';

import '../../core/text_styles.dart';

class SectionText extends StatelessWidget {
  const SectionText({
    required this.text,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Text('$text', style: kSection),
    );
  }
}
