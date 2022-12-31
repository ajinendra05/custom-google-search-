import 'package:flutter/material.dart';
import 'package:google_flutter/colors.dart';
import 'package:google_flutter/widgets/footer_text.dart';

class WebFooter extends StatelessWidget {
  const WebFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: footerColor,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
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
            ),
          ],
        ),
      ),
    );
  }
}
