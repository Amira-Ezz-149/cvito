import 'package:cvito/constants/constants.dart';
import 'package:flutter/material.dart';

class EditRow extends StatelessWidget {
  IconData icon;
  String label;

  EditRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
              color: kCustomBlack,
              fontSize: 18.0,
              decorationColor: kCustomBlack,
              fontWeight: FontWeight.w400),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: kCustomBlack,
          ),
        )
      ],
    );
  }
}