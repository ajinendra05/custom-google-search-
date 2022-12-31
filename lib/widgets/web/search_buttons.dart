import 'package:flutter/material.dart';
import 'package:google_flutter/widgets/web/search_button.dart';

import '../translation_buttons.dart';

class SearchButtons extends StatelessWidget {
  const SearchButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SearchButton(
              title: 'Google Search',
            ),
            SizedBox(
              width: 10,
            ),
            SearchButton(
              title: 'I\'m feeling lucky',
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ],
    );
  }
}
