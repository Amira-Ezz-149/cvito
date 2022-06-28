import 'package:flutter/material.dart';
import 'constants_color.dart';
import 'text_field_search.dart';
class TobBarSearch extends StatelessWidget {
  const TobBarSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            color: kGrayColor,
            onPressed: () {},
            icon: const Icon(Icons.arrow_back)),
        SizedBox(width: MediaQuery.of(context).size.width / 20),
        Expanded(
          child:  textFormField(
              radious: 3,
              controller: TextEditingController(),
              type: TextInputType.text,
              onChanged: () {},
              hint: "Search",
              color: kBoxColor,
            //prefix: Icons.search
          ),
        ),],
    );
  }
}
