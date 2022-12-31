import 'package:flutter/material.dart';
import 'package:google_flutter/widgets/footer_text.dart';

class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: const [
        FooterText(title: 'About'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'Advertising'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'Business'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'How search works'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'Privacy'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'Terms'),
        SizedBox(
          width: 10,
        ),
        FooterText(title: 'Setting'),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
