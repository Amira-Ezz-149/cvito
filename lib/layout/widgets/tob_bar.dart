import 'package:flutter/material.dart';

import 'constants_color.dart';
import 'basic_constant_text.dart';

class TobBar extends StatelessWidget {
  TobBar({required this.Text});
  String? Text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          IconButton(
              color: kGrayColor,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back)),
          SizedBox(width: MediaQuery.of(context).size.width / 20),
          Expanded(
              child: text(
                  text: Text,
                  size: 24,
                  fontWeight: FontWeight.w700,
                  colors: kGrayColor)),
        ],
      ),
    );
  }
}
